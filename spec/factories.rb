FactoryGirl.define do
  factory :user do
    name  "Kevin Sihlanick"
    email "kevin@inlieugiving.net"
    password  "foobar1"
    password_confirmation "foobar1"
  end
  factory :event do
  	name          "Your Mom's Event"
  	user_id       1
  	money_raised  10.00
  	inlieuof      'birthday'
  	goal_money    100000
  	charity_name  "The Red Cross"
  end
end

@event = Event.new(name: "Doowap", user_id: 4, money_raised: 10.00, 
    	inlieuof: 'birthday', goal_money: 10000.00, description: "Charity. Bam", 
    	charity_name: "Olin College")