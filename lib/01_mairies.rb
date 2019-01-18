require 'nokogiri'
require 'rubygems'
require 'open-uri'

townhall=[]
page = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/val-d-oise.html"))
page.xpath('//p/a').each do |name|
    townhall << name.text
end

email = []
page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/"))
news_links = page.css("a")
news_links.each do |link|
    page_annuaire = Nokogiri::HTML(open("http://annuaire-des-mairies.com/95/#{link['href']}"))
    page_annuaire.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').each do |mail|
        email << mail.text
    end
end

a = []
hash = Hash[townhall.zip(email.map)]
hash.each {|index| a << {index[0] => index[1]}}

puts a
