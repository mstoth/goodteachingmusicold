class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :title
      t.string :composer
      t.string :genre

      t.timestamps
    end
  end
end
