class Item
  QUALITY_RANGE = (1...50)

  def initialize(item_data)
    @name    = item_data[:name]
    @sell_in = item_data[:sell_in]
    @quality = item_data[:quality]
  end

  def update
    return aged_product if @name.downcase =~ /aged/
    return backstage_product if @name.downcase =~ /backstage/
    return sulfuras_product if @name.downcase =~ /sulfuras/
    return conjured_product if @name.downcase =~ /conjured/
    normal_item
  end

  def normal_item
    update_quality(-1)
    update_sell_in
    update_quality(-1) if @sell_in < 0
    self
  end

  def aged_product
    update_quality
    update_sell_in
    update_quality if on_sell_date?
    self
  end

  def backstage_product
    update_quality
    update_quality if @sell_in < 11
    update_quality if @sell_in < 6
    @quality = 0   if on_sell_date?
    update_sell_in

    self
  end

  def sulfuras_product
    self
  end

  def conjured_product
    update_quality(-2)
    update_sell_in
    update_quality(-2) if on_sell_date?
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

  def on_sell_date?
    @sell_in <= 0
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
