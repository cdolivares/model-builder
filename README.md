### Model-Builder

Builds and enriches database model.

```javascript

Director = Relation.Director;
director = new Director(graph, mongooseBuilder);
director.build(function (err) {
  console.log "Model graph constructed"
});
```

**More to come**
