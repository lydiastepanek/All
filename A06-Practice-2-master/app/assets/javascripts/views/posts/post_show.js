PostApp.Views.PostShow = Backbone.View.extend({
  template: _.template("<h1>Post Show View</h1><h1><%= post.escape('title') %></h1><%= post.escape('body') %><a href='#/'>Index</a>"),

  render: function() {
    content = this.template({post: this.model})
    this.$el.html(content)
    return this;
  },

  initialize: function () {
    this.listenTo(this.model, 'add change:title remove reset', this.render)
  }

});
