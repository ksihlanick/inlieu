FactoryGirl.define do
  factory :user do
  	name	"Kevin Sihlanick"
  	email	"kevin@example.com"
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

@event = Event.new(name: "Your Mom's Event", user_id: 1, money_raised: 10.00, 
    	inlieuof: 'birthday', goal_money: 10000.00, description: "Your mom needs this so bad, so bad, so bad. Charity. Bam", 
    	charity_name: "The Red Cross")