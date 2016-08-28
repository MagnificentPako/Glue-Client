class UsersController < ApplicationController

  def new
    redirect_to "/" if cookies[:jwt]
  end

  def login
    response = HTTParty.post("https://glue-api.herokuapp.com/api/v1/user/login", query: {:name => params[:name], :password => params[:password]})
    response = JSON.parse(response.body)

    if(response["error"]) then return nil end

    cookies[:jwt] = {:value => response["jwt"], :expires => Time.now + 3600}

    redirect_to "/"
  end

  def logout
    cookies.delete :jwt
    redirect_to "/"
  end

  def create
    redirect_to "/" if cookies[:jwt]
  end

  def register
    response = HTTParty.post("https://glue-api.herokuapp.com/api/v1/user/register", query: {:name => params[:name], :password => params[:password]})
    response = JSON.parse(response.body)

    if(response["error"]) then return nil end

    cookies[:jwt] = {:value => response["jwt"], :expires => Time.now + 3600}

    redirect_to "/"
  end

end
