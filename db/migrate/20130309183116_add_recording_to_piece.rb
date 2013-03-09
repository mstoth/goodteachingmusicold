class AddRecordingToPiece < ActiveRecord::Migration
  def change
    add_column :pieces, :recording, :string
  end
end
