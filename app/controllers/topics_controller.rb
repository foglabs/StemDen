class TopicsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :authorize_user!, except: [:index, :new, :show, :create]

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

  private
    def topic_params
      params.require(:topic).permit(:name, :comment_id)
    end
end
