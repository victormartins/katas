module ProductHandlers
  class Base
    def initialize(item)
      @item = item
    end

    def update_quality(val=1)
      return if item[:quality] >= 50 || item[:quality] <= 0 # TODO: Range
      item[:quality] += val
    end

    private
    attr_reader :item
  end

  class Aged < Base
    def call
      update_quality
      item[:sell_in] -= 1
      update_quality if item[:sell_in] < 0
    end
  end

  class Backstage < Base
    def call
      update_quality
      update_quality if item[:sell_in] < 11
      update_quality if item[:sell_in] < 6

      item[:sell_in] -= 1
      item[:quality] = 0 if item[:sell_in] < 0
    end
  end

  class Sulfuras < Base
    def call
    end
  end

  class Conjured < Base
    def call
      update_quality(-2)
      item[:sell_in] -= 1
      update_quality(-2) if item[:sell_in] < 0
    end
  end

  class Default < Base
    def call
      update_quality(-1)
      item[:sell_in] -= 1
      update_quality(-1) if item[:sell_in] < 0
    end
  end
end

class ProductHandler
  def self.for(item)
    case item[:name].downcase
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
  def initialize(item)
    @item = item
  end

  def update
    ProductHandler.for(@item).call
  end
end

def update_quality(items)
  items.each { |item| Item.new(item).update }
end
