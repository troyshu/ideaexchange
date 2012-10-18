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

require 'test_helper'

class IdeaTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
