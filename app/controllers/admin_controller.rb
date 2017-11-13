class AdminController < ApplicationController
  skip_before_action :check_signed_in, only: [:vote]

  layout 'admin'
  def index
  	@images = Image.all
  end

  def title
  	image = Image.find params[:id]
  	image.title = params[:title]
  	image.save	
  end


  #投票
  def vote
    unless signed_in?
      image = Image.find params[:id]
      user = current_user

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
