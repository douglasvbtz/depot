class AddPriceToLineItems < ActiveRecord::Migration[7.0]
  def change
    add_column :line_items, :price, :decimal, precision: 8, scale: 2
  end

  def up
    LineItem.all.each do |line_item|
      line_item.update(price: line_item.product.price)
    end
  end
  
end
