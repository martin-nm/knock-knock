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
  location: "2 rue des Martyrs, 75009 Paris")

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

mickael = User.new(first_name: "Mickael",
  last_name: "Sabban",
  email: "mickael-sabban@gmail.com",
  password:"123456", job: "Motion Designer",
  bio: "Motion designer depuis 2007, Je suis autant à l'aise avec l'animation pure, l'incrustation ou l'étalonnage vidéo. Curieux et à l'écoute, le motion design est pour moi une passion et un besoin quotidien. Spécialisations : motion design, montage, vidéo, after effects, post-production, étalonnage, mocha, photoshop, C4D",
  status:"Feel free to contact me for any projects",
  location: "2 place Dauphine, 75001 Paris")

file = URI.open('https://images.unsplash.com/photo-1552058544-f2b08422138a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=344&q=80')
mickael.photo.attach(io: file, filename: 'mickael-image.jpg', content_type: 'image/jpg')

mickael.save!

puts 'Finished Mickael'

jorge = User.new(first_name: "Jorge",
  last_name: "Gonzalez",
  email: "jorge-gonzalez@gmail.com",
  password:"123456", job: "UX Designer",
  bio: "Experienced Freelance Designer with a demonstrated history of working in the digital industry. Skilled in Digital Strategy, User Experience, E-commerce, Advertising, and User Interface Design. Strong arts and design professional graduated from Ecole supérieure d'Arts Appliqués Paris.",
  status:"Looking for tickets to Microsoft Experience",
  location: "15 rue de l'Amiral Roussin, 75015 Paris")

file = URI.open('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80')
jorge.photo.attach(io: file, filename: 'jorge-image.jpg', content_type: 'image/jpg')

jorge.save!

puts 'Finished Jorge'

dounia = User.new(first_name: "Dounia",
  last_name: "Aghab",
  email: "dounia-aghab@gmail.com",
  password:"123456", job: "UI/UX Designer",
  bio: "Positive et à l’écoute, je m’intéresse à la conception des interfaces efficientes adaptées aux utilisateurs. Mon objectif est d’accompagner et conseiller les entreprises dans leurs besoins en conception, création et optimisation d'expériences digitales, de produits et de services.",
  status:"A la recherche de spécialistes Django",
  location: "8 rue Léon Cogniet, 75017 Paris")

file = URI.open('https://images.unsplash.com/photo-1551069613-1904dbdcda11?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=356&q=80')
dounia.photo.attach(io: file, filename: 'dounia-image.jpg', content_type: 'image/jpg')

dounia.save!

puts 'Finished Dounia'

celine = User.new(first_name: "Celine",
  last_name: "Grimault",
  email: "celine-grimault@gmail.com",
  password:"123456", job: "Freelance UX Design - Dev iOS Junior",
  bio: "Conception de Wireframes - Réalisation de prototypes et d’interfaces graphiques - Réalisation de benchmark concurrentiels - Recherche Utilisateurs",
  status:"Anyone free for beer tonight around Menilmontant?",
  location: "40 rue de Menilmontant 75020 Paris")

file = URI.open('https://images.unsplash.com/photo-1548142813-c348350df52b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=335&q=80')
celine.photo.attach(io: file, filename: 'celine-image.jpg', content_type: 'image/jpg')

celine.save!

puts 'Finished Celine'

philippe = User.new(first_name: "Philippe",
  last_name: "de Salle",
  email: "philippe-desalle@gmail.com",
  password:"123456", job: "Software Engineer C++",
  bio: "Experienced in C++ 98/03, familiar with C++ 11/14. Very interested in learning new technologies, I can learn fast and have a clean code. Using the 1% improvement rule, I like to get better in everything I do.",
  status:"Besoin de motion design tips",
  location: "48 rue Boulard, 75014 Paris")

file = URI.open('https://images.unsplash.com/photo-1544098485-2a2ed6da40ba?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80')
philippe.photo.attach(io: file, filename: 'philippe-image.jpg', content_type: 'image/jpg')

philippe.save!

puts 'Finished Philippe'





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
  expires_at: "17h".to_datetime)
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
