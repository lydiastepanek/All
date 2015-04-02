TrelloClone.Models.Board = Backbone.Model.extend({
  urlRoot: 'api/boards',

  lists: function() {
    if (!this._lists) {
      this._lists = new TrelloClone.Collections.Lists({board: this});
    }
    return this._lists
  },

  parse: function (response) {
    if (response.lists) {
      this.lists().set(response.lists, {parse: true});
      delete response.lists;
    }
    return response
  },

  addListToBoard: function(title) {
    var listItem = new TrelloClone.Models.List({title: title, board_id: this.id})
    board = this;
    listItem.save({}, {
      success: function () {
        board.lists().add(listItem)
      }
    })
  }

})
