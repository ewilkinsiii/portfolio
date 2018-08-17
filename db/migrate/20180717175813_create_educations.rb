class CreateEducations < ActiveRecord::Migration[5.0]
  def change
    create_table :educations do |t|
      t.string :name
      t.string :title
      t.text :description
      t.string :state
      t.string :city
      t.string :start_month
      t.integer :start_year
      t.string :end_month
      t.integer :end_year
      t.text    :thumb_image
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
