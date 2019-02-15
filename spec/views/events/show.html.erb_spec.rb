require 'rails_helper'

RSpec.describe "events/show.html.erb", type: :view do
  before { allow(controller).to receive(:current_user) { @user } }
  context 'when displaying an event' do
    it "shows the button when is admin" do
      @user = FactoryBot.create(:user)
      @event = FactoryBot.create(:event)
      @attendance = FactoryBot.create(:attendance)
      
      # assign(:event, @event)
      @admin = @event.admin
      @participants = @event.attendants

      def is_admin?(user)
        true
      end

      def is_not_linked_to(user)
        true
      end

      render

      expect(rendered).to match /Admin/
    end

    it 'hides the button when already participating' do
      @user = FactoryBot.create(:user)
      @event = FactoryBot.create(:event)
      @attendance = FactoryBot.create(:attendance)
      
      # assign(:event, @event)
      @admin = @event.admin
      @attendants = @event.attendants

      def is_creator?(user)
        false
      end
      def is_not_linked_to(user)
        false
      end

      render

      expect(rendered).not_to match /Subscribe/
    end


    it 'displays the details' do
      @user = FactoryBot.create(:user)
      @admin = FactoryBot.create(:user)
      @event = FactoryBot.create(:event)
      @attendance = FactoryBot.create(:attendance)
      @attendants = @event.attendants

      def is_admin?(user)
        false
      end
      def is_not_linked_to(user)
        true
      end

      render

      expect(rendered).to match /UTC/
    end
  end
end
