PostApp.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    PostApp.posts.fetch();
  },

  routes: {
    "": "index",
    'posts/new': 'new',
    'posts/:id/edit': 'edit',
    'posts/:id': 'show'
  },

  edit: function (id) {
    var post = PostApp.posts.getOrFetch(id);
    var editView = new PostApp.Views.PostForm({model: post});
    this._swapView(editView);
  },

  index: function () {
    var that = this;
    PostApp.posts.fetch({
      success: function() {
        var collection = PostApp.posts;
        var indexView = new PostApp.Views.PostsIndex({collection: collection});
        that._swapView(indexView);
      }
    });
  },

  new: function () {
    var post = new PostApp.Models.Post;
    var newView = new PostApp.Views.PostForm({model: post});
    this._swapView(newView);
  },

  show: function (id) {
    var post = PostApp.posts.getOrFetch(id);
    var showView = new PostApp.Views.PostShow({model: post});
    this._swapView(showView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el)
  }
});
