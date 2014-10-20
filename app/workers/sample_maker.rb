class SampleMaker
  include Sidekiq::Worker

  def perform(sampinfo)
    Sample.makesample(sampinfo)
  end
end
