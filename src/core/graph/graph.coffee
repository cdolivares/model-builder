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

  setDrivers: (drivers) =>
    @_drivers

  setNodeManager: (nodeManager) =>
    @_nodes = nodeManager

  @::__defineGetter__ 'drivers', () ->
    @_drivers

  @::__defineGetter__ 'nodeManager', () ->
    @_nodeManager

module.exports = Graph
