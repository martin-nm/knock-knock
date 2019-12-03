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
  bio: "Just beginning my freelance life, tips for work organisation are welcomed!",
  status:"Workin' at @numa café",
  location: "1 rue de la Roquette, Paris, france")

file = URI.open('https://images.unsplash.com/photo-1489424731084-a5d8b219a5bb?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80')
aline.photo.attach(io: file, filename: 'aline-image.jpg', content_type: 'image/jpg')
aline.save!

puts 'Finished Aline'

louis = User.new(first_name: "Louis",
  last_name: "Seguin",
  email: "louis-seguin@gmail.com",
  password:"123456", job: "Developper",
  bio: "I'm Reactjs Java Firebase Developper based in Paris, working remotely",
  status:"Hey Knockies, I'm looking for missions in the Travel & Tourism sector",
  location: "1 avenue du Colonel Henri Rol-Tanguy, 75014 Paris")

file = URI.open('https://images.unsplash.com/photo-1506919258185-6078bba55d2a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1115&q=80')
louis.photo.attach(io: file, filename: 'louis-image.jpg', content_type: 'image/jpg')

louis.save!

puts 'Finished Louis'

sam = User.new(first_name: "Sam",
last_name: "Lee",
email: "sam-lee@gmail.com",
password:"123456",
job: "Data Analyst",
bio: "Young co-founder of a company specialized in Web Scrapping",
status:"Looking for a talented CTO",
location: "44 Rue François 1er, 75008, Paris")

file = URI.open('https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80')
sam.photo.attach(io: file, filename: 'sam-image.jpg', content_type: 'image/jpg')

sam.save!

puts 'Finished Sam'

eliza = User.new(first_name: "Eliza",
  last_name: "Thorez",
  email: "eliza-thorez@gmail.com",
  password:"123456", job: "DevOps Engineer",
  bio: "My key skills are:
Languages: Python, JavaScript(VUE.JS), C, and C++
Framework: Django, Flask
DB: SQL, SQLite, PostgreSQL.
Cloud: AWS
Devops: Kubernetes, Docker, CI/CD
others: Data science, Machine learning",
  status:"Hey Knockies, I'm currently in Paris for 3 weeks",
  location: "2 avenue Trudaine, 75009 Paris")

file = URI.open('https://images.unsplash.com/photo-1548536515-67545ff2ecc7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80')
eliza.photo.attach(io: file, filename: 'eliza-image.jpg', content_type: 'image/jpg')

eliza.save!

puts 'Finished Eliza'

remy = User.new(first_name: "Remy",
  last_name: "Tallot",
  email: "remy-tallot@gmail.com",
  password:"123456", job: "Developpeur Python",
  bio: "Computer Science Engineer - Python & JavaScript. I am a professional driven by passion. Naturally curious, thorough and resourceful, I consistently execute and deliver high quality products that meet user needs.",
  status:"Hey Knockies, I'm new in Paris, looking for good spots",
  location: "2 avenue Trudaine, 75009 Paris")

file = URI.open('https://images.unsplash.com/photo-1528763380143-65b3ac89a3ff?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=670&q=80')
remy.photo.attach(io: file, filename: 'remy-image.jpg', content_type: 'image/jpg')

remy.save!

puts 'Finished Remy'

paul = User.new(first_name: "Paul",
  last_name: "Ungar",
  email: "paul-ungar@gmail.com",
  password:"123456", job: "Developpeur web fullstack - ReactJs/NodeJs",
  bio: " Après 8 ans dans le milieu médical me permettant notamment de développer mes compétences d'organisation, j'ai choisi de me reconvertir  dans le développement web. J'ai suivi la formation du Wagon, école innovante dont la pédagogie est orientée vers le développement de l'autonomie, l'entraide et la réalisation de projets concrets.",
  status:"Hey Knockies, je me forme à React JS, qui connait ???",
  location: "2 rue Oberkampf, 75011 Paris")

file = URI.open('https://images.unsplash.com/photo-1546672657-366775449156?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80')
paul.photo.attach(io: file, filename: 'paul-image.jpg', content_type: 'image/jpg')

paul.save!

puts 'Finished Paul'

puts 'Creating posts...'

post_aline = Post.new( title: "Battery Charger Urgency",
content: "Hello knock-knock, I forgot my MacBook charger (13 pouces 2015) and I really need to finish a work, someone gots one to lend me ? Actually at Numa's café (in the 10th) but I can move around. xx ", category: "utility",
expires_at: "18h".to_datetime)
post_aline.user = aline
post_aline.save!

puts 'Finished Post-1 Aline'

post_sam = Post.new( title: "Come one",
  content: "Hello there. I heard about a talk around the topic of 'IA for good' at @Le Wagon that promises to be really interesting, if some of us want to join me and maybe going have a drink after, feel free!", category:"community",
  expires_at: "13h".to_datetime)
post_sam.user = sam
post_sam.save!

puts 'Finished Post Sam'

post_louis = Post.new( title: "DA experts?",
  content: "Salut les artistes ! There is some graphic designer nearby ? Need 2 or 3 advices about front-end aestetic issues ?",
   category:"expertise",
  expires_at: "21h".to_datetime)
post_louis.user = louis
post_louis.save!

puts 'Finished Post Louis'

post_eliza = Post.new( title: "Quelqu'un connait codeur.com ?",
  content: "https://www.codeur.com/users/c/developpement",
   category:"expertise",
  expires_at: "12h".to_datetime)
post_eliza.user = eliza
post_eliza.save!

puts 'Finished Post Eliza'

puts 'Finished!'
