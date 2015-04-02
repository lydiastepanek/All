JournalApp.Views.PostsIndex = Backbone.View.extend({
  template: JST['post_list'],

  initialize: function () {
    this.collection = new JournalApp.Collections.Posts();
    this.collection.fetch({});
    this.listenTo(this.collection, "add remove sync", this.render);
  },

  events: {
    "click li #delete": "deletePost"
  },

  render: function () {
    this.$el.html(this.template());
    this.collection.each( function(post) {
      var view = new JournalApp.Views.PostsIndexItem(post);
      this.$el.find('ul').append(view.render().$el)
    }.bind(this))
    return this;
  },

  deletePost: function(event) {
    var $li = $(event.currentTarget);
    var title = $li.find("#post-title").html();
    var body = $li.find("#post-body").html();
    var post = this.collection.findWhere({
        title: title,
        body: body
      })
    post.destroy({
      success: function () {
        this.collection.remove(post)
      }.bind(this)
    })
  }
});
