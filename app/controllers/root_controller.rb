class RootController < ApplicationController
  
  def index
    @news_entries = News.latest_news 3
  end
  
  def about
    
  end
  
  def contact
  end

end
