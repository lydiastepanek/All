class Album < ActiveRecord::Base

  ALBUMTYPES = %w(live studio)
  validates :album_name, :band_id, :album_type,  presence: true
  validates :album_type, inclusion: ALBUMTYPES

  belongs_to(
    :band,
    class_name: "Band",
    foreign_key: :band_id,
    primary_key: :id
  )

  has_many(
  :tracks,
  class_name: "Track",
  foreign_key: :album_id,
  primary_key: :idm,
  dependent: :destroy
  )

end
