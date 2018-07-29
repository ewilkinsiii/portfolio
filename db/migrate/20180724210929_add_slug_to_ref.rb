class AddSlugToRef < ActiveRecord::Migration[5.0]
  def change
    add_column :refs, :slug, :string
    add_index :refs, :slug, unique: true
  end
end
