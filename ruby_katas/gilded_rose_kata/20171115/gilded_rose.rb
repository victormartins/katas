class Item
  def initialize(item_data)
    @item = item_data
  end

  def update
    return update_aged_item      if item[:name].downcase =~ /aged/
    return update_sulfuras_item  if item[:name].downcase =~ /sulfuras/
    return update_backstage_item if item[:name].downcase =~ /backstage/
    return update_conjured_item  if item[:name].downcase =~ /conjured/
    update_normal_item
  end

  private

  attr_reader :item

  def update_conjured_item
    update_quality(-2)
    update_quality(-2) { |sell_in| sell_in <= 0 }
    item[:sell_in] -= 1
  end

  def update_normal_item
    update_quality(-1)
    update_quality(-1) { |sell_in| sell_in <= 0 }
    item[:sell_in] -= 1
  end

  def update_aged_item
    update_quality
    update_quality { |sell_in| sell_in <= 0 }
    item[:sell_in] -= 1
  end

  def update_backstage_item
    update_quality
    update_quality { |sell_in| sell_in < 11 }
    update_quality { |sell_in| sell_in < 6 }
    item[:quality] = 0 if item[:sell_in] <= 0 # TODO: fix this case
    item[:sell_in] -= 1
  end

  def update_sulfuras_item
    # nothing to do
  end

  def update_quality(val=1)
    return unless item[:quality] < 50 && item[:quality] > 0

    if block_given?
      item[:quality] += val if yield(item[:sell_in])
    else
      item[:quality] += val
    end
  end
end

def update_quality(items)
  items.each do |item|
    Item.new(item).update
  end
end
