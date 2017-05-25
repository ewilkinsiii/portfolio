class ChangeImageToText < ActiveRecord::Migration[5.0]
  def change
    change_column :portfolio_images, :image, :text
  end
end
