class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:edit, :show]
  def index
    @prototypes = Prototype.all
  end


  def new
    @prototype = Prototype.new   # @prototypes から @prototypeへ変更
  end

  def edit
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
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def set_prototype
    @prototype = Prototype.new(params[:id])
  end
end


