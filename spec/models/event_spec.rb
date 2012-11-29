# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  event_id      :integer
#  description  :string(255)
#  inlieuof     :string(255)
#  charity_name :string(255)
#  money_raised :decimal(8, 2)
#  goal_money   :decimal(8, 2)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'spec_helper'

describe Event do
  before do
    @event = Event.new(name: "Your Mom's Event", user_id: 1, money_raised: 10.00, 
    	inlieuof: 'birthday', goal_money: 10000.00, description: "Your mom needs this so bad, so bad, so bad. Charity. Bam", 
    	charity_name: "The Red Cross")
  end

  subject { @event }
  it { should respond_to(:name) }
  it { should respond_to(:user_id) }
  it { should respond_to(:money_raised) }
  it { should respond_to(:inlieuof) }
  it { should respond_to(:goal_money) }
  it { should respond_to(:description) }
  it { should respond_to(:charity_name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @event.name = " " }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @event.name = "a" * 51}
    it { should_not be_valid }
  end

  describe "when charity_name is not present" do
    before { @event.charity_name = " "}
    it { should_not be_valid }
  end

  describe "when goal_money is greater than zero" do
    before { @event.goal_money = 0}
    it { should_not be_valid }
  end

  describe "when goal_money is less than 200,000" do
    before { @event.goal_money = 200001}
    it { should_not be_valid }
  end

  describe "when goal_money is malformed" do
    before { @event.goal_money = 0.00153}
    it { should_not be_valid }
  end

end
