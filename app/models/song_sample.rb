class SongSample < ActiveRecord::Base
  belongs_to :sample
  belongs_to :song
  belongs_to :user

  validates :sample, presence: true
  validates :song, presence: true
  validates :user, presence: true

  def convert_gain
    if gain
      20*(Math.log10(gain/1)).to_s
    else
      "0"
    end
  end
end
