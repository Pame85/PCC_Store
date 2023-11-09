class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.string :ref_no
      t.decimal :subtotal
      t.decimal :price
      t.boolean :paid

      t.timestamps
    end
  end
end
