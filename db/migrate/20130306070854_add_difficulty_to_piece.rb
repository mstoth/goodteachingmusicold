class AddDifficultyToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :difficulty, :string
  end
end
