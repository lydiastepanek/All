window.TrelloClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    new TrelloClone.Routers.BoardRouter({
      $rootEl: $("#content")
    });
    TrelloClone.currentBoards = new TrelloClone.Collections.Boards();
    Backbone.history.start();
  }
};

$(document).ready(function(){
  TrelloClone.initialize();
});
