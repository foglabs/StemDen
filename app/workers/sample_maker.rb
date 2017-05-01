class SampleMaker
  include Shoryuken::Worker
  shoryuken_options queue: ['stemqueue'], auto_delete: true, body_parser: :json

  def perform(sqsmsg, data)
    puts "SQS::#{sqsmsg}"
    puts "DATA::#{data}"
    Sample.makesample(data['sampinfo'])
  end
end
