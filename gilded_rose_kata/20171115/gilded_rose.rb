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
    update_quality(-2) if item[:sell_in] <= 0
    item[:sell_in] -= 1
  end

  def update_normal_item
    update_quality(-1)
    update_quality(-1) if item[:sell_in] <= 0
    item[:sell_in] -= 1
  end

  def update_aged_item
    update_quality
    update_quality if item[:sell_in] <= 0
    item[:sell_in] -= 1
  end

  def update_backstage_item
    update_quality
    update_quality if item[:sell_in] < 11
    update_quality if item[:sell_in] < 6
    update_quality(0) if item[:sell_in] <= 0
    item[:sell_in] -= 1
  end

  def update_sulfuras_item
    # nothing to do
  end

  def update_quality(val=1)
    return item[:quality] = 0 if val == 0
    return unless item[:quality] < 50 && item[:quality] > 0
    item[:quality] += val

  end
end

def update_quality(items)
  items.each do |item|
    Item.new(item).update
  end
end
