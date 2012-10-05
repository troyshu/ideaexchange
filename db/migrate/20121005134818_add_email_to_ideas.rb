class AddEmailToIdeas < ActiveRecord::Migration
  def change
  	add_column :ideas, :submitter_email, :string
  end
end
