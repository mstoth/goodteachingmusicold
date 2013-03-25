class AddCommentToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :comment, :string
  end
end
