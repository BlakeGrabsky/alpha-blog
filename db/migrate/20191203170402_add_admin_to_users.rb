class AddAdminToUsers < ActiveRecord::Migration[6.0]
  def change
	#add_column :table_to_add_column_to, :column_name, :column_data_type, default: value
	add_column :users, :admin, :boolean, default: false
  end
end
