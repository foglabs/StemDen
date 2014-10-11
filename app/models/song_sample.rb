class SongSample < ActiveRecord::Base
  belongs_to :sample
  belongs_to :song
  belongs_to :user

  validates :sample, presence: true
  validates :song, presence: true
  validates :user, presence: true
end
