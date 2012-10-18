# == Schema Information
#
# Table name: ideas
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  description     :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  submitter_email :string(255)
#

class Idea < ActiveRecord::Base
  attr_accessible :description, :name, :submitter_email
  validates :name, presence: true
  validates :description, presence: true
  validates_length_of :name, :maximum => 100
  validates_length_of :description, within: 200..1000
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :submitter_email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
