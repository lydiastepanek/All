PostApp.Views.PostsIndex = Backbone.View.extend({
  template: _.template('<h3>Post Index View</h3><ul><% posts.each(function (post) { %><li><a href="#/posts/<%= post.id %>"><%= post.escape("title") %></a><button class="delete" data-id="<%= post.id %>">Delete!</button><a href="#/posts/<%= post.id %>/edit">Edit</a></li><% }); %></ul><a href="#/posts/new">New Post</a>'),

  events: {
    'click .delete': 'destroyPost'
  },

  destroyPost: function(event) {
    var id = $(event.currentTarget).attr('data-id')
    var post = this.collection.get(id)
    post.destroy({
      success: function () {
        alert("deleted!")
      }
    })
  },

  initialize: function (options) {
    this.collection = options.collection;
    this.listenTo(this.collection, 'add change:title remove reset', this.render);
  },

  render: function() {
    var $content = this.template({posts: this.collection});
    this.$el.html($content);
    return this;
  }

});
