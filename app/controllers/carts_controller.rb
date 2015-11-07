class CartsController < ApplicationController
  include CurrentCart
  before_action :set_cart
  
  # GET /cart
  def show
    if @cart.class == Hash
      render "carts/_cart" 
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    if @cart.class == Hash
       session[:cart] = nil
    else @cart.class == Cart
      @cart.destroy
    end
    respond_to do |format|
      format.html { redirect_to store_url  }
      format.json { head :no_content }
    end
  end

 end
