require "test_helper"

class CartTest < ActiveSupport::TestCase
  
  test "should add unique product to cart" do
    cart = carts(:one)
    product = products(:ruby)

    cart.add_product(product).save

    assert_equal 1, cart.line_items.count
  end

  test "should add duplicate product to cart" do
    cart = carts(:one)
    product = products(:ruby)

    cart.add_product(product).save
    cart.add_product(product).save

    assert_equal 1, cart.line_items.count
    assert_equal 2, cart.line_items.first.quantity
  end
  
end
