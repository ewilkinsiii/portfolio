class RenameImageToPortfolioImages < ActiveRecord::Migration[5.0]
  def change
    rename_table :images, :portfolio_images
  end
end
