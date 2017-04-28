class CashRegister
  attr_accessor :total, :items
  attr_reader :discount

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = []
  end

  def add_item(name, price, quan = 1)
    @total += price * quan
    quan.times { @items << name }
    @last_transaction = [name, price, quan]
  end

  def apply_discount
    if @discount != 0
      @total = ((1 - (discount.to_f / 100)) * @total).round
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total -= @last_transaction[1] * @last_transaction[2]
    @last_transaction[2].times { @items.pop }
  end

end
