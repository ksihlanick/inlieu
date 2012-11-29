require 'spec_helper'

describe "EventPages" do
  #describe "GET /user_pages" do
  subject { page }

  describe "Event index" do
    before { visit events_path }

    it { should have_selector('h1',    text: 'Events Index') }
  end

  describe "Events new" do
    before { visit new_event_path }

    it { should have_selector('h1',    text: 'Events#new') }
  end

  describe "profile page" do
	let(:event) { FactoryGirl.create(:event) }
	before { visit event_path(event) }

	it { should have_selector('h1',	text: event.name) }
	it { should have_selector('h1', text: event.description) }
	it { should have_selector('h1',	text: event.charity_name) }
	it { should have_selector('h1', text: event.inlieuof) }
	it { should have_selector('h1',	number: event.money_raised) }
	it { should have_selector('h1', number: event.goal_money) }
	end
end
