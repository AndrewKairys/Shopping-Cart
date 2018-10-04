class AddQuantityOrderItems < ActiveRecord::Migration[5.1]
  def change
    add_column :order_items, :quantity, :integer, default: 1
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
