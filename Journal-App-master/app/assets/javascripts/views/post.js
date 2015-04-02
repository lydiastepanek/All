JournalApp.Views.Post = Backbone.View.extend({

  template: JST['post'],

  initialize: function(post) {
    this.post = post
    this.post.fetch({});
    this.listenTo(this.post, 'sync', this.render)
  },

  render: function () {
    var content = this.template({post: this.post});
    this.$el.html(content);
    return this;
  }

});
