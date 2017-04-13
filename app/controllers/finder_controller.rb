class FinderController < ApplicationController
  before_action :initialize_line_item

  before_action :fetch_search_params, :search_presence, only: [:search]

  def index
    @products = Product.all.page(params[:page]).per(3)
  end

  def show
    @product = Product.find(params[:id])
  end

  def category
    @params = params[:category]

    @category = Category.find(@params)
    @products = Product.where(category_i: @params).all
  end

  def page
    @params = params[:page]

    @page = Page.find(@params)
  end

  def search
    return if @category_params.present?
    @products = Product.where('name like ?', '%' +
    @search_params + '%').order('name').page(params[:page]).per(3)
  end

  private

  def initialize_line_item
    @line_item = current_order.line_items.new
  end

  def fetch_search_params
    @search_params = params[:search]
    @category_params = params[:category]
  end

  def search_presence
    return if @category_params.blank?
    @products = Product.where('name LIKE ? AND category_id LIKE ?',
                              '%' + @search_params + '%',
                              @category_params).order('name').page(params[:page]).per(3)
    @category = Category.find(@category_params)
  end
end
