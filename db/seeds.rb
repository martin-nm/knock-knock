# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# db/seeds.rb
Post.destroy_all
Message.destroy_all
User.destroy_all
puts 'Creating users...'

file = URI.open('https://unsplash.com/photos/u3WmDyKGsrY')

aline = User.new(first_name: "Aline",
  last_name: "Michet",
  email: "aline-michet@gmail.com",
  password:"123456",
  job: "Graphic Designer",
  bio: "Just begging my freelance life, tips for work organisation are welcomming",
  status:"Workin' at @numa café",
  location: "1 rue de la roquette, paris, france")
aline.photo.attach(io: file, filename: 'aline', content_type: 'image/jpeg')
aline.save!

louis = User.new(first_name: "Louis",
  last_name: "Seguin",
  email: "louis-seguin@gmail.com",
  password:"123456", job: "Developper",
  bio: "I'm Reactjs Java Firebase developper based in Paris, working remotely",
  status:"Hey knockies, I'm Searching for missions in the Travel & Tourism sectors",
  location: "1 Avenue du Colonel Henri Rol-Tanguy, 75014 Paris")
louis.save!

sam = User.new(first_name: "Sam",
last_name: "Lee",
email: "sam-lee@gmail.com",
password:"123456",
job: "Data Analyst",
bio: "Young co-founder of a company specialized in the Web Scrapping",
status:"",
location: "44 Rue François 1er, 75008 Paris")
sam.save!

puts 'Creating posts...'

post_aline = Post.new( title: "Battery Charger Urgency",
content: "Hello knock-knock, I forgot my MacBook charger (13 pouces 2015) and I really need to finish a work, someone gots one to lend me ? Actually at Numa's café (in the 10th) but I can move around. xx ", category: "utility",
expires_at: "18h".to_datetime)
post_aline.user = aline
post_aline.save!

post_sam = Post.new( title: "Come one",
  content: "Hello there. I heard about a talk around the topic of 'IA for good' at @Le Wagon that promises to be really interesting, if some of us want to join me and maybe going have a drink after, feel free!", category:"community",
  expires_at: "13h".to_datetime)
post_sam.user = sam
post_sam.save!

post_louis= Post.new( title: "DA experts ? ",
  content: "Salut les artistes ! There is some graphic designer nearby ? Need 2 or 3 advices about front-end aestetic issues ?",
   category:"expertise",
  expires_at: "17h".to_datetime)
post_louis.user = louis
post_louis.save!

puts 'Finished!'
