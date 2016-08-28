class DropsController < ApplicationController

  def index

  end

  def search
    result = HTTParty.get("https://glue-api.herokuapp.com/api/v1/drops/search", query: {:name => params[:query]})
    @drops = JSON.parse(result.body)["drops"]
    puts @drops
  end

  def show
    response = HTTParty.get("https://glue-api.herokuapp.com/api/v1/drops/get", query: {:name => params[:name]})
    @drop = JSON.parse(response.body)
    response = HTTParty.get("http://glue-api.herokuapp.com/api/v1/drops/versions", query: {:name => params[:name]})
    @versions = JSON.parse(response.body)["versions"]
    puts @versions
  end

  def detail
    response = HTTParty.get("https://glue-api.herokuapp.com/api/v1/drops/get", query: {:name => params[:name], :version => params[:version]})
    @drop = JSON.parse(response.body)
  end

  def vanity
    redirect_to "/drops/search/#{params[:query]}"
  end

end
