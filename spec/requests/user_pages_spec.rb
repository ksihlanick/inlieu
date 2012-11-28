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

  describe "signup" do
    before { visit new_user_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
      end

      it "should create a user" do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
end

  describe "profile page" do
	let(:user) { FactoryGirl.create(:user) }
	before { visit user_path(user) }

	it { should have_selector('h1',	text: user.name) }
	it { should have_selector('h1', text:user.email) }
	end
end
