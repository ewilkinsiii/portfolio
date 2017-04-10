class AddKeywordsToBlogs < ActiveRecord::Migration[5.0]
  def change
    add_column :blogs, :keywords, :text
  end
end
