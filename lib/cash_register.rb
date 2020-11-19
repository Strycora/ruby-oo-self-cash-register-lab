require 'pry'
class CashRegister
    attr_accessor :total, :discount
    def initialize(discount = 0)
        @cart = []
        @total = 0
        @discount = discount
    end
    
    def add_item(item, price, qty = 1)
        item_info = {}
        item_info[:item] = item
        item_info[:price] = price
        item_info[:qty] = qty

        @cart << item_info
        @total += price * qty
    end

    def items 
        item_names = []
        @cart.each do |item|
            item[:qty].times do 
             item_names << item[:item]
            end
        end
        item_names
    end

    def apply_discount
        if self.discount == 0 
          return  "There is no discount to apply."
        else
            new_total = self.total - (self.total * (discount / 100.0))
            self.total = new_total.to_i
        end
        "After the discount, the total comes to $#{self.total}." 
    end 

    def void_last_transaction
        last_item = @cart[-1]
        nu_total = self.total - (last_item[:price]*last_item[:qty])
        @cart.pop
        self.total = nu_total
        #remove cart index -1 (pop)
        #
    end
end