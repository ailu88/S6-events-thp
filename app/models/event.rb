class Event < ApplicationRecord
    belongs_to :admin, class_name: "User"

    has_many :attendances
    has_many :attendants, class_name: "User", through: :attendances

    validates :start_date, presence: true
    validate :start_date_cannot_be_in_the_past
    validates :duration, presence: true, numericality: { only_integer: true, greater_than: 1}
    validate :duration_is_multiple_of_5
    validates :title, presence: true, length: {minimum: 5, maximum:140}
    validates :description, presence: true, length: {minimum: 20, maximum: 1000}
    validates :price, presence: true, numericality: {greater_than: 0, less_or_equal_to: 1000}
    validates :location, presence: true


    def start_date_cannot_be_in_the_past
        if start_date.present? && start_date > Date.today
            errors.add(:start_date, "can't be in the past")
        end
      end

    def duration_is_multiple_of_5
        if duration.to_f % 5 == 0
            return true
        else 
            errors.add(:duration, "can't be other than a multiple of 5")
        end 
    end

end
