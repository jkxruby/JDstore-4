class ProductsController < ApplicationController
  before_action :authenticate_user!

  def show
    @product = Product.find(params[:id])
  end

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
     redirect_to products_path,notice: "update success..."
   else
     render :edit
   end
 end

 def destroy
   @product = Product.find(params[:id])
   @prodcut.destroy
   redirect_to products_path, alert: "delete success😄"
 end

 def add_to_cart
   @product = Product.find(params[:id])
   if !current_cart.products.include?(@product)
   current_cart.add_product_to_cart(@product)
   flash[:notice] = "#{@product.title}成功加入购物车"
 else
   flash[:warning] = "你的购物车已有此产品"
 end
   redirect_to :back
 end

   private
   def product_params
     params.require(:product).permit(:title, :description, :price, :quantity, :image)
   end

end
