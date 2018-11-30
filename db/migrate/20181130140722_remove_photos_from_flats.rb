class RemovePhotosFromFlats < ActiveRecord::Migration[5.2]
  def change
    remove_column :flats, :photos, :json
  end
end
