class Payment < ActiveRecord::Base
  attr_accessible :name, :email, :money_raised, :stripe_card_token, :event_id
  attr_accessor :stripe_card_token
  after_create :total

  belongs_to :event
  

  def set_payment_attributes(payment_hash)
    self.name = payment_hash[:name]
    self.email = payment_hash[:email]
    self.money_raised = payment_hash[:money_raised]
    self.stripe_card_token = payment_hash[:stripe_card_token]
    self.event_id = payment_hash[:event_id]
  end

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
