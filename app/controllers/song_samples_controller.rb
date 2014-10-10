class SongSamplesController < ApplicationController
  def create
    @song_sample = SongSample.new(song_sample_params)

    if @song_sample.save
      flash[:notice] = 'Sample added'
      redirect_to @song_sample.song
    else
      @song = @song_sample.song
      flash[:error] = 'There was a problem...'
      render 'songs/show'
    end
  end

  private
    def song_sample_params
      params.require(:song_sample).permit(:sample_id, :song_id)
    end
end
