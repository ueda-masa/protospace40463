class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to @comment.prototype
    else
      @prototype = Prototype.find(params[:prototype_id])
      @comments = @prototype.comments.includes(:user)
      @comment = @prototype.comments.build # <= コメントが保存できなかったときに新しいインスタンスを作成して再度表示する
      render "prototypes/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end


