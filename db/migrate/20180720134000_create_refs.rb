class CreateRefs < ActiveRecord::Migration[5.0]
  def change
    create_table :refs do |t|
      t.string :name
      t.string :email
      t.boolean :may_contact
      t.text :comment
      t.integer :years_known
      t.string :company
      t.string :project
      t.string :code
      t.references :relationship, foreign_key: true
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
