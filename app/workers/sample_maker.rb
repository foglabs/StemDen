class SampleMaker
  include Shoryuken::Worker
  shoryuken_options queue: 'default', auto_delete: true, body_parser: :json

  def perform(sqsmsg, data)
    Sample.makesample(data['sampinfo'])
  end
end
