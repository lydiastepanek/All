Pokedex.RootView.prototype.createPokemon = function (attrs, callback) {
  var pokemon = new Pokedex.Models.Pokemon(attrs);
  this.pokes.create(pokemon, {
    success: function() {
      this.addPokemonToList(pokemon);
    }.bind(this)
  })
};

Pokedex.RootView.prototype.submitPokemonForm = function (event) {
  event.preventDefault();
  var $form = $(event.delegateTarget);
  var attrs = $form.serializeJSON();
  this.createPokemon(attrs);
};
