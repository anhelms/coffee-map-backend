class AddIsDemoToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :is_demo, :boolean, default: false
  end
end
