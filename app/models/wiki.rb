class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  
  validates :user, presence: true
  validates :body, length: {minimum: 20}, presence: true
  validates :title, length: {minimum: 5}, presence: true
end
