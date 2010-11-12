class Product < ActiveRecord::Base
  
  validates_presence_of :title, :price, :description
  validates_numericality_of :price
  validates_uniqueness_of :title
  
  validate :price_must_be_at_least_5_cents
  
  has_many :line_items
  
  protected
  
  def price_must_be_at_least_5_cents
    errors.add(:price, "sollte mindestens 5 Rappen betragen") if price.nil? || price < 0.05
  end
  
end
