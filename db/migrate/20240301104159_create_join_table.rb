class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :characters, :shows, column_options: {type: :uuid} do |t|
      t.index [:character_id, :show_id]
      # t.index [:show_id, :character_id]
    end
  end
end
