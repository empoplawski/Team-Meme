class AddFavoriteCaptionColumn < ActiveRecord::Migration[5.1]
  def change
    add_column :captions, :favorite, :boolean, default: false
  end
end
