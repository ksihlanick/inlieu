require 'spec_helper'

describe "UserPages" do
  #describe "GET /user_pages" do
  subject { page }

  describe "Users index" do
    before { visit users_path }

    it { should have_selector('h1',    text: 'Users Index') }
  end

  describe "Users new" do
    before { visit new_user_path }

    it { should have_selector('h1',    text: 'Users#new') }
  end

  describe "profile page" do
	let(:user) { FactoryGirl.create(:user) }
	before { visit user_path(user) }

	it { should have_selector('h1',	text: user.name) }
	it { should have_selector('h1', text:user.email) }
	end
end
