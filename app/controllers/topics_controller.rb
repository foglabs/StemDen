class TopicsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :authorize_user!, except: [:index, :new, :show, :create, :destroy]

  def show
    @topic = Topic.find(params[:id])
    @comment = Comment.new
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.user = current_user

    if @topic.save
      redirect_to topic_path(@topic), notice: "Your topic has been accepted."
    else
      flash[:notice] = "Your topic could not be accepted!"
      render "new"
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    @topic.destroy
    redirect_to samples_path
  end

  private
    def topic_params
      params.require(:topic).permit(:name, :comment_id)
    end

    def authorize_user
      unless user_signed_in? && current_user.admin?
        raise ActionController::RoutingError.new("Not Found")
      end
    end
end
