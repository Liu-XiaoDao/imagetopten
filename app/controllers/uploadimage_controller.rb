class UploadimageController < ApplicationController
	# skip_before_action :check_signed_in, only: [:index, :upima, :anonymousunew]
	
  layout 'admin'

  # def new
  # end

  def upima
  	image = Image.new
    image.avatar_upload(params[:file])
  end


  def anonymousunew
    render layout: false
  end


end


