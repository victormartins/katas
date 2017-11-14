class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name    = name
    @sell_in = sell_in
    @quality = quality
  end

  def update
    return aged_product      if aged?
    return backstage_product if backstage?
    return sulfuras_product  if sulfuras?
    return conjured_product  if conjured?
    normal_item
  end

  private

  def aged?
    name.downcase =~ /aged/
  end

  def backstage?
    name.downcase =~ /backstage/
  end

  def sulfuras?
    name.downcase =~ /sulfuras/
  end

  def conjured?
    name.downcase =~ /conjured/
  end


  def aged_product
    if @quality < 50
      @quality += 1
    end

    @sell_in -= 1

    if @sell_in < 0
      @quality += 1 unless @quality >= 50
    end
  end

  def backstage_product
    if @quality < 50
      @quality += 1

      if @sell_in < 11
        @quality += 1
      end
      if @sell_in < 6
        @quality += 1
      end
    end

    @sell_in -= 1

    if @sell_in < 0
      @quality = 0
    end
  end

  def sulfuras_product
    # nothing to do
  end

  def normal_item
    if @quality > 0
      @quality -= 1
    end

    @sell_in -= 1

    if @sell_in < 0
      if @quality > 0
        @quality -= 1
      end
    end
  end

  def conjured_product
    if @quality < 50
      @quality -= 2 unless @quality <= 0
    end

    @sell_in -= 1

    if @sell_in <= 0
      @quality -= 2 unless @quality <= 0
    end
  end
end


class QualityUpdater
  def initialize(items)
    @items = items
  end

  def call
    items.each do |item|
      item.update
    end
  end

  private

  attr_reader :items
end

def update_quality(items)
  QualityUpdater.new(items).call
end

# DO NOT CHANGE THINGS BELOW -----------------------------------------

# Item.new(:name, :sell_in, :@quality)

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
