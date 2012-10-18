class CreateTempDescriptions < ActiveRecord::Migration
  def change
    create_table :temp_descriptions do |t|
      t.text :description

      t.timestamps
    end
  end
end
