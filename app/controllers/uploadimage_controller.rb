require 'dimensions'
class UploadimageController < ApplicationController
	# skip_before_action :check_signed_in, only: [:index, :upima, :anonymousunew]


  layout 'admin'

  # def new
  # end

  def upima
  	image = Image.new
    f = image.avatar_upload(params[:file])


		puts Dimensions.angle(f)

		angle = Dimensions.angle(f)
		image = MiniMagick::Image.new(f)

		puts angle
		image.combine_options do |b|
		  b.rotate angle
		end # the command gets executed



		render plain: Dimensions.angle(f)
  end


  def anonymousunew
    render layout: false
  end


end
