class UploadimageController < ApplicationController
	skip_before_action :check_signed_in, only: [:index, :upima, :anonymousunew]
	
  layout 'admin'

  def new
  	# if signed_in?
   #      return render plain: current_user.id
   #  else
   #    return render plain: 'session[:username]'
   #  end
  end

  def upima
  	image = Image.new

  	if signed_in?
  		image.user_id = current_user.id
        # return render plain: current_user.id
    else
      # return render plain: 'session[:username]'
    end

    image.avatar_upload(params[:file])
  end


  def anonymousunew
    render layout: false
  end


end


