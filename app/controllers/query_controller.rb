class QueryController < ApplicationController
  def search_result
    require 'nokogiri'
    require 'open-uri'
    require 'rubygems'
    
    if params[:keyword] != nil && params[:keyword] != ""
      @query = params[:keyword]
      if @query.gsub(" ", "%20") != nil
        @query.gsub!(" ", "%20")
      end
      @url = "http://clio.columbia.edu/catalog?q=#{@query}"
      @result = Nokogiri::HTML(open(@url))  
      @result = @result.css(".item_select_allowance")
      if @result.count == 0
        @result = 0
      end
    else
      @result = "Type a book name"
    end
    
  end
end
