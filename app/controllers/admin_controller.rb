class AdminController < ApplicationController
  skip_before_action :check_signed_in, only: [:vote]

  layout 'admin'
  def index
  	@images = Image.where user_id: current_user.id

  end

  def favorite
    @images = current_user.images
  end

  def title
  	image = Image.find params[:id]
  	image.title = params[:title]
  	image.save	
  end


  #投票
  def vote
    if signed_in?

      image = Image.find params[:id] #投票的图片
      user = current_user  #当前用户

      voterocerd = Voterecord.where("user_id = ? AND image_id = ?", user.id,image.id)
      # return render json: voterocerd
      unless voterocerd.blank?
        return render json: '{"status":3,"info":"您已投过该图片"}'
      end

      unless user.vote > 0
        return render json: '{"status":4,"info":"您已投过10票"}'
      end


      voterocerd = Voterecord.new
      voterocerd.user = user
      voterocerd.image = image
      


      image.Votes = image.Votes.to_i + 1
      

      current_user.vote = current_user.vote - 1
      

      if voterocerd.save && image.save && current_user.save
        render json: '{"status":0,"info":"投票成功"}'
      else
        render json: '{"status":2,"info":"投票失败"}'
      end
    

    else
      render json: '{"status":1,"info":"请登录后投票"}'
    end
     
  end


  def is_vote(user,image)
      voterocerd = Voterecord.where("user_id = ? AND image_id = ?", user.id,image.id)
      unless voterocerd
        return false
      end

      unless user.vote > 0
        return false
      end

  end




  def describe
  	image = Image.find params[:id]
  	image.describe = params[:describe]
  	image.save
  end

  def destroy
    image = Image.find params[:id]

    root_path = "#{Rails.root}/public"
    final_path = root_path + image.url
    if !File.exists?(final_path)
      File.delete(final_path)
    end

    image.destroy

    redirect_to admin_index_path
  end



end
