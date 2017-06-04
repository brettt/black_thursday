require 'pry'

class SalesAnalyst
attr_reader :se

def initialize(se)
  @se = se
end

def average_items_per_merchant
  (se.items.all.count.to_f / se.merchants.all.count.to_f).round(2)
end

def merchant_items_by_count
  array = []
  se.merchants.all.map {|merchant| array << merchant.items.count}
  array
end

def average_items_per_merchant_standard_devation
  ipm_standard_deviation
end

def ipm_standard_deviation
  total = 0
  merchant_items_by_count.map {|num| total += ((num.to_f - average_items_per_merchant.to_f) ** 2)}
  Math.sqrt(total / (se.merchants.all.count.to_f - 1.00)).round(2)
end

def merchants_with_high_item_count
  se.merchants.all.find_all { |merchant| merchant.items.count > (ipm_standard_deviation + average_items_per_merchant) }
end

def average_item_price_for_merchant(merch_id)
  array = []
  current_merch = se.merchants.all.find { |merchant| merchant.id == merch_id }
  current_merch.items.map do |item|
    array << item.unit_price.to_i
  end
  array.reduce(:+) / array.length
end

def average_average_price_per_merchant
  array = []
  se.merchants.all.map { |merchant| array << average_item_price_for_merchant(merchant.id) }
  array.reduce(:+) / se.merchants.all.count
end

def golden_items
  se.items.all.find_all do |item|
    item.unit_price > average_average_price_per_merchant + (ipm_standard_deviation * 2)
  end
end

def average_invoices_per_merchant
    (se.invoices.all.count.to_f / se.merchants.all.count.to_f).round(2)

end

def merchant_invoices_by_count
  array = []
  se.merchants.all.map {|merchant| array << merchant.invoices.count}
  array
end

def average_invoices_per_merchant_standard_deviation
  total = 0
  merchant_invoices_by_count.map {|num| total += ((num.to_f - average_invoices_per_merchant.to_f) ** 2)}
  Math.sqrt(total / (se.merchants.all.count.to_f - 1.00)).round(2)
end

def top_merchants_by_invoice_count

end

def bottom_merchants_by_invoice_count

end

def top_days_by_invoice_count

end



end
