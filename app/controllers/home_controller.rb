class HomeController < ApplicationController

  skip_before_action :check_signed_in, only: [:index, :show]
  
  def index
  	@images = Image.all
  end
  def show
  	@images = Image.all

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
end
