class Addimagetoskills < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :image, :text
    add_reference :skills, :skill_category, foreign_key: true
  end
end
