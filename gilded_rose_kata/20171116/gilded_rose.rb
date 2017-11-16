class Item
  def initialize(item)
    @item = item

    puts ''
    puts '-' * 50
    puts "#{item}".center(50)
    puts '-' * 50
    puts ''
  end

  def update
    return aged_product if item[:name].downcase =~ /aged/
    return backstage_product if item[:name].downcase =~ /backstage/
    return sulfuras_product if item[:name].downcase =~ /sulfuras/
    default_product
  end

  private
  attr_reader :item

  def update_quality(val=1)
    return if item[:quality] >= 50 || item[:quality] <= 0 # TODO: Range
    item[:quality] += val
  end

  def aged_product
    update_quality
    item[:sell_in] -= 1
    update_quality if item[:sell_in] < 0
  end

  def backstage_product
    update_quality
    update_quality if item[:sell_in] < 11
    update_quality if item[:sell_in] < 6

    item[:sell_in] -= 1
    item[:quality] = 0 if item[:sell_in] < 0
  end

  def sulfuras_product
    # do nothing
  end

  def default_product
    update_quality(-1)
    item[:sell_in] -= 1
    update_quality(-1) if item[:sell_in] < 0
  end
end

def update_quality(items)
  items.each do |item|
    Item.new(item).update
  end
end
