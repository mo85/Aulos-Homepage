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
    l(d, :format => "%d. %B %Y, %H:%M")
  end
  
  def event_time_for_tooltip(d)
    l(d, :format => "%d. %B %Y, %H:%M Uhr")
  end
  
  def news_date_time_to_s(d)
    l(d, :format => "%d. %B %Y %H:%M")
  end
  
  def include_tinymce
    content_for :javascripts do
      javascript_include_tag("tiny_mce/tiny_mce")
    end
  end
  
  def has_errors(object)
    errors = false
    if object.is_a? Array
      object.each do |elem|
        return true if _has_error(elem)
      end
    else
      errors = _has_error(object)
    end
    errors
  end
  
  def error_count(object)
    count = 0
    if object.is_a? Array
      count = object.sum{|e| _error_count(e)}
    else
      count = _error_count(object)
    end
    count
  end
  
  private
  
  def _error_count(o)
    o.errors.count
  end
  
  def _has_error(o)
    o.errors.any?
  end
  
end
