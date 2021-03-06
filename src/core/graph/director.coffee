###
  Class: GraphBuilder

  Basic builder interface to construct a graph of resources
  defined config file.
###

class GraphDirector

  ###
    Constructor

    Takes a Graph and Builder.
  ###
  constructor: (builder) ->
    @_builder = builder

  build: (callback) =>
    @_builder.preBuild (err) =>
      @_builder.build (err) =>
        @_builder.postBuild (err) =>
          callback null

  setGraph: (graph) ->
    graph.setDrivers @_builder.getDrivers()
    return graph

module.exports = GraphDirector
