class User < ApplicationRecord
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
    # removed following line because mailer made HEROKU bug
     after_create :welcome_send 
    
    has_many :attendances
    has_many :attending_events, foreign_key: 'attendant_id', class_name: "Event"
    
    has_many :managed_events, foreign_key: 'admin_id', class_name: "Event"

    

    def welcome_send
      UserMailer.welcome_email(self).deliver_now
    end
  
end
