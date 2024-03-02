class CreateShows < ActiveRecord::Migration[7.0]
  def change
    create_table :shows, id: :uuid do |t|
      t.string :image
      t.string :title
      t.integer :rating, limit: 1

      t.timestamps
    end
  end
end
