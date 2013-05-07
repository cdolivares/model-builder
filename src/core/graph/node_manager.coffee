###
  Class: NodeManager

  Node Managaer provides an interface for the application to get information about
  the resource graph.  This NodeManager should get
###

class NodeManager

  constructor: () ->



  someOperation: () ->

  someOtherOperation: () ->
  ###
    Method: addChild

    Adds child to a given parent
  ###
  # addChild: (parent, child) ->
  #   console.log "Adding parent - child in NodeManager #{parent} #{child}"
  # ###
  #   Method: orphan

  #   Adds an orphan to the orphaned Node set
  # ###
  # addOrphan: (orphan) ->
  #   console.log "Adding orphan in NodeManager #{orphan}"


  # @::__defineGetter__ 'nodes', () ->
  #   @_nodes


  # getNodes: () ->

module.exports = NodeManager
