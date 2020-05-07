require 'nokogiri'
require 'pry'
require 'open-uri'

#binding.pry #permet de lance PRY a cette endroit (exit pour quitter, si on est dans une boucle exite passe a l'étape suivante. Donc exit exit ou !!! pour quitter)

def depute_full_name(url)

  site = Nokogiri::HTML(open(url))
  full_name_array = []

  site.xpath("//*[@class = 'list_nom']").each do |name|
    full_name_array << name.text
  end

  return full_name_array
end

def depute_site(url)

  depute_array = depute_full_name(url)
  depute_site_array = []

  depute_array.each do |name|
    depute_site_array << "https://www.nosdeputes.fr/#{name.downcase.split(",").reverse.join("-").tr("àâçèéêëîïôùû","aaceeeeiiouu").gsub(/[ \n]/, '')}"
  end

  return depute_site_array
end

def depute_email(array_site_depute)
  array_email_depute = []

  array_site_depute.each do |url|
    begin
      site_deputes = Nokogiri::HTML(open(url))
      binding.pry
      array_email_depute << site_deputes.xpath("//a[contains(@href, '@')]").text
    rescue => e
      array_email_depute << "pas de site"
    end
  end

  return array_email_depute
end


def perform

end


def test
  #puts depute_full_name("https://www.nosdeputes.fr/deputes")
  #puts depute_site("https://www.nosdeputes.fr/deputes")
  #puts depute_email(depute_site("https://www.nosdeputes.fr/deputes"))

  site_deputes = Nokogiri::HTML(open("https://www.nosdeputes.fr/michel-zumkeller"))
  puts site_deputes.xpath("//a[contains(@href, '@')]").text

end

test

#perform(      )