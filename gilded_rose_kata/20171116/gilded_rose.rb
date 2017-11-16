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

  def aged_product
    if item[:quality] < 50
      item[:quality] += 1
    end

    item[:sell_in] -= 1

    if item[:sell_in] < 0
      if item[:quality] < 50
        item[:quality] += 1
      end
    end
  end

  def backstage_product
    if item[:quality] < 50
      item[:quality] += 1
    end

    if item[:sell_in] < 11
      if item[:quality] < 50
        item[:quality] += 1
      end
    end

    if item[:sell_in] < 6
      if item[:quality] < 50
        item[:quality] += 1
      end
    end

    item[:sell_in] -= 1

    if item[:sell_in] < 0
      item[:quality] = 0
    end
  end

  def sulfuras_product
    # do nothing
  end

  def default_product
    if item[:quality] > 0
      item[:quality] -= 1
    end

    item[:sell_in] -= 1

    if item[:sell_in] < 0
      if item[:quality] > 0
        item[:quality] -= 1
      end
    end
  end
end

def update_quality(items)
  items.each do |item|
    Item.new(item).update
  end
end
