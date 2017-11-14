class SessionsController < ApplicationController

  skip_before_action :check_signed_in, only: [:new, :create]      #整个系统都需要登录操作所以在application中设置,检测是都登录,但是在登录和注册页面需要跳过验证

  layout 'login'

  def new
    # 注册/登录同页面, 同时使用User_Model中的验证返回信息
    @user = User.new
  end



  def create



    user = User.find_by name: params[:username]

    unless user.blank?
      session[:username] = params[:username]
      redirect_to root_path
    else
      user = User.new
      user.name = params[:username]
      user.email = params[:password]
      user.vote = 10
      user.isadmin = 0

      if user.save
        session[:username] = params[:username]
        redirect_to root_path
      else
        return false
      end
    end

    



    # @user = User.from_omniauth(request.env["omniauth.auth"])      #这是通过ldap认证后,返回邮箱,再用邮箱找到用户,在返回用户
    # if @user
    #   sign_in @user     #用户名加入session
    #   redirect_to root_path
    # else
    #   redirect_to signin_path
    # end
  end



  def destroy
    sign_out
    redirect_to signin_path
  end

  private
    def session_param(attribute)
      params[:session][attribute]
    end
end
