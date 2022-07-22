class LikesController < ApplicationController
  before_action :set_like, only: %i[ update destroy ]

  # GET /likes
  def index
    @likes = Like.all

    render json: @likes
  end

  # POST /likes
  def create
    @like = Like.new(like_params)
    @like.user_id = @current_user.id
    get_blogId
    @like.blog_id = @blogId

    if @like.save
      render json: @like, status: :created, location: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /likes/1
  def update
    if @like.update(like_params)
      render json: @like
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  # DELETE /likes/1
  def destroy
    @like.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def get_blogId
        id = request.url.split('/')
        # You need start with '@' for a var to be available globally
        @blogId = id[-2]
    end

    def set_like
      @like = Like.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def like_params
      params.require(:like).permit(:like_no)
    end
end
