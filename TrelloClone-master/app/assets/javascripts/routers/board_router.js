TrelloClone.Routers.BoardRouter = Backbone.Router.extend({
  routes: {
    '': 'renderIndex',
    'new': 'newBoard',
    'boards/:id': 'showBoard'
  },

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  renderIndex: function () {
    var indexView = new TrelloClone.Views.BoardsIndex({collection: TrelloClone.currentBoards});
    this._swapView(indexView);
  },

  newBoard: function() {
    var newBoardView = new TrelloClone.Views.NewBoard();
    this._swapView(newBoardView)
  },

  showBoard: function(id) {
    var board = TrelloClone.currentBoards.getOrFetch(id);
    var showBoardView = new TrelloClone.Views.BoardShow({model: board});
    this._swapView(showBoardView)
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.append(this._currentView.render().$el);
  }

});
