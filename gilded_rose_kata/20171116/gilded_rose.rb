module ProductHandlers
  class Base
    QUALITY_RANGE = (1...50)
    def initialize(item)
      @item = item
    end

    def update_quality(val=1)
      return unless QUALITY_RANGE.cover?(item.quality)
      item.quality += val
    end

    private
    attr_reader :item
  end

  class Aged < Base
    def call
      update_quality
      item.sell_in -= 1
      update_quality if item.sell_in < 0
    end
  end

  class Backstage < Base
    def call
      update_quality
      update_quality if item.sell_in < 11
      update_quality if item.sell_in < 6

      item.sell_in -= 1
      item.quality = 0 if item.sell_in < 0
    end
  end

  class Sulfuras < Base
    def call
    end
  end

  class Conjured < Base
    def call
      update_quality(-2)
      item.sell_in -= 1
      update_quality(-2) if item.sell_in < 0
    end
  end

  class Default < Base
    def call
      update_quality(-1)
      item.sell_in -= 1
      update_quality(-1) if item.sell_in < 0
    end
  end
end

class ProductHandler
  def self.for(item)
    case item.name.downcase
    when /aged/
      ProductHandlers::Aged.new(item)
    when /backstage/
      ProductHandlers::Backstage.new(item)
    when /sulfuras/
      ProductHandlers::Sulfuras.new(item)
    when /conjured/
      ProductHandlers::Conjured.new(item)
    else
      ProductHandlers::Default.new(item)
    end
  end
end

class Item
  attr_reader :name
  attr_accessor :quality#, :sell_in

  def initialize(item_data)
    @name    = item_data[:name]
    @quality = item_data[:quality]
    @sell_in = item_data[:sell_in]
  end

  def sell_in
    @sell_in
  end

  def sell_in=(value)
    @sell_in=(value)
  end

  def to_hash
    {
      name:    name,
      sell_in: sell_in,
      quality: quality
    }
  end

  def to_s
    to_hash.inspect
  end

  def update
    ProductHandler.for(self).call
    self
  end
end

def update_quality(items)
  items.map { |item| Item.new(item).update.to_hash }
end
