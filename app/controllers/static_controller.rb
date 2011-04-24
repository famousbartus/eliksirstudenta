class StaticController < ApplicationController

  def index
    
  end

  def legenda
    
  end

  def send_email
    from = params[:email][:from]
    body = params[:email][:body]
    title = params[:email][:title]

    mail = Kontakt.create_send_email_to_me(from, title, body)
    Kontakt.deliver(mail)
    flash.now[:notice] = "Twoja wiadomość została wysłana."
    render :action => :kontakt
  end
end
