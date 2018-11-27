class AddPhotosToFlats < ActiveRecord::Migration[5.2]
  def change
    add_column :flats, :photos, :json
  end
end
