require_relative '../models/User.rb'
module Routes
  class UserRoutes < ApplicationRoutes

    get '/signup' do
      @user = User.new
      haml :'users/new'
    end

    post '/signup' do
      @user = User.create(
        first_name: params[:user_first_name],
        last_name: params[:user_last_name],
        email: params[:user_email],
        password: params[:user_password]
      )
      if @user.save
        flash[:success] = 'Your user account has been created!'
        redirect '/'
      else
        haml :'users/new'
      end
    end
  end
end