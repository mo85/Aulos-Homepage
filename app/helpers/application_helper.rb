# encoding: utf-8 
module ApplicationHelper
  
  def mark_required(object, attribute)
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
  end
  
  def prompt_for_selects
    { :prompt => "Bitte auswählen..."}
  end
  
end
