class SongSamplesController < ApplicationController
  def create
    @song_sample = SongSample.new(song_sample_params)
    @song_sample.user = current_user

    if @song_sample.save
      flash[:notice] = 'Sample added'
      redirect_to @song_sample.song
    else
      @song = @song_sample.song
      flash[:error] = 'There was a problem...'
      render 'songs/show'
    end
  end

  def destroy
    @song_sample = SongSample.find(params[:id])

    @song_sample.destroy
    redirect_to song_path(@song_sample.song)
  end

  private
    def song_sample_params
      params.require(:song_sample).permit(:sample_id, :song_id, :user_id)
    end
end
