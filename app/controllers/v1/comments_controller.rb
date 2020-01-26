class V1::CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      render json: { data: PostSerializer.new(@comment.post).as_json, klass: 'Post' }, status: :ok
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render json: { data: 'OK'}, status: :ok
    end
  end

  def comment_params
    params.require(:comment).permit!
  end
end
