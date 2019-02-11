require 'rails_helper'

RSpec.describe Attendance, type: :model do
  
  before(:each) do
    @attendance = FactoryBot.create(:attendance)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@attendance).to be_a(Attendance)
      expect(@attendance).to be_valid        
    end

  
    describe "#stripe_customer_id" do
      it { expect(@attendance).to validate_presence_of(:stripe_customer_id) }
    end

  end

  context "associations" do
  
  
    it { expect(@attendance).to belong_to(:event) }
    it { expect(@attendance).to belong_to(:attendant).class_name('User') }
  end


end
