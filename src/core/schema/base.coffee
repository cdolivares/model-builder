class Base

  #has_* stores
  @_r = {}
  @_r.has = {}
  @_r.has.many =[]
  @_r.has.one = []

  #belongs_to_* stores
  @_r.belongs_to = {}
  @_r.belongs_to.many = []
  @_r.belongs_to.one = []

  @_s = {}

  #default root is false
  @_root = false

  @name = (name) ->
    @_name = name

  @has_many = (Model) ->
    @_r.has.many.push Model

  @has_one = (Model) ->
    @_r.has.one.push Model

  @belongs_to_many = (Model) ->
    @_r.belongs_to.many.push Model

  @belongs_to_one = () ->
    @_r.belongs_to.one.push Model

  @type: (type) ->
    @_type = type

  @schema = (obj) ->
    @_s = obj

  @root = (isRoot) ->
    @_root = isRoot

  @_get_r: () ->
    return @_r

  @_get_s: () ->
    return @_s

  @_get_name: () ->
    return @_name

module.exports = Base
