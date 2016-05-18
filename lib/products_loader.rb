# PORO - Plain Old Ruby Object - Normal Class


class BaseClass
    def self.custom_attr_accessor(param)
        # declare getters and setters
        # param = :goods
        define_method param do
            instance_variable_get "@#{param}"
        end
        
        define_method "#{param}=" do |value|
            instance_variable_set "@#{param}", value
        end
    end
end


class ProductsLoader < BaseClass
    custom_attr_accessor :goods
    
    def initialize(goods = nil)
        @goods = goods
    end
    
    def products
        crazy_computation(@goods)
    end
        
    private
    
    def crazy_computation(something)
        something.reverse
    end
end
