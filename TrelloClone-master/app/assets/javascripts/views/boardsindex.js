TrelloClone.Views.BoardsIndex = Backbone.View.extend({
  template: JST['index'],

  initialize: function () {
    this.collection.fetch();
    this.listenTo(this.collection, 'sync', this.render)
  },

  render: function () {
    var $content = this.template();
    this.$el.html($content);
    this.collection.each(function (board) {
      this.itemTemplate = JST['indexitem']
      var $itemContent = this.itemTemplate({board: board})
      this.$el.append($itemContent);
    }.bind(this))
    return this;
  }

})
