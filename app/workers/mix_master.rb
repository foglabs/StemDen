class MixMaster
  include Shoryuken::Worker
  shoryuken_options queue: 'stemqueue', auto_delete: true, body_parser: :json

  def perform(sqsmsg, data)

    Song.mix(data['songinfo'])
  end
end
