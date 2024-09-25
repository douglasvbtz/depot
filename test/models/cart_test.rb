require "test_helper"

class CartTest < ActiveSupport::TestCase
  
  test "should add unique product to cart" do
    cart = carts(:one)       # Obtém o carrinho de teste nomeado 'one'
    product = products(:ruby) # Obtém o produto de teste nomeado 'ruby'

    cart.add_product(product).save # Adiciona o produto ao carrinho

    assert_equal 1, cart.line_items.count # Verifica se há 1 item no carrinho
  end

  test "should add duplicate product to cart" do
    cart = carts(:one)       # Obtém o carrinho de teste nomeado 'one'
    product = products(:ruby) # Obtém o produto de teste nomeado 'ruby'

    cart.add_product(product).save # Adiciona o produto ao carrinho pela primeira vez
    cart.add_product(product).save # Adiciona o mesmo produto novamente

    assert_equal 1, cart.line_items.count # Verifica se ainda há apenas 1 item no carrinho
    assert_equal 2, cart.line_items.first.quantity # Verifica se a quantidade do item é 2
  end
  
end
