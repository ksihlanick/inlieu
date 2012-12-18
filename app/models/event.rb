# == Schema Information
#
# Table name: events
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  user_id      :integer
#  description  :string(255)
#  inlieuof     :string(255)
#  charity_name :string(255)
#  money_raised :decimal(8, 2)
#  goal_money   :decimal(8, 2)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Event < ActiveRecord::Base
  #attr_accessible :charity_name, :description, :goal_money, :inlieuof, :money_raised, :name, :user_id

  validates(:name, presence: true, length: {maximum: 50} )
  validates(:charity_name, presence: true, length: {maximum: 50} )
  validates(:goal_money, presence: true )

  validates :goal_money, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than => 0, :less_than => 200000}

  belongs_to :user
  has_many :payments

  def set_event_attributes(event_hash)
    self.name = event_hash[:name]
    self.inlieuof = event_hash[:inlieuof]
    self.description = event_hash[:description]
    self.goal_money = event_hash[:goal_money]
    self.charity_name = event_hash[:charity_name]
    self.money_raised = 0
    self.enddate = DateTime.now.utc + 15
    if event_hash[:video]
      self.video = event_hash[:video]
    end
  end

  def get_time_left()
    self.enddate - DateTime.now.utc
  end

end