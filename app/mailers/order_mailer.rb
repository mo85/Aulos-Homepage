class OrderMailer < ActionMailer::Base
  #default :from => "no-reply@aulos.ch"
  default :from => "aulos.orchester@gmail.com"
  
  def order_confirmation
    mail(:to => "mark.odermatt@gmail.com", :subject => "Bestell Bestaetigung")
  end
end
