JournalApp.Views.PostsIndexItem = Backbone.View.extend({
  template: JST['post_list_item'],
  tagName: 'li',
  initialize: function(model) {
    this.model = model
  },
  render: function () {
    var liContent = this.template({post: this.model});
    this.$el.html(liContent);
    return this;
  }

})
