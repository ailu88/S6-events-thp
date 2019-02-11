class User < ApplicationRecord

    has_many :attendances
    has_many :attending_events, foreign_key: 'attendant_id', class_name: "Event"
    
    has_many :managed_events, foreign_key: 'admin_id', class_name: "Event"

end
