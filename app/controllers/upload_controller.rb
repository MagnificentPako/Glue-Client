class UploadController < ApplicationController

  def index
    redirect_to "/login" unless cookies[:jwt]
  end

  def post
    escaped = CGI::escape(params[:content])
    response = HTTParty.post("https://glue-api.herokuapp.com/api/v1/drops/new", :query => ({"name" => params[:name], "version" => params[:version], "content" => params[:content]}).as_json, :headers => {"Authorization" => cookies[:jwt]})

    redirect_to "/drop/#{params[:name]}/#{params[:version]}"

  end

end
