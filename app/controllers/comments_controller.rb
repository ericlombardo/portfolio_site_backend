class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :update, :destroy]

  # GET /comments
  def index
    # look through comments and find ones that have post_id of params[:post_id]
    # render them in an array
    @comments = Comment.all.select {|c| c.post_id == params[:post_id].to_i}
    render json: @comments
  end

  # GET /comments/1
  def show
    @comment = @comment.find_by(id: params[:id])
    render json: @comment
  end

  # POST /comments
  def create
    @post = Post.find_by_id(params[:post_id])
    @comment = @post.comments.build(
      content: params[:comment][:content],
      likes: 0,
      like_pic: 'src/img/icons/heart-thin.png'
      )
      if @comment.save
        render json: @comment, status: :created, location: @comment
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
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:content, :post_id, :likes, :like_pic)
    end
end
