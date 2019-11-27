class AddColumnToExcludeds < ActiveRecord::Migration[5.2]
  def change
    remove_column :excludeds, :message_id
    add_reference :excludeds, :post, index: true
  end
end
