class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :wikis
  has_many :collaborators
  
  enum role: [:standard, :premium, :admin]
  
  after_initialize :set_role_to_standard
  
  def set_role_to_standard
    self.role ||= "standard"
  end
  
end
