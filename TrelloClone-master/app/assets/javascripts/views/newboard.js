TrelloClone.Views.NewBoard = Backbone.View.extend({

  template: JST['new'],

  tagName: 'div',

  events: {
    "submit": "createBoard"
  },

  render: function () {
    var content = this.template();
    this.$el.append(content);
    return this;
  },

  createBoard: function(event) {
    event.preventDefault();
    var title = $(this.$el).find("input").val()
    var board = new TrelloClone.Models.Board();
    board.save({title: title}, {
      success: function () {
        console.log("success")
        TrelloClone.currentBoards.add(board)
        Backbone.history.navigate('/boards/' + board.id, {trigger: true})
      }
    })
  }


})
