# just handles parsing 1 pokemon's json


json.extract!(
  pokemon,
  :id,
  :attack,
  :defense,
  :image_url,
  :moves,
  :name,
  :poke_type
)
if displaytoys
  json.toys do
    json.array! pokemon.toys do |toy|
      json.partial! "toys/toy", toy: toy
    end

  end
end
# if displaytoys
#   json.array! pokemon.toys do |toy|
#     json.partial! "toys/toy", toy: toy
#   end
# end
