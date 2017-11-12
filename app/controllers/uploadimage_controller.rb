class UploadimageController < ApplicationController
  layout 'admin'
  def index
  end
  def new
  	
  end
  def upima
    Image.new.avatar_upload(params[:file])
  end


end


