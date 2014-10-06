class SongSample < ActiveRecord::Base
  belongs_to :sample
  belongs_to :song
end
