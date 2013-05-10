class Base

  @clone = () ->
    f = () ->
    #has_* stores
    f._r = {}
    f._r.has = {}
    f._r.has.many =[]
    f._r.has.one = []

    #belongs_to_* stores
    f._r.belongs_to = {}
    f._r.belongs_to.many = []
    f._r.belongs_to.one = []

    f._s = {}
    f._short = null

    #default root is false
    f._root = false

    f.name = (name) ->
      f._name = name

    f.has_many = (Model) ->
      f._r.has.many.push Model

    f.has_one = (Model) ->
      f._r.has.one.push Model

    f.belongs_to_many = (Model) ->
      f._r.belongs_to.many.push Model

    f.belongs_to_one = (Model) ->
      f._r.belongs_to.one.push Model

    f.type = (type) ->
      f._type = type

    f.schema = (obj) ->
      f._s = obj

    f.root = (isRoot) ->
      f._root = isRoot

    f.short_name = (n) ->
      f._short = n

    ###
      Method: serialize

      Serializes the node into a json object.
      The format is something that an object
      of class type Node knows how to configure
      itself from.
    ###
    f.serialize = () ->
      o =
        type: f._type
        children:
          many: f._r.has.many
          one: f._r.has.one
        parents:
          many: f._r.belongs_to.many
          one: f._r.belongs_to.one
        meta:
          root: f._root
          short_name: f._short
        driver:
          schema: f._s.driverFields
      return o

    #create a node from a json object
    f.deserialize = (obj) ->
      throw new Error("Not Implemented")

    f._get_r = () ->
      return f._r

    f._get_s = () ->
      return f._s

    f._get_name = () ->
      return f._name

    return f

module.exports = Base
