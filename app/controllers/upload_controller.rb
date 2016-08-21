class UploadController < ApplicationController

  def index

  end

  def post
    escaped = CGI::escape(params[:content])
    response = HTTParty.post("https://glue-api.herokuapp.com/api/v1/drops/new", :query => ({"name" => params[:name], "version" => params[:version], "content" => params[:content]}).as_json, :headers => {"Authorization" => params[:jwt]})
    puts response.code
    puts "sent"
  end

end
