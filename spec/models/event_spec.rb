require 'rails_helper'

RSpec.describe Event, type: :model do

  before(:each) do
    @event = FactoryBot.create(:event)
  end

  context "validation" do

    it "is valid with valid attributes" do
      expect(@event).to be_a(Event)
      expect(@event).to be_valid        
    end

  
    describe "#start_date" do
      it { expect(@event).to validate_presence_of(:start_date) }
      it { is_expected.to allow_value("06/06/2020").for(:start_date) }
      it { is_expected.to allow_value("06-10-2024").for(:start_date) }
    end

    describe "#duration" do
      it { expect(@event).to validate_presence_of(:duration) }
      it { expect(@event.duration).to be_a(Integer) }
      it { is_expected.to allow_value(20).for(:duration) }
      it { is_expected.to allow_value(50).for(:duration) }
      it { is_expected.not_to allow_value(-5).for(:duration) }
    end
  
    describe "#title" do
      it { expect(@event).to validate_presence_of(:title) }
      it { is_expected.to allow_value("Mon super événement").for(:title) }
      it { is_expected.to allow_value("Coolos").for(:title) }
      it { is_expected.not_to allow_value("i").for(:title) }
      it { is_expected.not_to allow_value(8).for(:title) }
      it { is_expected.not_to allow_value("e Lorem Ipsum est simplement du faux texte employé dans la composition et la mise en page avant impression. Le Lorem Ipsum est le faux texte standard de l'imprimerie depuis les années 1500, quand un imprimeur anonyme assembla ensemble des morceaux de texte pour réaliser un livre spécimen de polices de texte. Il n'a pas fait que survivre cinq siècles, mais s'est aussi adapté à la bureautique informatique, sans que son contenu n'e").for(:title) }
    end
  
    describe "#description" do
      it { expect(@event).to validate_presence_of(:description) }
      it { is_expected.to allow_value("My super super evenement of the super class").for(:description) }
      it { is_expected.not_to allow_value("evenement").for(:description) }
    end


    describe "#price" do
      it { expect(@event).to validate_presence_of(:price) }
      it { is_expected.to allow_value(1).for(:price) }
      it { is_expected.to allow_value(15).for(:price) }
      it { is_expected.not_to allow_value(-2).for(:price) }
      it { is_expected.not_to allow_value("gratos").for(:price) }
    end

    describe "#location" do
      it { expect(@event).to validate_presence_of(:location) }
      it { is_expected.to allow_value("Paris").for(:location) }
      it { is_expected.to allow_value("Super").for(:location) }
    end
  
  end 
    
  context "associations" do
    it { expect(@event).to have_many(:attendances) }  
    it { expect(@event).to have_many(:attendants).class_name('User').through(:attendances) }
    it { expect(@event).to belong_to(:admin).class_name('User') }
  end 



end 