class Attendance < ApplicationRecord
    after_create :confirmation_send
    
    belongs_to :event
    belongs_to :attendant, class_name: "User"

    validates :stripe_customer_id, presence: true
end
