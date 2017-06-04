require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/item_repository'
# require './test/test_data/items_fixtures'
# require 'simplecov'



class ItemRepoTest < Minitest::Test

  attr_reader :new_instance

  def setup
    @new_instance = ItemRepository.new("./data/items.csv", "se")
  end

  def test_class_exists
    assert_instance_of ItemRepository, new_instance
  end

  def test_prints_all_item_contents
    result = new_instance.all.count

    assert_equal 1367, result
  end

  def test_finds_by_id_returns_nil_for_invalid_item
    result = new_instance.find_by_id(0000000)

    assert_nil result
  end

  #need to find out how to do
  def test_returns_valid_item_by_searching_for_id
    result = new_instance.find_by_id(263395237)

    assert_equal "510+ RealPush Icon Set", result.name
  end

  def test_find_by_name_returns_nil_for_invalid_item
    result   = new_instance.find_by_name("winzaduber")
    ##should be able to enter arguement as anything and convert to string but it's not happening
    assert_nil result
  end

  def test_returns_valid_item_by_searching_by_name
    result = new_instance.find_by_name("Intricate Sunset")

    refute_nil result
  end

  def test_find_all_with_description_returns_empty_array_for_invalid_match
    result   = new_instance.find_all_with_description("winzaduber")

    assert_equal [], result
  end

  ##need to find out how to do
  def test_find_all_with_description_returns_item_for_valid_match
    result  = new_instance.find_all_with_description("This is a wooden picture frame made to order in any color you would like. Image not included in purchase.\n\nfor portrait style it is:\n10&quot; tall and 6&quot; wide\n\nFor landscape style it is:\n10&quot; wide and 6&quot; tall")

    assert_equal Array, result.class
  end

  def test_find_all_by_price_returns_empty_array_for_invalid_match
    result = new_instance.find_all_by_price(0)

    assert_equal [], result
  end

  ##need to find out how to do
  def test_find_all_by_price_returns_item_for_valid_match
    result = new_instance.find_all_by_price(3800)

    refute_nil result
  end

  def test_find_all_by_price_in_range_returns_empty_array_for_invalid_match
    skip
    result = new_instance.find_all_by_price_in_range(1..3)

    assert_equal [], result
  end

  ##need to find out how to do
  def test_find_all_by_price_in_range_returns_valid_matches
    skip
    result = new_instance.find_all_by_price_in_range(3000..4000)

    refute_nil result
    assert_equal Array, result.class
  end

  def test_find_all_by_merchant_id_returns_empty_for_invalid_match
    result = new_instance.find_all_by_merchant_id(111111)

    assert_equal [], result
  end

  ##need to find out how to do
  def test_find_all_by_merchant_id_returns_match_for_valid_match
    result = new_instance.find_all_by_merchant_id(12334871)

    refute_nil result
    assert_equal Array, result.class
  end

end
