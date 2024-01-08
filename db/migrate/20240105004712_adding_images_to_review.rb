class AddingImagesToReview < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :image, :string
    add_column :reviews, :image_one, :string
    add_column :reviews, :image_two, :string
  end
end
