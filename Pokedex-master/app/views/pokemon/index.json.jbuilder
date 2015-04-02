json.array! @pokemon do |newpoke|
  json.partial! 'pokemon/pokemon', pokemon: newpoke, displaytoys: false
end
