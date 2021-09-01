# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(first_name: 'Pedrito',last_name: 'Gomez',username:'PedroGamer',email:'Pedro@hotmail.com',password:'123',current_role:'guest')
u3 = User.create(first_name: 'Felipe',last_name: 'Arancibia',username:'Felipex',email:'felipe@gmail.com',password:'123',current_role:'guest')
u4 = User.create(first_name: 'Bug',last_name: 'User',username:'BugUser',email:'BugUser@gmail.com',password:'123',current_role:'guest',admin:true)

mrecv1 = ReceivedMessage.create(from_user_id: u1.id,purpose:'Interested in your lodging',body:'Hi, mi name is blah...',user: u3)
mrecv2 = ReceivedMessage.create(from_user_id: u3.id,purpose:'Answer to Interested in your lodging',body:'Hi, mi name is blahblah...',user: u1)
mrecv3 = ReceivedMessage.create(from_user_id: u3.id,purpose:'Interested in your lodging 2',body:'Hi, mi name is blahblahblah...',user: u1)

# Repeated question for the same user
sec1 = SecurityQuestion.create(question:'TopPets?', answer: 'dog and cat', user:u1)
sec2 = SecurityQuestion.create(question:'TopPets?', answer: '123', user:u1)

# Repeated question for the same user
sec3 = SecurityQuestion.create(question:'TopPets?', answer: 'pog', user:u3)
sec4 = SecurityQuestion.create(question:'TopPets?', answer: '123', user:u3)

# See the question that where saved
u1.security_questions.each do |q|
  puts("U#{u1.id}, Q#{q.id} : #{q.question}")
end
u3.security_questions.each do |q|
  puts("U#{u3.id}, Q#{q.id} : #{q.question}")
end

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/#{file_name}.jpg"))
end

lodg1 = Lodging.create(user: u1, title: 'Las casas amarillas', location: 'loc1', description: 'Beautiful House',amenities:"Wifi,CableTv",equipment:"eqp1",facilities:"fac1",start_availability: "2020-01-01", end_availability: "2021-09-02")
lodg2 = Lodging.create(user: u3, title: 'Las casas rojas', location: 'loc2', description: 'Beautiful House2',amenities:"Wifi,SatTV",equipment:"eqp2",facilities:"fac2",start_availability: "2020-01-01", end_availability: "2021-09-02")

lodg1.photo.attach(io: File.open(Rails.root.join('app/assets/images/casasamarillas.jpg')), filename: 'casasamarillas.jpg', content_type: 'image/png')
lodg2.photo.attach(io: File.open(Rails.root.join('app/assets/images/casasrojas.jpg')), filename: 'casasrojas.jpg', content_type: 'image/png')

lodg2.video.attach(io: File.open(Rails.root.join('app/assets/images/casasrojasvid.mp4')), filename: 'casasrojasvid.mp4', content_type: 'video/mp4')

res1 = Reservation.create(user: u3,lodging: lodg1 ,start_date:"2021-07-10",end_date: "2021-08-01", daily_fee: "15.000 CLP", confirmation: true)
l1_res1 = Reservation.create(user: u4,lodging: lodg1 ,start_date:"2021-03-10",end_date: "2021-04-01", daily_fee: "15.000 CLP", confirmation: true)
l1_res2 = Reservation.create(user: u4,lodging: lodg1 ,start_date:"2020-03-10",end_date: "2020-04-01", daily_fee: "15.000 CLP", confirmation: true)
# res2 is an invalid reservation start_date > end_date (it will not save in the db)
l1_res3 = Reservation.create(user: u3,lodging: lodg1 ,start_date:"2021-08-10",end_date: "2021-02-01", daily_fee: "15.000 CLP", confirmation: true)
l1_res4 = Reservation.create(user: u3,lodging: lodg1 ,start_date:"2021-09-01",end_date: "2021-09-10", daily_fee: "15.000 CLP", confirmation: true)
l1_res5 = Reservation.create(user: u1,lodging: lodg1 ,start_date:"2019-09-01",end_date: "2019-09-10", daily_fee: "15.000 CLP", confirmation: false)
l2_res1 = Reservation.create(user: u1,lodging: lodg2 ,start_date:"2019-09-01",end_date: "2019-09-10", daily_fee: "15.000 CLP", confirmation: false)
l2_res2 = Reservation.create(user: u3,lodging: lodg2 ,start_date:"2018-09-01",end_date: "2018-09-10", daily_fee: "15.000 CLP", confirmation: true)


lod_rev1 = LodgingReview.create(lodging: lodg1, user: u3, description: "Muy buen lugar para quedarse", rate: 4)
lod_rev2 = LodgingReview.create(lodging: lodg2, user: u1, description: "Terrible, espantoso...", rate: 1)

res_rev1 = ReservationReview.create(reservation: res1, description: "Excelente atencion del host", rate: 5)

guest_rev1 = GuestReview.create(user: u1, description: "Muy buen guest", rate: 5)
guest_rev2 = GuestReview.create(user: u3, description: "Decente guest", rate: 3)


# Run test model queries
puts
Rake::Task['db:model_queries'].invoke
