class User < ActiveRecord::Base
  include Sluggable

  has_many :posts
  has_many :comments
  has_many :votes

  has_secure_password validations: false

  validates :user_name, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: { minimum: 4 }


  sluggable_column :user_name

  def admin?
    self.role == "admin"
  end

  def generate_pin!
    self.update_column(:pin, rand(10 ** 6))
  end

  def remove_pin!
    self.update_column(:pin, nil)
  end

  def send_pin_to_twilio
    account_sid = 'AC432c035129f7db36224b837bf7c1f09c' 
    auth_token = 'a405849fa418a1d48b416d80b2837379' 

    client = Twilio::REST::Client.new account_sid, auth_token 

    msg = "Hi, there! Please enter #{self.pin} to continue login."
    sms = client.account.messages.create({ :from => '+15005550006', :to => "+15092933599" , :body => msg })
    puts sms.body
  end

  def two_factor_auth?
    !self.phone.blank?
  end
end