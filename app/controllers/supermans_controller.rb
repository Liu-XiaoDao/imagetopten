class SupermansController < ApplicationController
  # skip_before_action :check_signed_in, only: []
  http_basic_authenticate_with name: "Abcam", password: "Abcam123$"

  layout 'admin'

  def index
    order = params[:order] ? "#{params[:order]} DESC" : "id asc"
  	@images = Image.order(order)
  end



  def destroy
    image = Image.find params[:id]

    image.destroy

    redirect_to supermans_path
  end


end
