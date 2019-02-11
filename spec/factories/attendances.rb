FactoryBot.define do
  factory :attendance do
    event { FactoryBot.create(:event) }
    attendant { FactoryBot.create(:user) }
    stripe_customer_id { Faker::HarryPotter.spell }    
  end
end
