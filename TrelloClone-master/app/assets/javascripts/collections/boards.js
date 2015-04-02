TrelloClone.Collections.Boards = Backbone.Collection.extend({
  url: 'api/boards',

  model: TrelloClone.Models.Board,

  getOrFetch: function(id) {
    var model = this.get(id);
    var collection = this;
    if (!model) {
      model = new TrelloClone.Models.Board({id: id});
      model.fetch({
        success: function () {
          collection.add(model)
        }
      })
    } else {
      model.fetch()
    }
    return model
  }

})
