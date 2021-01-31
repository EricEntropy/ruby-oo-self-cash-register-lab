class CashRegister

    attr_accessor :total, :discount, :item_list, :item, :price, :quantity

    def initialize(discount = 0)
        @total = 0 
        @item_list = []
        @discount = discount
    end 

    def add_item(item, price, quantity = 1.0)
        @item = item
        @price = price 
        @quantity = quantity
        #add items to list based on quantity
        i = 0
        while i < quantity
            item_list << item
            i += 1
        end
        #update total
        self.total = total + price*quantity
    end 

    def apply_discount
        if @discount > 0
            #math line to find amount off, given discount
            total_discount = 1 - @discount.to_f/100.0
            self.total = total * total_discount
            return "After the discount, the total comes to $#{total.to_int}."
        else 
            return "There is no discount to apply."
        end
    end 

    def items 
        self.item_list
    end 

    def void_last_transaction
        self.total = total - price.to_f * quantity.to_f
        item_list.shift(item_list.length)
    end 
end 