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
  attr_accessible :charity_name, :description, :goal_money, :inlieuof, :money_raised, :name, :user_id

  validates(:name, presence: true, length: {maximum: 50} )
  validates(:charity_name, presence: true, length: {maximum: 50} )
  validates(:goal_money, presence: true )

  validates :goal_money, :format => { :with => /^\d+??(?:\.\d{0,2})?$/ }, :numericality => {:greater_than => 0, :less_than => 200000}

end
