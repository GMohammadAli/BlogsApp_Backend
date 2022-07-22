class CommentsController < ApplicationController 
  before_action :set_comment, only: %i[ show update destroy ]

  # GET /comments
  def index
    get_blogId
    @comments = Comment.where(blog_id: @blogId ).all

    render json: @comments
  end

  # GET /comments/1
  def show
    render json: @comment
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = @current_user.id
    get_blogId
    @comment.blog_id = @blogId

    if @comment.save
      render json: @comment , status: :created
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /comments/1
  def update
    if @comment.update(comment_params)
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    render json: {msg:"Comment Deleted!"}
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_blogId
        id = request.url.split('/')
        # You need start with '@' for a var to be available globally
        @blogId = id[-2]
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:description)
    end
end
