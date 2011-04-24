class Kontakt < ActionMailer::Base
  
  def send_email_to_me(from, subject, body)
    content_type 'text/plain'
    recipients "eliksirstudenta@gmail.com"
    bcc        "eliksirstudenta@gmail.com"
    subject    from + " : " + subject
    body       body
    sent_on    Time.now
   end

  def send_confirmation_email(player)
    @body["hash"] = player.generate_hash
    @body["player"] = player
    @content_type = 'text/html'
    @recipients = player.email
    @from = "eliksirstudenta@gmail.com"
    @subject = "Potwierdzenie rejestracji do Juwenaliowej Gry Miejskiej Magiczny Eliksir Studenta"
    @sent_on = Time.now
  end
end
