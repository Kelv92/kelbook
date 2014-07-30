class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  # Added to use gem : Commontator~June
  acts_as_commontator
  acts_as_messageable
  enum role: [:user, :vip, :admin]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         validates :first_name, presence: true
         validates :last_name, presence: true
         validates :profile_name, presence: true,
         						  uniqueness: true,
         						  format: {
         						  	with: /\A[a-zA-Z0-9_-]+\z/,
         						  	message: "Must be formatted correctly."
         						  }
 	has_many :status
def gravitar_url
  stripped_email = email.strip
  downcase_email = stripped_email.downcase
  hash = Digest::MD5.hexdigest(downcase_email)
  "http://gravatar.com/avatar/#{hash}"
end

def name
  email
end

def mailboxer_email(object)
  #Check if an email should be sent for that object
  #if true
  email
  #if false
  #return nil
end

end
