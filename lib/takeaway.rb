require './lib/sms.rb'

class Takeaway
  include SMS

  def initialize(menu, customer)
    @menu = menu
    @customer = customer
  end

  def show_menu
    @menu.items.each_pair do |item_number, item|
      puts "#{item_number}. #{item[:name]}: £#{item[:cost]}\n"
    end

    puts
  end

  def add_to_order(item_number, quantity)
    quantity.times do
      @customer.order[:items] << @menu.items[item_number]
      @customer.order[:total_cost] += @menu.items[item_number][:cost]
    end
  end

  def send_confirmation
    str = "Thanks for ordering! Your meal will be delivered by #{hour_hence}"
    SMS.send(str)
  end

  private

  def hour_hence
    now = DateTime.now
    "%<hr>02d:%<mn>02d" % { hr: now.hour.next, mn: now.minute.next }
  end
end
