class Idea < ActiveRecord::Base
  attr_accessible :description, :name
  validates :name, presence: true
  validates :description, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :submitter_email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
