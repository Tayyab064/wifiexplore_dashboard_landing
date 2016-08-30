class Verification < ActiveRecord::Base
  belongs_to :user

  before_create :generate_email_code

  private

  def generate_email_code
  	begin
      self.email_token = SecureRandom.hex.to_s
    end while self.class.exists?(email_token: email_token)
  end
  
end
