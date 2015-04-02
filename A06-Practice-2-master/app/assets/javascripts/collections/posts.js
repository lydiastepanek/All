PostApp.Collections.Posts = Backbone.Collection.extend({
  url: '/api/posts',

  model: PostApp.Models.Post,

  comparator: 'order',

  getOrFetch: function (id) {
    var model = this.get(id);
    var posts = this;
    if (!model) {
      model = new PostApp.Models.Post({id: id})
      model.fetch({
        success: function () {
          posts.add(model)
        }
      })
    }
    return model;
  }
});
