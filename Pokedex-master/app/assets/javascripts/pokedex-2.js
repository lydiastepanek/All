Pokedex.RootView.prototype.addToyToList = function (toy) {
  var $toys = this.$pokeDetail.find(".toys")
  $toys.append("<li data-toy-id='" + toy.id + "' data-pokemon-id='" + toy.get("pokemon_id") + "'>" + toy.id + " "+ toy.escape("name") + " "+ toy.escape("happiness") + "</li>")
};

Pokedex.RootView.prototype.renderToyDetail = function (toy) {
  this.$toyDetail.children().remove();
  var methods = [
    "id",
    "happiness",
    "image_url",
    "name",
    "pokemon_id",
    "price"
  ]

  for (var i = 0; i < methods.length; i++ ) {
    var attributeString = toy.get(methods[i]);
    this.$toyDetail.append("<li>" + attributeString + "</li>");
  }
  this.$toyDetail.append("<li><img src='" + toy.get("image_url") + "'></li>")

};

Pokedex.RootView.prototype.selectToyFromList = function (event) {
  event.preventDefault();
  var target = $(event.currentTarget);
  var that = this;
  var pokemon = new Pokedex.Models.Pokemon({id: target.attr("data-pokemon-id")})
  pokemon.fetch({
    success: function () {
      var toys = pokemon.toys();
      toys.each(function (toy) {
        if (toy.id === parseInt(target.attr("data-toy-id"))) {
            that.renderToyDetail(toy);
          }
      })
    }
  })

};
