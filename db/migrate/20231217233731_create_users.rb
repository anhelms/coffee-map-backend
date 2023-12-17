class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      has_many reviews
      has_many trips
      
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :image_url

      t.timestamps
    end
  end
end
