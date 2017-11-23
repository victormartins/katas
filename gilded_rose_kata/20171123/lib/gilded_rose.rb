class Item
  def initialize(item_data)
    @name    = item_data[:name]
    @sell_in = item_data[:sell_in]
    @quality = item_data[:quality]
  end

  def update
    if @name != 'Aged Brie' && @name != 'Backstage passes to a TAFKAL80ETC concert'
      if @quality > 0
        if @name != 'Sulfuras, Hand of Ragnaros'
          @quality -= 1
        end
      end
    else
      if @quality < 50
        @quality += 1
        if @name == 'Backstage passes to a TAFKAL80ETC concert'
          if @sell_in < 11
            if @quality < 50
              @quality += 1
            end
          end
          if @sell_in < 6
            if @quality < 50
              @quality += 1
            end
          end
        end
      end
    end
    if @name != 'Sulfuras, Hand of Ragnaros'
      @sell_in -= 1
    end
    if @sell_in < 0
      if @name != "Aged Brie"
        if @name != 'Backstage passes to a TAFKAL80ETC concert'
          if @quality > 0
            if @name != 'Sulfuras, Hand of Ragnaros'
              @quality -= 1
            end
          end
        else
          @quality = @quality - @quality
        end
      else
        if @quality < 50
          @quality += 1
        end
      end
    end
    self
  end

  def to_hash
    {
      name:    @name,
      quality: @quality,
      sell_in: @sell_in
    }
  end
end

def update_quality(items)
  items.map do |item|
    Item.new(item).update.to_hash
  end
end
