class Item
  QUALITY_RANGE = (1...50)

  def initialize(item_data)
    @name    = item_data[:name]
    @quality = item_data[:quality]
    @sell_in = item_data[:sell_in]
  end

  def update
    return aged_product      if @name.downcase =~ /aged/
    return backstage_product if @name.downcase =~ /backstage/
    return sulfuras_product if @name.downcase =~ /sulfuras/
    return conjured_product if @name.downcase =~ /conjured/
    normal_product
  end

  def to_hash
    {
      name:    @name,
      quality: @quality,
      sell_in: @sell_in
    }
  end

  private

  def normal_product
    update_quality(-1)
    update_sell_in
    update_quality(-1) if @sell_in < 0
    self
  end

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

  def sulfuras_product
    self
  end

  def conjured_product
    update_quality(-2)
    update_sell_in
    update_quality(-2) if @sell_in <= 0
    self
  end

  def update_quality(val = 1)
    return unless QUALITY_RANGE.cover?(@quality)
    @quality += val
  end

  def update_sell_in
    @sell_in -= 1
  end
end

def update_quality(items)
  items.map do |item|
    Item.new(item).update.to_hash
  end
end
