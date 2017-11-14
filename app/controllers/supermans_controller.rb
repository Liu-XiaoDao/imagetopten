class SupermansController < ApplicationController
  skip_before_action :check_signed_in, only: []

  layout 'admin'

  def index
  	@images = Image.all
  end

  def edit
  end

  def show
  end


  def destroy
    image = Image.find params[:id]

    image.destroy

    redirect_to supermans_path
  end


end
