require_relative '../models/User.rb'
module Routes
  class AuthRoutes < ApplicationRoutes

    get '/login' do
      haml :'auth/login'
    end
    
    post '/login' do
      user = User.find_by(email: params[:email])

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect '/'
      else
        flash[:danger] = 'Invalid Email/Password'
        redirect '/login'
      end
    end

    get '/logout' do
      session.delete(:user_id)
      redirect '/'
    end
  end
end