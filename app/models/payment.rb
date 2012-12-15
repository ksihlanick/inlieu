class Payment < ActiveRecord::Base
  attr_accessible :name, :email, :money_raised, :stripe_card_token, :event_id
  attr_accessor :stripe_card_token
  after_create :total

  belongs_to :event
  
  def save_with_payment
    if valid?
      mymoney = Stripe::Charge.create(:amount => money_raised, :currency => "usd", :card => stripe_card_token, :description => email)      
      save!
    end
  rescue Stripe::InvalidRequestError => e
    logger.error "Stripe error while creating customer: #{e.message}"
    errors.add :base, "There was a problem with your credit card."
    false
  end

  def total
    self.event.money_raised = self.event.money_raised + self.money_raised
    self.event.save!
  end
end
