TrelloClone.Collections.Cards = Backbone.Collection.extend({

  url: 'api/cards',

  model: TrelloClone.Models.Card,

  initialize: function(options) {
    this.list = options.list
  }
})

// var b = new TrelloClone.Models.Board;
// b.set('id',1)
// b.fetch()
// b.lists()
// b.lists().first()
// var todo = b.lists().last()
// now it wont get todo so i can see the list
