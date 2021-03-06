class SamplesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :authorize_user, except: [:index, :new, :show, :create]

  def index
    @samples = Sample.all
    @topics = Topic.all
    @news = Topic.get_news
  end

  def show
    @sample = Sample.find(params[:id])
    # @comments = Comment.where(sample_id: @sample)
    @comment = Comment.new
  end

  def new
    @sample = Sample.new
  end

  def create
    @sample = Sample.new(sample_params)
    @sample.user = current_user
    @sample.name = @sample.name.gsub(/\s+/, "")

    if @sample.save
      redirect_to samples_path, notice: "Your sample has been accepted."
    else
      flash[:notice] = "Your sample could not be accepted!"
      render "new"
    end
  end

  def destroy
    @sample = Sample.find(params[:id])

    @sample.destroy
    redirect_to samples_path
  end

  private
    def sample_params
      params.require(:sample).permit(:name, :length, :category, :description, :specimen, :remote_specimen_url)
    end

    def authorize_user
      @sample = Sample.find(params[:id])

      unless current_user == @sample.user
        unless user_signed_in? && current_user.admin?
          raise ActionController::RoutingError.new("Not Found")
        end
      end
    end
end
