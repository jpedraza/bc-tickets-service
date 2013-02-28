class Product < OpenStruct
  def self.find(id)
    @id = id
    new(FIXTURE)
  end

  def self.find_by_order_id(id)
    [new(FIXTURE), new(FIXTURE)].map do |product|
      product.order_id = id
      product
    end
  end

  def id
    @id ||= rand(1..9999)
  end

  def name
    @name ||= [
      "Foo Fighters (Acer Arena, 4 July @ 7pm)",
      "Smashing Pumpkins (The Metro, 4 July @ 7pm)",
      "Tool (Sydney Convention Centre, 9 March @ 9pm)"
    ].sample
  end

  def code
    # HACK. :|
    @code ||= Base64.encode64("#{order_id}-#{id}").chomp.gsub(/[=]+$/, '')
  end

  def barcode_image
    @barcode_image ||= QRCode.as_png(code)
  end

  FIXTURE = {
    :id => 16,
    :order_id => 115,
    :product_id => 0,
    :order_address_id => 16,
    :sku => 'LOLWHAT',
    :type => "physical",
    :base_price => "93.1800",
    :price_ex_tax => "93.1800",
    :price_inc_tax => "93.1800",
    :price_tax => "0.0000",
    :base_total => "93.1800",
    :total_ex_tax => "93.1800",
    :total_inc_tax => "93.1800",
    :total_tax => "0.0000",
    :weight => "0",
    :quantity => 1,
    :base_cost_price => "0.0000",
    :cost_price_inc_tax => "0.0000",
    :cost_price_ex_tax => "0.0000",
    :cost_price_tax => "0.0000",
    :is_refunded => false,
    :refund_amount => "0.0000",
    :return_id => 0,
    :wrapping_name => "",
    :base_wrapping_cost => "0.0000",
    :wrapping_cost_ex_tax => "0.0000",
    :wrapping_cost_inc_tax => "0.0000",
    :wrapping_cost_tax => "0.0000",
    :wrapping_message => "",
    :quantity_shipped => 0,
    :event_name => nil,
    :event_date => "",
    :fixed_shipping_cost => "0.0000",
    :ebay_item_id => "",
    :ebay_transaction_id => "",
    :option_set_id => nil,
    :parent_order_product_id => nil,
    :is_bundled_product  => false,
    :bin_picking_number => "",
    :applied_discounts => [
        {
            :id => "coupon",
            :amount => 4.66
        }
    ],
    :product_options => [],
    :configurable_fields => []
  }

end
