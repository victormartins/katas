class QualityUpdater
  def initialize(items)
    @items = items
  end

  def call
    items.each do |item|
      puts ''
      puts '-' * 50
      puts "#{items}".center(50)
      puts '-' * 50
      puts ''

      return aged_product(item)      if item.name.downcase =~ /aged/
      return backstage_product(item) if item.name.downcase =~ /backstage/
      return sulfuras_product(item) if item.name.downcase =~ /sulfuras/
      return conjured_product(item) if item.name.downcase =~ /conjured/
      normal_item(item)
    end
  end

  private

  attr_reader :items

  def aged_product(item)
    if item.quality < 50
      item.quality += 1
    end

    item.sell_in -= 1

    if item.sell_in < 0
      item.quality += 1 unless item.quality >= 50
    end
  end

  def backstage_product(item)
    if item.quality < 50
      item.quality += 1

      if item.sell_in < 11
        item.quality += 1
      end
      if item.sell_in < 6
        item.quality += 1
      end
    end

    item.sell_in -= 1

    if item.sell_in < 0
      item.quality = 0
    end
  end

  def sulfuras_product(item)
    # nothing to do
  end

  def normal_item(item)
    if item.quality > 0
      item.quality -= 1
    end

    item.sell_in -= 1

    if item.sell_in < 0
      if item.quality > 0
        item.quality -= 1
      end
    end
  end

  def conjured_product(item)
    if item.quality < 50
      item.quality -= 2 unless item.quality <= 0
    end
    item.sell_in -= 1

    if item.sell_in <= 0
      item.quality -= 2 unless item.quality <= 0
    end
  end
end

def update_quality(items)
  QualityUpdater.new(items).call
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

Item = Struct.new(:name, :sell_in, :quality)

# We use the setup in the spec rather than the following for testing.
#
# Items = [
#   Item.new("+5 Dexterity Vest", 10, 20),
#   Item.new("Aged Brie", 2, 0),
#   Item.new("Elixir of the Mongoose", 5, 7),
#   Item.new("Sulfuras, Hand of Ragnaros", 0, 80),
#   Item.new("Backstage passes to a TAFKAL80ETC concert", 15, 20),
#   Item.new("Conjured Mana Cake", 3, 6),
# ]
