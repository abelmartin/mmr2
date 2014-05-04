class AllowNullForLastName < ActiveRecord::Migration
  def change
    change_column :users, :last_name, :string, null: true
  end
end
