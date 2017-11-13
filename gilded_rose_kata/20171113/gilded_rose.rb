class QualityUpdater
  def initialize(items: items)
    @items = items
  end

  def call
    items.each do |item|
      return aging_product(item) if item.name.downcase =~ /aged/
      return sulfuras_product(item) if item.name.downcase =~ /sulfuras/
      return backstage_pass_product(item) if item.name.downcase =~ /backstage/

      # increment or decrement with time
      if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert'
        if item.quality > 0
          if item.name != 'Sulfuras, Hand of Ragnaros'
            item.quality -= 1
          end
        end
      else
        if item.quality < 50
          item.quality += 1
        end
      end

      # decrement selling days
      if item.name != 'Sulfuras, Hand of Ragnaros'
        item.sell_in -= 1
      end


      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != 'Backstage passes to a TAFKAL80ETC concert'
            if item.quality > 0
              if item.name != 'Sulfuras, Hand of Ragnaros'
                item.quality -= 1
              end
            end
          else
            item.quality -= item.quality
          end
        else
        end
      end
    end
  end

  private
  attr_reader :items

  def sulfuras_product(item)
    # Nothing to do
  end

  def backstage_pass_product(item)
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

  def aging_product(item)
    if item.quality < 50
      item.quality += 1

      if item.sell_in <= 0
        item.quality += 1 if item.quality < 50
      end
    end

    item.sell_in -= 1
  end
end

def update_quality(items)
  QualityUpdater.new(items: items).call
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
