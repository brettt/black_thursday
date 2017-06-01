
require 'bigdecimal'


class Item

  attr_reader :id, :name, :description, :unit_price, :created_at, :updated_at, :merchant_id

  def initialize(params)
    @id = params[:id].to_s
    @name = params[:name].to_s
    @description = params[:description]
    @unit_price = params[:unit_price].to_f
    @created_at = params[:created_at]
    @updated_at = params[:updated_at]
    @merchant_id = params[:merchant_id].to_s
  end

  def unit_price_to_dollars
    @unit_price.to_f.round(2)
  end


end
