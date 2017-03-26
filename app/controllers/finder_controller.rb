class FinderController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def category
    @params = params[:category]

    @category = Category.find(@params)
    @products = Product.where(:category_id => @params).all
  end

  def search
    @params = params[:search]
    @products = Product.where("name like ?", "%"+@params+"%")
  end
end
