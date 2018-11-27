class AddNameToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :name, :string
  end
end
