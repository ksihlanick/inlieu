# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  #attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password
  
  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates(:name, presence: true, length: {maximum: 50} )
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:true, format: { with: VALID_EMAIL_REGEX },
  					uniqueness: { case_sensitive: false}
  validates :password, presence: true, length: {minimum: 6 }  
  validates :password_confirmation, presence: true

  #validates_presence_of :password, :on => :create

  has_many :events#, dependent: :destroy

  # def destroy_events
  #   for yaay in self.events do:
  #     gone = yaay.destroy()
  #   end
  # end

  def set_user_attributes(user_hash)
    self.name = user_hash[:name]
    self.email = user_hash[:email]
    self.password = user_hash[:password]
    self.password_confirmation = user_hash[:password_confirmation]
    self.admin = false
    self.confirmed = false
  end
  def update_user_attributes(user_hash)
    self.name = user_hash[:name]
    self.email = user_hash[:email]
    self.password = user_hash[:password]
    self.password_confirmation = user_hash[:password_confirmation]
  end

  def generate_token(column)  
      begin  
        self[column] = SecureRandom.urlsafe_base64  
      end while User.exists?(column => self[column])  
    end  

  def send_password_reset  
    generate_token(:password_reset_token)  
    self.password_reset_sent_at = Time.zone.now  
    save!(:validate => false) 
    UserMailer.password_reset(self).deliver  
  end

  def set_confirmation
    self.confirmed = true
    save!(:validate => false)
  end

  def update_password(user_hash)
    self.password = user_hash[:password]
    self.password_confirmation = user_hash[:password_confirmation]
    save
  end  

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
    
end
