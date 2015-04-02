window.JournalApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    this.router = new JournalApp.Routers.Router($("#journal-app"));
    Backbone.history.start();
  }
};

$(document).ready(function(){
  JournalApp.initialize();
});
