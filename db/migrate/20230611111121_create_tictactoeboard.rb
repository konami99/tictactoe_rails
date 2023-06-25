class CreateTictactoeboard < ActiveRecord::Migration[7.0]
  def change
    create_table :tictactoeboards do |t|
      t.string :channel
      t.boolean :player_1
      t.boolean :player_2
      t.string :cell_1
      t.string :cell_2
      t.string :cell_3
      t.string :cell_4
      t.string :cell_5
      t.string :cell_6
      t.string :cell_7
      t.string :cell_8
      t.string :cell_9

      t.timestamps
    end
  end
end
