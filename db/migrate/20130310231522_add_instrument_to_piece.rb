class AddInstrumentToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :instrument, :string
  end
end
