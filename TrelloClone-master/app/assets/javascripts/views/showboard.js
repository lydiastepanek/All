TrelloClone.Views.BoardShow = Backbone.View.extend({
  template: JST['show'],

  initialize: function (options) {
    this.listenTo(this.model, 'sync', this.render);
    this.listenTo(this.model.lists(), 'sync', this.render);
  },

  events: {
    "click .new-list": "createList",
    "click .delete-board": "deleteBoard"
  },

  render: function () {
    var $content = this.template({board: this.model});
    this.$el.html($content);
    return this;
  },

  createList: function(event) {
    event.preventDefault();
    var newListTitle = $(event.currentTarget).parent().find("input").val()
    this.model.addListToBoard(newListTitle)
  },

  deleteBoard: function(event) {
    event.preventDefault();
    this.model.destroy({
      success: function () {
        alert("board deleted!")
        Backbone.history.navigate('', {trigger: true})
      }
    })
  }

})
