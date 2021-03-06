###
  Class: NodeManager

  Node Manager provides an interface for the application to get information about
  the resource graph.  This NodeManager should get
###

class NodeManager

  constructor: (nodes) ->
    @__nodes = nodes


  getParents: (node) ->
    return node.parents

  getChildren: (node) ->
    return node.children

  find: (nodeName) ->
    _n = _.filter @__nodes, (n) ->
      _.contains([n.name, n.alternateName], nodeName)
    return _n[0]

  @::__defineGetter__ 'nodes', () ->
    return @__nodes


module.exports = NodeManager
