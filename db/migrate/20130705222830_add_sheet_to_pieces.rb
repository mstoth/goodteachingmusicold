class AddSheetToPieces < ActiveRecord::Migration
  def change
    add_column :pieces, :sheet, :string
  end
end
