class News < ActiveRecord::Base
  belongs_to :user
  
  validates_presence_of :user_id, :message
  
  default_scope order("created_at DESC")
  
  def self.latest_news(number_of_news = 3)
    News.where("user_id != ?", 0).limit(number_of_news)
  end
  
end
