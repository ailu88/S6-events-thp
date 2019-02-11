class Event < ApplicationRecord
    belongs_to :admin, class_name: "User"

    has_many :attendances
    has_many :attendants, class_name: "User", through: :attendances

    validates :start_date, presence: true
    validate :start_date_cannot_be_in_the_past?
    validates :duration, presence: true, if: :multiple_of_5
    validates :title, presence: true, length: {minimum: 5, maximum:140}
    validates :description, presence: true, length: {minimum: 20, maximum: 1000}
    validates :price, presence: true, length: {minimum: 1, maximum: 1000}
    validates :location, presence: true


    def start_date_cannot_be_in_the_past
        errors.add(:start_date, "can't be in the past") if
          !start_date.blank? and start_date < Date.today
      end


end
