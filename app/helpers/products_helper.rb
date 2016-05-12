module ProductsHelper
    # Returns the Gravatar for the given product
    def gravatar_for(product, options = { size: 50 })
        image_tag(Faker::Company.logo, :width => 100, :height => 100)
    end
end
