PostApp.Views.PostsIndex = Backbone.View.extend({
  template: _.template('<h3>Post Index View</h3><ul><% posts.each(function (post) { %><li><a href="#/posts/<%= post.id %>"><%= post.escape("title") %></a><button class="delete" data-id="<%= post.id %>">Delete!</button><a href="#/posts/<%= post.id %>/edit">Edit</a></li><% }); %></ul><a href="#/posts/new">New Post</a>'),

  events: {
    'click .delete': 'destroyPost'
  },

  render: function() {
    content = this.template({posts: this.collection})
    this.$el.html(content)
    return this;
  },

  initialize: function () {
    this.collection.fetch()
    this.listenTo(this.collection, 'add change:title remove reset', this.render)
  },

  destroyPost: function(event) {
    var post = this.collection.getOrFetch($(event.currentTarget).attr("data-id"));
    post.destroy();
    this.collection.remove(post)
  }


});
