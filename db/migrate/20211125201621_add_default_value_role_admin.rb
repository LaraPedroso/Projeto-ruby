class AddDefaultValueRoleAdmin < ActiveRecord::Migration[6.1]
  def change
    change_column :admins, :role_id, :bigint, :default => '2'
  end
end
