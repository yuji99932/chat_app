class AddArtistToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :artist, :string
  end
end
