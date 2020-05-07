require 'nokogiri'
require 'pry'
require 'open-uri'

#binding.pry #permet de lance PRY a cette endroit (exit pour quitter, si on est dans une boucle exite passe a l'étape suivante. Donc exit exit ou !!! pour quitter)


def get_townhall_emails(array_url)
  array_email = []

  array_url.each do |url|
    site = Nokogiri::HTML(open(url))
    array_email << site.xpath("//td[contains(text(),'@')]").text
    #binding.pry
  end

  return array_email
end

def get_townhall_names(url)
  site = Nokogiri::HTML(open(url))
  town_name = []

  site.xpath("//tr/td/p/a").each do |town|
    town_name << town.text.gsub(/[ ]/, '-').downcase
  end

  return town_name
end

def get_townhall_sites(url)
  array_town_name = get_townhall_names(url)
  array_town_email = []

  array_town_name.each do |name|
    array_town_email << "https://www.annuaire-des-mairies.com/95/#{name}.html"
  end

  return array_town_email
end

def get_array_hash(array_name, array_email)
  array_hash = []

  array_email.each_index do |n|
    array_hash << {array_name[n] => array_email[n]}
  end

  return array_hash
end

def perform

  url = "https://www.annuaire-des-mairies.com/val-d-oise.html"

  array_name = get_townhall_names(url)
  array_email = get_townhall_emails(get_townhall_sites(url))

  array_hash = get_array_hash(array_name, array_email)

  puts array_hash
end


def test
  #puts get_townhall_names ("https://www.annuaire-des-mairies.com/val-d-oise.html")
  #puts get_townhall_sites ("https://www.annuaire-des-mairies.com/val-d-oise.html")
  #puts get_townhall_emails(get_townhall_sites(url))
end

#test

perform