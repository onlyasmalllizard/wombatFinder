class AddTrueWomBatToWombat < ActiveRecord::Migration[6.0]
  def change
    add_column :wombats, :truewombat, :boolean
  end
end
