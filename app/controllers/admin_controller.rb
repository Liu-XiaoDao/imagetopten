class AdminController < ApplicationController
  layout 'admin'
  def index
  	@images = Image.all
  end

  def title
  	image = Image.find params[:id]
  	image.title = params[:title]
  	image.save	
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
