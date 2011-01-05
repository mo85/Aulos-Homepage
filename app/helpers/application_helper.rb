# encoding: utf-8 
module ApplicationHelper
  
  def mark_required(object, attribute)
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
  end
  
  def prompt_for_selects
    { :prompt => "Bitte auswählen..."}
  end
  
  def current_project
    Project.current
  end
  
  def number_to_chf number
    number_to_currency(number, :unit => "CHF ")
  end
  
  def event_date_time_to_s(d)
    l(d, :format => "%d. %B %Y - %H:%m")
  end
  
  def news_date_time_to_s(d)
    l(d, :format => "%d. %B %Y %H:%m")
  end
  
  def include_tinymce
    content_for :javascripts do
      javascript_include_tag("tiny_mce/tiny_mce")
    end
  end
  
end
