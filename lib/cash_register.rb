class CashRegister
    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @itemList = []
    end
    attr_accessor :total, :lastTotal, :itemList
    attr_reader :discount
    def add_item title, price, quantity = 1
        self.itemList.push([title, price, quantity])
        self.total = self.itemList.sum {|title, price, quantity| price * quantity}
    end
    def apply_discount
        if self.discount > 0
            self.total = self.total * (1 - self.discount * 0.01)
            return "After the discount, the total comes to $#{self.total.to_i}."
        end
        "There is no discount to apply."
    end
    def items
        list = []
        self.itemList.each {|title, price, quantity| quantity.times {list.push(title)}}
        list
    end
    def void_last_transaction
        self.total -= self.itemList[-1][1] * self.itemList.pop[2]
    end
end