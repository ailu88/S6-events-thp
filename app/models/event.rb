class Event < ApplicationRecord
    belongs_to :admin, class_name: "User"

    has_many :attendances
    has_many :attendants, class_name: "User", through: :attendances

    has_one_attached :avatar

    validates :start_date, presence: true
    validate :start_date_cannot_be_in_the_past
    validates :duration, presence: true, numericality: { only_integer: true, greater_than: 1}
    validate :duration_is_multiple_of_5
    validates :title, presence: true, length: {minimum: 5, maximum:140}
    validates :description, presence: true, length: {minimum: 20, maximum: 1000}
    validates :price, presence: true, numericality: {greater_than: 0, less_or_equal_to: 1000}
    validates :location, presence: true
    
    
    

    def start_date_cannot_be_in_the_past
        errors.add(:start_date, "can't be in the past") if
        !start_date.blank? && start_date < Time.now
    end

    def duration_is_multiple_of_5
            errors.add(:duration, "is multiple of 5") if
            duration.to_f % 5 != 0
    end

end
