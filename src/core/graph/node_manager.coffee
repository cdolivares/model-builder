###
  Class: NodeManager

  Node Managaer provides an interface for the application to get information about
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
    _n = _.filter @_nodes, (n) -> 
      n.name is nodeName
    return _n[0]

  @::__defineGetter__ 'nodes', () ->
    return @__nodes


module.exports = NodeManager
