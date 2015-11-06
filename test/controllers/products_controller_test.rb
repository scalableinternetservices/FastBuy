require 'test_helper'
class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @update = {
      title:       'Lorem Ipsum',
      description: 'Wibbles are fun!',
      image_url:   'lorem.jpg',
      quantity:    1,
      rating:      1.0,
      price:       19.95,
      sale:        false,
      seller:      @product.seller_id
    }
    @seller = sellers(:one)
    sign_in @seller
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: @update
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: @update
    assert_redirected_to product_path(assigns(:product))
  end


  test "should destroy product" do
    LineItem.find(@product.id).destroy
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end

  test "should get product page" do
    get :show, id: @product
    assert_response :success
    assert_not_nil '#product_description'
    assert_not_nil '#product_image'
    assert_select '#product_price', /\$[,\d]+\.\d\d/
    assert_select '#product_rating', /\d\.\d/
    assert_select '#product_quantity', /\d+/
  end
end

