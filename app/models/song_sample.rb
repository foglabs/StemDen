class SongSample < ActiveRecord::Base
  belongs_to :sample
  belongs_to :song

  validates :sample, presence: true
  validates :song, presence: true
end
