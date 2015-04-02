JournalApp.Routers.Router = Backbone.Router.extend({
  initialize: function($el) {
    this.$el = $el;
  },

  routes: {
    '': 'postsIndex',
    'posts/:id': 'post',
    'posts/:id/edit': 'postForm'
  },

  postsIndex: function () {
    this._postsIndex = new JournalApp.Views.PostsIndex();
    this.$el.html(this._postsIndex.render().$el);
  },

  post: function (id) {
    var posts = new JournalApp.Collections.Posts()
    var post = posts.getOrFetch(id);
    this._post = new JournalApp.Views.Post(post);
    this.$el.html(this._post.render().$el);
  },

  postForm: function (id) {
    var posts = new JournalApp.Collections.Posts();
    var post = posts.getOrFetch(id);
    this._postForm = new JournalApp.Views.PostForm(post);
    this.$el.html(this._postForm.render().$el);
  }
});
