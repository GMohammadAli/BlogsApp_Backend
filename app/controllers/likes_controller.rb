class LikesController < ApplicationController
  before_action :set_like, only: %i[ show update ]

  # GET /likes/1
  def show
    render json: @like
  end

  # POST /likes
  def create
    @like = Like.new(like_params)
    get_blogId
    @like.blog_id = @blogId
    
    if @like.save
      render json: @like, status: :created 
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
      params.require(:like).permit(:no_of_likes)
    end
end
