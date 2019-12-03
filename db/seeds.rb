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

myriam = User.new(first_name: "Myriam",
  last_name: "Belawa",
  email: "myriam-belawa@gmail.com",
  password:"123456", job: "Photographe",
  bio: "Passionnée de photo depuis toujours, j'exerce ma passion en tant que Freelance. Particulièrement à l'aise avec la nature morte et les portraits.",
  status:"Hey Knockies, je cherche un peu d'aide sur photoshop",
  location: "2 rue de lappe, 75011 Paris")

file = URI.open('https://images.unsplash.com/photo-1573497160825-0d94a2724d40?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80')
myriam.photo.attach(io: file, filename: 'myrian-image.jpg', content_type: 'image/jpg')

myriam.save!

puts 'Finished Myriam'

yohan = User.new(first_name: "Yohan",
  last_name: "Nerdeux",
  email: "yohan-nerdeux@gmail.com",
  password:"123456", job: "Entrepreneur",
  bio: "Actuellement en train de monter un espace de coworking dans le 14ème arrondissement. Pasionné par l'éducation et le commerce équitable. Je veux utiliser ce nouvel espace pour vous y faire découvrir mes passions.",
  status:"Hey Knockies, j'ai besoin de vos retours sur les espace de coworkings à paris",
  location: "18 Avenue de Lowendal, 75015 Paris")

file = URI.open('https://images.unsplash.com/photo-1530256362889-919cbb409b66?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=738&q=80')
yohan.photo.attach(io: file, filename: 'yoahn-image.jpg', content_type: 'image/jpg')

yohan.save!

puts 'Finished Yohan'

marine = User.new(first_name: "Marine",
  last_name: "Parre",
  email: "marine-parre@gmail.com",
  password:"123456", job: "Consultant en conduite du changement",
  bio: "Après une mission passionnante chez Monoprix je souhaite utiliser mes compétences acquises en conduite du changement pour aider des entreprises rencontrant ces problématiques.",
  status:"Hey Knockies, quelqu'un aurait-il des contacts chez Get around ?",
  location: "8 Avenue de la grande armée, 75017 Paris")

file = URI.open('https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80')
marine.photo.attach(io: file, filename: 'marine-image.jpg', content_type: 'image/jpg')

marine.save!

puts "Finished Marine"

sergio = User.new(first_name: "Sergio",
  last_name: "Umtiti",
  email: "sergio-umtiti@gmail.com",
  password:"123456", job: "Développeur JavaScript",
  bio: "Après un bootcamp parisien en formation développement web, j'ai décidé de me spécialiser dans le langage JS.",
  status:"Hey Knockies, je suis les cours de JS 30, qui veux être mon buddy?",
  location: "58 quai de la rapée, 75012 Paris")

file = URI.open('https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1650&q=80')
sergio.photo.attach(io: file, filename: 'sergio-image.jpg', content_type: 'image/jpg')

sergio.save!

puts "Finished Sergio"

tanguy = User.new(first_name: "Tanguy",
  last_name: "Leclerc",
  email: "tanguy-leclerc@gmail.com",
  password:"123456", job: "Monteur cinéaste",
  bio: "Passionné de cinéma, j'ai fait une école de monteur et monte des films comme personne",
  status:"Hey Knockies, on cherche des figurants pour le prochain OSS, ça tente quelqu'un?",
  location: "13 Rue Saint-Georges, 75009 Paris")

file = URI.open('https://images.unsplash.com/photo-1500757810556-5d600d9b737d?ixlib=rb-1.2.1&auto=format&fit=crop&w=1635&q=80')
tanguy.photo.attach(io: file, filename: 'tanguy-image.jpg', content_type: 'image/jpg')

tanguy.save!

puts "Finished Tanguy"

puts "Users done 🤓"

puts 'Creating posts...'

post_aline = Post.new( title: "Battery Charger Urgency",
content: "Hello knock-knock, I forgot my MacBook charger (13 pouces 2015) and I really need to finish a work, someone gots one to lend me ? Actually at Numa's café (in the 10th) but I can move around. xx ", category: "utility")
post_aline.user = aline
post_aline.save!

puts 'Finished Post Aline'

post_sam = Post.new( title: "Come on",
  content: "Hello there. I heard about a talk around the topic of 'IA for good' at @Le Wagon that promises to be really interesting, if some of us want to join me and maybe going have a drink after, feel free!", category:"community")
post_sam.user = sam
post_sam.save!

puts 'Finished Post Sam'

post_louis = Post.new( title: "DA experts?",
  content: "Salut les artistes ! There is some graphic designer nearby ? Need 2 or 3 advices about front-end aestetic issues ?",
  category:"expertise")
post_louis.user = louis
post_louis.save!

puts 'Finished Post Louis'

post_eliza = Post.new( title: "Quelqu'un connait codeur.com ?",
  content: "https://www.codeur.com/users/c/developpement",
  category:"expertise")
post_eliza.user = eliza
post_eliza.save!

puts 'Finished Post Eliza'

post_tanguy = Post.new( title: "Logiciels de montage vidéo",
  content: "Quel logiciel de montage vidéo me conseillez vous ?",
  category:"expertise")
post_tanguy.user = tanguy
post_tanguy.save!

puts 'Finished Post Tanguy'

post_sergio = Post.new( title: "Vol de macbook...",
  content: "J'ai perdu mon sac avec mon Macbook au Starbucks des halles... C'est un sac Eastpack gris clair, quelqu'un l'aurait il récupéré ?",
  category:"community")
post_sergio.user = sergio
post_sergio.save!

puts 'Finished Post Sergio'

post_marine = Post.new( title: "Pause dej proche et pas cher",
  content: "Des idées pour la pause dej autour près des champs ?",
  category:"community")
post_marine.user = marine
post_marine.save!

puts 'Finished Post Marine'

puts 'Finished Posts 🤓'

puts 'Finished! 🚀'
