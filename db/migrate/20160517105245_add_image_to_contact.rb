class AddImageToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :image, :string
  end
end
