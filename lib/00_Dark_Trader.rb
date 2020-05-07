require 'nokogiri'
require 'pry'
require 'open-uri'

#binding.pry #permet de lance PRY a cette endroit (exit pour quitter, si on est dans une boucle exite passe a l'étape suivante. Donc exit exit ou !!! pour quitter)

def scrapping_site(scrapping_url)
  Nokogiri::HTML(open(scrapping_url))
end

def collect_crypto(url)
  site = scrapping_site(url)
  array = []
  crypto_name = site.xpath("//*[@class = 'cmc-table__cell cmc-table__cell--sortable cmc-table__cell--left cmc-table__cell--sort-by__symbol']/div")
  crypto_name.each do |crypto|
    array << crypto.text
  end
  puts array.length
  return array
end

def collect_value_crypto(url)
  site = scrapping_site(url)
  array = []
  crypto_name = site.xpath("//*[@class = 'cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price']/a")
  crypto_name.each do |crypto|
    array << crypto.text
  end
  puts array.length
  return array
end

def create_array_of_hash(name_array, value_array)

  final_array = []
  name_array.each_index do |n|
    #binding.pry
    final_array << {name_array[n] => value_array[n].split(//).delete_if{|a| a == "$" || a == ","}.join.to_f}
  end

  return final_array
end



def dark_trader
  url = "https://coinmarketcap.com/all/views/all/"

  name_array = collect_crypto(url)
  value_array = collect_value_crypto(url)

  create_array_of_hash(name_array,value_array)
end

puts dark_trader



