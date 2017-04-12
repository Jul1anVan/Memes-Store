class FinderController < ApplicationController
  before_action :initialize_line_item

  def index
    @products = Product.all().page(params[:page]).per(3)
    #@products = Product.all
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
    @search_params = params[:search]
    @category_params = params[:category]

    if @category_params.present?
        @products = Product.where("name LIKE ? AND category_id LIKE ?", '%'+@search_params+'%',  @category_params).order('name').page(params[:page]).per(3)
        @category = Category.find(@category_params)
    else
      @products = Product.where("name like ?", "%"+@search_params+"%").order('name').page(params[:page]).per(3)
    end
  end

  private

  def initialize_line_item
    @line_item = current_order.line_items.new
  end

end
