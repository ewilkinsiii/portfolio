class Addstatustoref < ActiveRecord::Migration[5.0]
  def change
    add_column :refs, :status, :integer, default: 0
  end
end
