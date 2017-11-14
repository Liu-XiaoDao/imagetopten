class HomeController < ApplicationController

  skip_before_action :check_signed_in, only: [:index, :show, :showfive]
  
  def index
  	@images = Image.all
  end
  def show
  	@images = Image.all
    if signed_in?
        return render plain: current_user.id
    else
      
      return render plain: session[:username]
    end
    
	  render layout: "slip"
  end

  def showimg
  	@images = Image.all

	render layout: "masonry"
  end

  def showfour
    @images = Image.all

    render layout: "showfour"
  end

  def showfive
    @images = Image.all

    

    if signed_in?
  		@voterocerds = Voterecord.where("user_id = ?", current_user.id)
        # return render plain: current_user.id
    else
      @voterocerds = []
    end
    


    render layout: "showfive"
  end
end
