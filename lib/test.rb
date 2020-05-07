=begin
Pour inicier le dossier penser a créer les fichier suivant :
 - .rubocop.yml si on utilise rubocop
 - Gemfile qui liste toutes les gems utilisé

 Puis lancer "bundle install"
 Puis lancer "rspec --init"

 Puis lancer git init
 Puis lancer git remote add origin "le lien github"
=end
require 'notogiri'
require 'pry'

#binding.pry #permet de lance PRY a cette endroit (exit pour quitter, si on est dans une boucle exite passe a l'étape suivante. Donc exit exit ou !!! pour quitter)

#Pour scraper le site internet et le stocker dans page 
page = Nokogiri::HTML(open("ton_url_a_scrapper.com"))
