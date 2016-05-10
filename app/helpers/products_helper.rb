module ProductsHelper
    # Returns the Gravatar for the given product
    def gravatar_for(product, options = { size: 50 })
        #gravatar_id = Digest::MD5::hexdigest(Faker::Internet.email.strip.downcase)
        #gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        #image_tag(gravatar_url, alt: product.name, class: "gravatar")
        image_tag(Faker::Company.logo, :width => 100, :height => 100)
    end
end
