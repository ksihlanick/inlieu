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

  attr_accessible :avatar
  has_attached_file :avatar, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }

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
    self.video = event_hash[:video]
    self.approved = false
    self.rejected = false
    self.avatar = event_hash[:avatar]
  end

  def set_approved()
    self.enddate = DateTime.now.utc + 15
    self.approved = true
  end

  def set_rejected()
    self.rejected = true
  end

  def get_time_left()
    self.enddate - DateTime.now.utc
  end

  def is_active()
    if (self.enddate > DateTime.now.utc) && (self.approved == true)
      return true
    else
      return false
    end
  end

end