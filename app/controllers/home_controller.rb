class HomeController < ApplicationController

  # skip_before_action :check_signed_in, only: [:index, :show, :showfive, :topten]
  
  # def index
  # 	@images = Image.all
  # end

  # def show
  # 	@images = Image.all
  #   if signed_in?
  #       return render plain: current_user.id
  #   else
      
  #     return render plain: session[:username]
  #   end
    
	 #  render layout: "slip"
  # end

  # def showimg
  # 	@images = Image.all

	 #  render layout: "masonry"
  # end

  # def showfour
  #   @images = Image.all

  #   render layout: "showfour"
  # end
# request.remote_ip
  def showfive
    session[:ip] = request.remote_ip

    user = User.find_by name: request.remote_ip

    unless user.blank?
      session[:ip] = request.remote_ip
    else
      user = User.new
      user.name = request.remote_ip
      user.email = request.remote_ip
      user.vote = 10
      if user.save
        session[:ip] = request.remote_ip
      else
        redirect_to root_path
      end
    end

    @images = Image.all
  	@voterocerds = Voterecord.where("user_id = ?", user.id)
    render layout: "showfive"
  end


  def topten
    @images = Image.order(votes: :desc).first(10)
    render layout: false
  end
end
