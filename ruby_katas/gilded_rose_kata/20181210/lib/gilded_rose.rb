class UpdateItem
  def call(item_data)
    item_name = item_data.fetch(:name)

    return update_backstage(item_data) if item_name =~ /Backstage/
    return update_brie(item_data) if item_name =~ /Brie/
    return update_sulfuras(item_data) if item_name =~ /Sulfuras/
    return update_conjured(item_data) if item_name =~ /Conjured/
    update_normal_item(item_data)
  end

  private

  def update_backstage(item_data)
    update_quality(item_data)
    update_quality(item_data) if (item_data.fetch(:sell_in) < 11)
    update_quality(item_data) if (item_data.fetch(:sell_in) < 6)
    item_data[:quality] = 0   if (item_data.fetch(:sell_in) <= 0 )
    item_data[:sell_in] -= 1
  end

  def update_brie(item_data)
    update_quality(item_data)
    update_quality(item_data) if (item_data.fetch(:sell_in) <= 0)
    item_data[:sell_in] -= 1
  end

  def update_sulfuras(item_data)
    # nothing to do
    item_data
  end

  def update_conjured(item_data)
    update_quality(item_data, increment: false)
    update_quality(item_data, increment: false)

    if (item_data.fetch(:sell_in) <= 0)
      update_quality(item_data, increment: false)
      update_quality(item_data, increment: false)
    end

    item_data[:sell_in] -= 1
  end

  def update_normal_item(item_data)
    item_data[:sell_in] -= 1
    update_quality(item_data, increment: false)

    if(item_data.fetch(:sell_in) <= 0)
      update_quality(item_data, increment: false)
    end
  end

  def update_quality(item_data, increment: true)
    if(increment)
      item_data[:quality] += 1
    else
      item_data[:quality] -= 1
    end

    if(item_data.fetch(:quality) <= 0)
      item_data[:quality] = 0
    end

    if(item_data.fetch(:quality) > 50)
      item_data[:quality] = 50
    end
  end
end

def update_quality(items)
  update_item = UpdateItem.new

  items.each do |item|
   update_item.call(item)
  end
end
