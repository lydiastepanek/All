PostApp.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$rootEl = options.$rootEl
  },

  routes: {
    '': 'index',
    'posts/new' : 'new',
    'posts/:id/edit' : 'edit',
    'posts/:id' : 'show'
  },

  edit: function (id) {
    var post = PostApp.posts.getOrFetch(id);
    var viewEdit = new PostApp.Views.PostForm({model: post, collection: PostApp.posts});
    this._swapView(viewEdit)
  },

  index: function () {
    var viewIndex = new PostApp.Views.PostsIndex({collection: PostApp.posts})
    PostApp.posts.fetch();
    this._swapView(viewIndex)
  },

  new: function () {
    var post = new PostApp.Models.Post;
    var viewNew = new PostApp.Views.PostForm({model: post, collection: PostApp.posts});
    this._swapView(viewNew)
  },

  show: function (id) {
    var post = PostApp.posts.getOrFetch(id);
    var viewShow = new PostApp.Views.PostShow({model: post})
    this._swapView(viewShow)
  },

  _swapView: function (view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.append(view.render().$el)
  }
});
