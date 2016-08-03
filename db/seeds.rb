# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.new(name: "Babu", sex: "F", color: "orange", birth_date: "2013/03/15", description: "prettiest cat ever").save
Cat.new(name: "Milo", sex: "M", color: "tuxedo", birth_date: "2014/08/21", description: "extremely sweet, enjoys cuddles and chasing string").save
Cat.new(name: "Bimla", sex: "F", color: "brown", birth_date: "1989/05/23", description: "the most patient cat, the immortal kitty").save
Cat.new(name: "Gilmore", sex: "M", color: "tortoise shell", birth_date: "1998/04/07", description: "An april shower, the dark before the dawn").save
Cat.new(name: "Koshka", sex: "F", color: "calico", birth_date: "2016/03/19", description: "A little kitten").save
Cat.new(name: "Harriet", sex: "F", color: "grey", birth_date: "2010/07/19", description: "as regal as her rotund shape allows, Harriet enjoys high, lonely places and metallic surfaces").save

c = CatRentalRequest.new(cat_id: 1, start_date: "2016-08-13",end_date: "2016-08-24", status: "APPROVED")
c2 = CatRentalRequest.new(cat_id: 1, start_date: "2016-08-07",end_date: "2016-08-28")
CatRentalRequest.new(cat_id: 3, start_date: "2016-07-13",end_date: "2016-07-24")
