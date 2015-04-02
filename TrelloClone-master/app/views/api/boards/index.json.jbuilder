json.array! @boards do |board|
  json.id board.id
  json.title board.title
  json.user_id board.user_id
  json.created_at board.created_at
  json.updated_at board.updated_at

  json.lists board.lists do |list|
    json.id list.id
    json.title list.title
    json.board_id list.board_id
    json.ord list.ord
    json.created_at list.created_at
    json.updated_at list.updated_at
    # json.cards list.cards do |card|
    #   json.title card.title
    #   json.list_id card.list_id
    #   json.description card.description
    #   json.ord card.ord
    #   json.created_at card.created_at
    #   json.updated_at card.updated_at
    # end
  end





end
