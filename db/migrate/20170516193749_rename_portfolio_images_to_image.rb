class RenamePortfolioImagesToImage < ActiveRecord::Migration[5.0]
   def change
    rename_table :portfolio_images, :images
   end 
end