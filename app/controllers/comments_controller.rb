class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)   # データが保存されたら詳細ページへリダイレクト
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"  # データが保存されなかったら詳細ページを表示
    end  
  end 

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end


