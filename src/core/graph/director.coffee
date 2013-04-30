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
  constructor: (graph, builder) ->
    @_graph = graph
    @_builder = builder
    #set graph on builder if getting graph interface is implemented
    if @_builder.setGraph?
      @_builder.setGraph @_graph

  build: (callback) =>
    @_builder.preBuild (err) =>
      @_builder.build (err) =>
        @_builder.postBuild (err) =>
          callback null

module.exports = GraphDirector
