class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.all
  end

  def edit
    @prototype = Prototype.new 
  end

  def new
    @prototype = Prototype.new 
  end
  
  def create
    @prototype = Prototype.new(prototype_params)  
    if @prototype.save
      redirect_to '/'     # データが保存されたらルートパスにリダイレクト
    else
      render :new   # データが保存されなかったら新規投稿ページを表示
    end  
  end

  def show
    @prototype = Prototype.new(params[:id])
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept).merge(user_id: current_user.id)
  end
end
