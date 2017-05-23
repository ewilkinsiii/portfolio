class CreatePortfolioImages < ActiveRecord::Migration[5.0]
  def change
    create_table :portfolio_images do |t|
      t.string :image
      t.references :portfolio, foreign_key: true

      t.timestamps
    end
  end
end
