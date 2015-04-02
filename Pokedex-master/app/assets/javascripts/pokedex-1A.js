Pokedex.RootView.prototype.addPokemonToList = function (pokemon) {
  this.$pokeList.append("<li class='poke-list-item' data-id='" +pokemon.id + "'>"+pokemon.escape('name') + " " + pokemon.escape('poke_type') +  "</li>")
};

Pokedex.RootView.prototype.refreshPokemon = function (callback) {
  this.pokes.fetch({
    success: function () {
      this.pokes.each(this.addPokemonToList.bind(this))
    }.bind(this)
  });
};
