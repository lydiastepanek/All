TrelloClone.Models.List = Backbone.Model.extend({

  urlRoot: 'api/lists',

  cards: function() {
    if (!this._cards) {
      this._cards = new TrelloClone.Collections.Cards({list: this});
    }
    return this._cards
  },

  parse: function (response) {
    if (response.cards) {
      this.cards().set(response.cards);
      delete response.cards;
    }
    return response
  },

  addCardToList: function(cardTitle, cardDescription, cardOrd) {
    var cardItem = new TrelloClone.Models.Card({
      title: cardTitle,
      description: cardDescription,
      list_id: this.id,
      ord: cardOrd
    });
    list = this;
    cardItem.save({}, {
      success: function () {
        console.log("success")
        list.cards().add(cardItem)
      }
    });
  }



})
