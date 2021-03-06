class UsersController < ApplicationController
  
   get '/signup' do
      erb :'users/signup'
  end
  
   post '/signup' do 
    if params[:username] == "" || params[:password] == ""
      flash[:error] = "ERROR: Please enter username and password to register."
      erb :'/signup'
    else
      @user = User.create(:username => params[:username], :password => params[:password])
      session[:user_id] = @user.id
      redirect '/users/home'
    end
  end
  
  get '/login' do
    erb :'users/login'
  end 
  
  post "/login" do
    if params[:username] == "" || params[:password] == ""
      flash[:error] = "ERROR: Please enter username and password to log in."
      redirect '/login'
    else
      login(params[:username], params[:password])    
    end
  end
  
  get '/logout' do
    session.clear
    redirect '/'
  end
  
end