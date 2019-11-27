class CreateExcludeds < ActiveRecord::Migration[5.2]
  def change
    create_table :excludeds do |t|
      t.references :user, foreign_key: { to_table: :users }
      t.references :message, foreign_key: { to_table: :messages }
      t.timestamps
    end
  end
end
