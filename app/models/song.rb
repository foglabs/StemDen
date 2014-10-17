class Song < ActiveRecord::Base
  has_many :song_samples
  has_many :samples, through: :song_samples
  belongs_to :user

  validates :name, presence: true
  validates :user, presence: true

  def get_urls
    urls = []
    samples.each do |samp|
      #gives url as username/filename.ext
      urls << [samp.specimen.url.gsub(/\A(\w|\W)*audio\//, "")]
    end

    urls << name

    urls
  end

  def self.mix(songinfo)
    #last value of songinfo array is output name!

    songname = songinfo.pop
    filenames_string = ""

    songinfo.each do |url|
      # download the boy to the local folder
      `s3cmd get s3://stemden/audio/#{url}`

      # strip filenames for sox command
      filenames_string += url[0].match(/\/(.*\z)/)[1] + " "
    end

    `sox -m #{filenames_string}#{songname}.wav`

    `s3cmd put -f --acl-public #{songname}.wav s3://stemden/audio/mixes/#{songname}.wav`

# this won't work V
    # Sample.create!(name: songname, specimen: "https://stemden.s3.amazonaws.com/audio/mixes/#{songname}.wav")


  end

end


