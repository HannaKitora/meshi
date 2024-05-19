class PostImagesController < ApplicationController
  def new
    @post_image = PostImage.new #createでも生きる定義
  end

  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id

#訂正
    # @post_image.save
    # redirect_to post_images_path #一覧画面ind　#curex
    if @post_image.save
      # 画像データの保存処理
      @post_image.image.attach(params[:post_image][:image])
      redirect_to post_images_path
    else
      flash.now[:error] = "画像の保存に失敗しました"
      render :new
    end
#ここまで
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id]) 
  end
  
  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    redirect_to post_images_path
  end
  
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end
  
end
