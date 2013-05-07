Node = require("./nodes/node")
Edge = require("./nodes/edge")

EDGE_TYPES =
  ONE_ONE:   1
  ONE_MANY:  2
  MANY_ONE:  3
  MANY_MANY: 4


###
  Class: NodeBuilder

  NodeBuilder takes in a schema path and constructs nodes from each of the 
###
class NodeBuilder

  constructor: (schemaPath) ->
    @_schemaPath = schemaPath
    @_nodes = []

  init: () ->
    @_nodeConfigs = require(@_schemaPath)
    @_build()

  ###
    Crude build method.  Uses naive iteration
    and isn't smart. Fix after out
  ###
  _build: () ->
    #first let's initialize all nodes
    for nodeName, nodeDescription of @_nodeConfigs
      n = new Node(nodeName, nodeDescription.serialize())
      n.config()
      @_nodes.push n
    #now let's add each nodes edges
    for node in @_nodes
      #construct each edge by keying off the children
      @_addEdges node

  _addEdges: (node) ->
    if node.children?
      if node.children.one?
        @_addParentChildEdges node, node.children.one, EDGE_TYPES.ONE_ONE, EDGE_TYPES.ONE_MANY
      if node.children.many?
        @_addParentChildEdges node, node.children.many, EDGE_TYPES.MANY_ONE, EDGE_TYPES.MANY_MANY 

  _addParentChildEdges: (node, relArray, type1, type2) =>
    relArray.forEach (childName) =>
      #Edge is either type 1 or 2
      c = _.filter @_nodes, (n) -> n.name is childName
      if c.length is 0
        console.error "Could not find the node instance #{childName}"
        return 
      child = c[0]
      if not child.parents?
        console.error "Node pair relationship #{node.name} - #{child.name} incorrectly configured."
      #figure out if edge is one -> many OR one -> one
      if child.parents? and _.contains(child.parents.one || [], node.name)
        #type one
        edge = new Edge(node, child, type1)
      else if child.parents? and _.contains(child.parents.many || [], node.name)
        #type two
        edge = new Edge(node, child, type2)
      else
        console.error "Node #{node.name} indicated node #{child.name} is a child, but #{child.name} does not belong to #{node.name}"
        return
      node.addChildEdge(edge)
      child.addParentEdge(edge)

module.exports = NodeBuilder
