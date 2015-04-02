class Track < ActiveRecord::Base

  TRACKTYPES = %w(bonus regular)
  validates :track_name, :track_type, :album_id, presence: true
  validates :track_type, inclusion: TRACKTYPES

  belongs_to(
    :album,
    class_name: "Album",
    foreign_key: :album_id,
    primary_key: :id
  )

end
