class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :authorize_user!, except: [:index, :new, :show, :create, :destroy]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if params[:sample_id]
      @sample = Sample.find(params[:sample_id])
      @comment.sample = @sample

      if @comment.save
        redirect_to sample_path(@sample), notice: "Your comment has been accepted."
      else
        flash[:notice] = "Your comment could not be accepted!"
        render "samples/show"
      end
    elsif params[:topic_id]
      @topic = Topic.find(params[:topic_id])
      @comment.topic = @topic

      if @comment.save
        redirect_to topic_path(@topic), notice: "Your comment has been accepted."
      else
        flash[:notice] = "Your comment could not be accepted!"
        render "topics/show"
      end
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    if @comment.sample_id
      redirect_to sample_path(@comment.sample)
    elsif @comment.topic_id
      redirect_to topic_path(@comment.topic)
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id, :sample_id, :topic_id)
    end

  def authorize_user
    unless user_signed_in? && current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end
