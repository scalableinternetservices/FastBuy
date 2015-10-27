require 'test_helper'

class SaleProductsControllerTest < ActionController::TestCase
  setup do
    @sale_product = sale_products(:one)
    @update = {
      product_id: 3,
      price: 10.99,
      quantity: 100,
      started_at: '2015-11-10 12:12:12',
      expired_at: '2015-11-11 12:12:12'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sale_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sale_product" do
    assert_difference('SaleProduct.count') do
      post :create, sale_product: @update
  end

    assert_redirected_to sale_product_path(assigns(:sale_product))
  end

  test "should show sale_product" do
    get :show, id: @sale_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sale_product
    assert_response :success
  end

  test "should update sale_product" do
    patch :update, id: @sale_product, sale_product: @update
    assert_redirected_to sale_product_path(assigns(:sale_product))
  end

  test "should destroy sale_product" do
    assert_difference('SaleProduct.count', -1) do
      delete :destroy, id: @sale_product
    end

    assert_redirected_to sale_products_path
  end
end
