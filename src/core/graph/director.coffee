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
    #set graph on builder if graph interface
    #setting is defined
    if @_builder.setGraph?
      @_builder.setGraph @_graph

  build: (callback) =>
    @_builder.preBuild (err) =>
      @_builder.build (err) =>
        @_builder.postBuild (err) =>
          callback null

  setGraph: (graph) ->
    graph.setDrivers = @_builder.getResult()
    graph.setNodeManager = @_builder.
    return graph

module.exports = GraphDirector
