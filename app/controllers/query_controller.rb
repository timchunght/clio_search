class QueryController < ApplicationController
  def search_result
    require 'nokogiri'
    require 'open-uri'
    require 'rubygems'
    if params[:keyword] != ""
      @query = params[:keyword]
      if @query.gsub(" ", "%20") != nil
        @query.gsub!(" ", "%20")
      end
      @url = "http://clio.columbia.edu/catalog?q=#{@query}"
      @result = Nokogiri::HTML(open(@url))  
    else
      @result = "Type a book name"
    end
  end
end
