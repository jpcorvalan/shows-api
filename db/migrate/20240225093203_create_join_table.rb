class CreateJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :shows, :characters do |t|
      # t.index [:show_id, :character_id]
      # t.index [:character_id, :show_id]
    end
  end
end
