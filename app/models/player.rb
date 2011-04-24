class Player < ActiveRecord::Base

  belongs_to :team

  validates_presence_of :first_name
  validates_presence_of :surename
  validates_presence_of :email

  def generate_hash
    salt = Player.random_string(10)
    self.update_attributes(:salt => salt)
    return Digest::SHA1.hexdigest(salt)
  end

protected

  def self.random_string(len)
    #generat a random password consisting of strings and digits
    chars = ("a".."z").to_a + ("A".."Z").to_a + ("0".."9").to_a
    newpass = ""
    1.upto(len) { |i| newpass << chars[rand(chars.size-1)] }
    return newpass
  end
end
