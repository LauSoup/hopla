require 'byebug'
require 'nokogiri'
require 'httparty'
require 'json'

def data
  url = "https://www.au-magasin.fr/33000-bordeaux/"
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)

  shop_listings = parsed_page.css('.shop')

  page = 1
  per_page = shop_listings.count
  total = parsed_page.css('.h2.font-weight-bold').text.split(' ')[0].to_i
  last_page = (total.to_f / per_page.to_f ).ceil

  while page <= last_page
    pagination_url = "https://www.au-magasin.fr/33000-bordeaux/#{page}/"
    puts pagination_url
    puts "Page: #{page}"

    puts ''
    pagination_unparsed_page = HTTParty.get(pagination_url)
    pagination_parsed_page = Nokogiri::HTML(pagination_unparsed_page)
    pagination_shop_listings = pagination_parsed_page.css('.shop')
    pagination_shop_listings.each do |shop_listing|
      shop = {
        name: shop_listing.css('.h5.font-weight-bold').text.strip,
        address: shop_listing.css('.font-weight-light').text.strip ,
        category: shop_listing.css('.shop-categories.mb-3 li').text.strip.split[0]
      }
      File.open["shops.json", "a"] do |file|
        file.write(JSON.generate(shop))
      end
    end
    page += 1
  end
end
data
