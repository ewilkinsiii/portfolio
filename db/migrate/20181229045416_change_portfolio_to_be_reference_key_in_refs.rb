class ChangePortfolioToBeReferenceKeyInRefs < ActiveRecord::Migration[5.0]
  def change
    remove_column :refs, :project, :string
    add_column :refs, :portfolio_id, :integer, references: :portfolio
  end
end
