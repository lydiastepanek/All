require 'addressable/uri'
require 'rest-client'

# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users.json',
#   query_values: {
#     'some_category[a_key]' => 'another value',
#     'some_category[a_second_key]' => 'yet another value',
#     'some_category[inner_inner_hash][key]' => 'value',
#     'something_else' => 'aaahhhhh'
#   }
# ).to_s
#
# puts RestClient.get(url)

# def create_user
#   url = Addressable::URI.new(
#     scheme: 'http',
#     host: 'localhost',
#     port: 3000,
#     path: '/users.json'
#   ).to_s
#
#   puts RestClient.post(
#     url,
#     { user: { name: "Gizmo", email: "gizmo@gizmo.gizmo" } }
#   )
# end
#
# create_user

def update_user
  url = Addressable::URI.new(
    scheme: 'http',
    host: 'localhost',
    port: 3000,
    path: '/users/3.json'
  ).to_s

  puts RestClient.put(
    url,
    { user: { username: "Super Gizmo"} }
  )
end

update_user

# def delete_user
#   url = Addressable::URI.new(
#     scheme: 'http',
#     host: 'localhost',
#     port: 3000,
#     path: '/users/2.json'
#   ).to_s
#
#   puts RestClient.delete(
#     url,
#     { user: { id: 2} }
#   )
# end
#
# delete_user
