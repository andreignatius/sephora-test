class Product < ActiveRecord::Base
    validates(:name, presence: true, length: { maximum: 50 })
    validates(:price, :numericality => { :greater_than_or_equal_to => 0 })
end
