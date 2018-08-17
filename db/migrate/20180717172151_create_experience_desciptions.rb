class CreateExperienceDesciptions < ActiveRecord::Migration[5.0]
  def change
    create_table :experience_desciptions do |t|
      t.string :name
      t.text :body
      t.references :experience, foreign_key: true
      t.integer  :position
      t.timestamps
    end
  end
end
