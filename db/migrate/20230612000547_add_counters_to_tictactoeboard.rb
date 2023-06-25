class AddCountersToTictactoeboard < ActiveRecord::Migration[7.0]
  def change
    add_column :tictactoeboards, :circles_count, :integer, default: 0
    add_column :tictactoeboards, :crosses_count, :integer, default: 0
  end
end
