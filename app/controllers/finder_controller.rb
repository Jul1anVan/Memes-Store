class FinderController < ApplicationController
  before_action :initialize_line_item

  before_action :fetch_search_params, only: [:search]

  def index
    @products = Product.all.page(params[:page]).per(3)
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
    if @category_params.present?
      @products = Product.where("name LIKE ? AND category_id LIKE ?",
                                '%' + @search_params + '%', @category_params).order('name').page(params[:page]).per(3)
      @category = Category.find(@category_params)
    else
      @products = Product.where('name like ?', '%' + @search_params + '%').order('name').page(params[:page]).per(3)
    end
  end

  private

  def initialize_line_item
    @line_item = current_order.line_items.new
  end

  def fetch_search_params
    @search_params = params[:search]
    @category_params = params[:category]
  end

end
