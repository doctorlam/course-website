class AddGoogleToSlidedeck < ActiveRecord::Migration
  def change
    add_column :slidedecks, :google, :string
  end
end
