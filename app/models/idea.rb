# == Schema Information
#
# Table name: ideas
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  description     :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  submitter_email :string(255)
#

class Idea < ActiveRecord::Base
  attr_accessible :description, :name, :submitter_email
  validates :name, presence: true
  validates :description, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :submitter_email, presence: true, format: { with: VALID_EMAIL_REGEX }
end
