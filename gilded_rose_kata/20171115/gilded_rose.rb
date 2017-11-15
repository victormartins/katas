class Item
  def initialize(item_data)
    @item = item_data
  end

  def update
    puts ''
    puts '-' * 50
    puts "#{item}".center(50)
    puts '-' * 50
    puts ''

    return update_aged_item if item[:name].downcase =~ /aged/
    return update_sulfuras_item if item[:name].downcase =~ /sulfuras/
    return update_backstage_item if item[:name].downcase =~ /backstage/
    if item[:name] != 'Aged Brie' && item[:name] != 'Backstage passes to a TAFKAL80ETC concert'
      if item[:quality] > 0
        if item[:name] != 'Sulfuras, Hand of Ragnaros'
          item[:quality] -= 1
        end
      end
    else
      if item[:quality] < 50
        item[:quality] += 1
        if item[:name] == 'Backstage passes to a TAFKAL80ETC concert'
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
        end
      end
    end

    if item[:name] != 'Sulfuras, Hand of Ragnaros'
      item[:sell_in] -= 1
    end


    if item[:sell_in] < 0
      if item[:name] != "Aged Brie"
        if item[:name] != 'Backstage passes to a TAFKAL80ETC concert'
          if item[:quality] > 0
            if item[:name] != 'Sulfuras, Hand of Ragnaros'
              item[:quality] -= 1
            end
          end
        else
          item[:quality] = item[:quality] - item[:quality]
        end
      else
        if item[:quality] < 50
          item[:quality] += 1
        end
      end
    end
  end

  private

  attr_reader :item

  def update_aged_item
    item[:sell_in] -= 1
    update_quality
    update_quality if item[:sell_in] < 0
  end

  def update_backstage_item
    update_quality

    update_quality if item[:sell_in] < 11
    update_quality if item[:sell_in] < 6

    item[:sell_in] -= 1

    update_quality(0) if item[:sell_in] == 0
  end

  def update_sulfuras_item
    # nothing to do
  end

  def update_quality(val=1)
    item[:quality] += val if item[:quality] < 50
  end
end

def update_quality(items)
  items.each do |item|
    Item.new(item).update
  end
end
