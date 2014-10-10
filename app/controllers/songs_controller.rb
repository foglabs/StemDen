class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    @song.user = current_user

    if @song.save
      redirect_to song_path(@song), notice: "Your song has been accepted."
    else
      flash[:notice] = "Your song could not be accepted!"
      render 'new'
    end
  end

  def show
    @song = Song.find(params[:id])
    @song_sample = SongSample.new
  end

  private
    def song_params
      params.require(:song).permit(:name, :user_id)
    end

    def authorize_user
      unless user_signed_in? && current_user.admin?
        raise ActionController::RoutingError.new("Not Found")
      end
    end
end
