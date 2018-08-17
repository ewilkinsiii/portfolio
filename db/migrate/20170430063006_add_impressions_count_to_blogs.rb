class AddImpressionsCountToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :impressions_count, :integer, :default => 0
  end
end