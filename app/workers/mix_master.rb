class MixMaster
  include Sidekiq::Worker

  def perform(songinfo)
    Song.mix(songinfo)
  end
end
