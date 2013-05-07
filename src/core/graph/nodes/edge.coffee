###
  Class: Edge

  Describes an edge going between two nodes. Both
  nodes at the ends of the edge will store a reference
  to an instantiated Edge. Since all our edges are
  unidirectional and hierarchical in nature, we can think
  of these edges as establishing parent-child relationships
  between two given nodes.  
###

class Edge
  ###
    Describes an edge going from n1 to n2 of 
    some type.

    The four types are:
      1:   one  -> one
      2:   one  -> many
      3:   many -> one
      4:   many -> many
  ###
  constructor: (n1, n2, type) ->
    @_n1    = n1
    @_n2    = n2
    @_type  = type

  @::__defineGetter__ 'parent', () ->
    @_n1
 
  @::__defineGetter__ 'child', () ->
    @_n2

module.exports = Edge
