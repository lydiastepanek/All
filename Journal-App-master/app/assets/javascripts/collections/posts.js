JournalApp.Collections.Posts = Backbone.Collection.extend({
  url: "posts",
  model: JournalApp.Models.Post,

  getOrFetch: function (id) {
    if (this.get(id)) {
      this.get(id).fetch({})
      var model = this.get(id);
    }
    else {
      var model = new this.model();
      model.set('id', id);
      model.fetch({
        success: function() {
          this.add(model);
        }.bind(this)
      });
    }
    return model;
  }
});
