class AddApprovedToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :approved, :boolean, :default=>false
  end
end
