PostApp.Collections.Posts = Backbone.Collection.extend({
  url: '/api/posts',

  model: PostApp.Models.Post,

  comparator: function(post) {
    return post.get('order')
  },

  getOrFetch: function (id) {
    if (this.get(id)) {
      var model = this.get(id)
    } else {
      var model = new PostApp.Models.Post;
      model.set('id', id);
      model.save({
        success: function () {
          return model
        }
      });
    }
    return model;
  }
});
