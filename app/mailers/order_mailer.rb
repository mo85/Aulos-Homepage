class OrderMailer < ActionMailer::Base
  default :from => "no-reply@aulos.ch"
  
  def order_confirmation
    mail(:to => "mark.odermatt@gmail.com", :subject => "Bestell Bestaetigung")
  end
end
