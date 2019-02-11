class Event < ApplicationRecord
    belongs_to :admin, class_name: "User"

    has_many :attendances
    has_many :attendants, class_name: "User", through: :attendances
end
