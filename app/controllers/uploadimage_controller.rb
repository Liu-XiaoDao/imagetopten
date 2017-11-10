class UploadimageController < ApplicationController
  layout 'uploader'
  def index
  end
  def new
  	
  end
  def upima
    Image.new.avatar_upload(params[:file])
  end


end


