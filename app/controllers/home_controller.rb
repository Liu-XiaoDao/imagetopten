class HomeController < ApplicationController
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
end
