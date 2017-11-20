class Item
  def initialize(item_data)
    @name    = item_data[:name]
    @quality = item_data[:quality]
    @sell_in = item_data[:sell_in]
  end

  def update
    return aged_product      if @name.downcase =~ /aged/
    return backstage_product if @name.downcase =~ /backstage/

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

  private

  def aged_product
    update_quality
    update_sell_in
    update_quality if @sell_in < 0
    self
  end

  def backstage_product
    update_quality
    update_quality if @sell_in < 11
    update_quality if @sell_in < 6
    @quality = 0   if @sell_in <= 0

    update_sell_in
    self
  end

  def update_quality
    if @quality < 50
      @quality += 1
    end
  end

  def update_sell_in
    @sell_in -= 1
  end
end

def update_quality(items)
  items.map do |item|
    puts ''
    puts '-' * 50
    puts "#{item}".center(50)
    puts '-' * 50
    puts ''
    Item.new(item).update.to_hash
  end
end
