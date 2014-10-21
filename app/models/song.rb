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

    urls << user.id
    urls << name

    urls
  end

  def self.mix(songinfo)
    #last value of songinfo array is output name!
    # second to last is user id of song

    songname = songinfo.pop
    userid = songinfo.pop
    filenames_string = ""
    counter = 0

    songinfo.each do |url|
      # download the boy to the local folder

      filename_noex = url[0].match(/\/(.*)\.{1}/)[1]
      filename_ex = url[0].match(/\/(.*\z)/)[1]

      `s3cmd get s3://stemden/audio/#{url[0]} ./process/#{filename_ex}`

      # addcountertofilename for file uniqueness
      `mv ./process/#{filename_ex} ./process/#{counter.to_s + filename_ex}`
      filename_noex = counter.to_s + filename_noex
      filename_ex = counter.to_s + filename_ex

      if filename_ex.end_with?("mp3")
        `sox -t mp3 ./process/#{filename_ex} -t wav ./process/#{filename_noex}.wav`

        # without extension
        filenames_string += "./process/" + filename_noex + ".wav "
      else
        #with extension
        filenames_string += "./process/" + filename_ex + " "
      end

      counter += 1
    end

    `sox -m #{filenames_string}#{songname}.wav`

    `s3cmd put -f --acl-public #{songname}.wav s3://stemden/audio/mixes/#{songname}.wav`
    `rm -rf ./process/*`

    sampinfo = []
    sampinfo << songname
    sampinfo << "mixes"
    sampinfo << userid
    sampinfo << "http://s3.amazonaws.com/stemden/audio/mixes/#{songname}.wav"

    SampleMaker.perform_async(sampinfo)
  end
end


