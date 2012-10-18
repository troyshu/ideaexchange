class ChangeDescriptionToText < ActiveRecord::Migration
  def up
  	change_column :ideas, :description, :text, :limit => nil
  end

  def down
  end
end
