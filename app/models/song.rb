class Song < ActiveRecord::Base
  has_many :song_samples
end
