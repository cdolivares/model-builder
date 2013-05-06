###
  Class: Graph

  Class instance exported to client applications.

  Encapsulates the graph data structure among resources
  as well as direct access to the database drivers.
###

class Graph

  constructor: () ->
    @_nodes = []
    @_drivers = {}

  setDrivers: (drivers) ->
    @_drivers = drivers

  setNodeManager: (nodeManager) ->
    @_nodeManager = nodeManager

  @::__defineGetter__ 'drivers', () ->
    return @_drivers

  @::__defineGetter__ 'nodeManager', () ->
    return @_nodeManager

module.exports = Graph
