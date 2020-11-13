class CreateWombats < ActiveRecord::Migration[6.0]
  def change
    create_table :wombats do |t|
      t.string :url

      t.timestamps
    end
  end
end
