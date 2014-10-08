class CommentsController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  before_filter :authorize_user!, except: [:index, :new, :show, :create]

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
    @sample = Sample.find(params[:sample_id])
    @comment.sample = @sample

    if @comment.save
      redirect_to sample_path(@sample), notice: "Your comment has been accepted."
    else
      flash[:notice] = "Your comment could not be accepted!"
      render "samples/show"
    end
  end

  def destroy
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :user_id, :sample_id)
    end

  def authorize_user
    unless user_signed_in? && current_user.admin?
      raise ActionController::RoutingError.new("Not Found")
    end
  end
end