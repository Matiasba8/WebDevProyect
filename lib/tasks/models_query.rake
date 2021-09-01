namespace :db do
  task :model_queries => :environment do
    puts("Query 0: Sample query; show the names users available")
    result = User.select(:first_name).distinct.map { |x| x.first_name }
    puts(result)
    puts
    puts("EOQ") # End Of Query -- always add this line after a query.
    puts


    puts("Query 1: Get all stays (i.e., location postings) created by a user (host)")
    result = User.find(1).lodgings.map { |x| "id: #{x.id}, title: #{x.title}, location: #{x.location}"}
    puts("Username: #{User.find(1).username}, has the following Lodgings:")
    puts(result)
    puts
    puts("EOQ") # End Of Query -- always add this line after a query.
    puts


    puts("Query 2: Get all users (guests) who have stayed in a location (stay)")
    # change lodging_id to see others
    result = Reservation.select("user_id").where("confirmation = true AND lodging_id = 2").distinct.joins(:user).map{ |x| x.user.username }
    puts(result)
    puts
    puts("EOQ") # End Of Query -- always add this line after a query.
    puts


    puts("Query 3: Get all reservations (i.e., start date, end date and the guest’s name) related to a location.")
    result = Reservation.joins(:user).joins(:lodging).where(['lodgings.location = ?','loc1']).map { |x|"Name: #{x.user.first_name}, start_date: #{x.start_date}, end_date: #{x.end_date}, location: #{x.lodging.location}"}
    puts(result)
    puts
    puts("EOQ") # End Of Query -- always add this line after a query.
    puts


    # puts("Query 4: Get all reviews (text and rating) of a given host.")
    # result = Reservation.joins(:lodging).where("lodgings.user_id = ?", 1).joins(:reservation_reviews).map { |x| x.reservation_reviews.description}
    # puts("Username: #{User.find(1).username}, has the following reviews as a Host:")
    # puts(result)
    # puts
    # puts("EOQ") # End Of Query -- always add this line after a query.
    # puts


    puts("Query 5: Get all reviews (text and rating) of a given guest.")
    result = User.find(1).guest_reviews.map {|x| "Rating: #{x.rate} - Description: #{x.description}"}
    puts("Username: #{User.find(1).username}, has the following reviews as a Guest:")
    puts(result)
    puts
    puts("EOQ") # End Of Query -- always add this line after a query.
    puts


    puts("Query 6: Get the average rating of a location.")
    result = Lodging.find(1).lodging_reviews.map {|x| x.rate}
    puts("Lodging: #{Lodging.find(1).title}, has the following average rating:")
    number = result.inject{ |sum, el| sum + el }.to_f / result.size
    puts(number)
    puts
    puts("EOQ") # End Of Query -- always add this line after a query.
    puts


    puts("Query 7: Get all messages in a user’s inbox.")
    result = ReceivedMessage.where("user_id = ?", 1).map {|x| "Purpose: #{x.purpose} - Body: #{x.body}"}
    result2 = ReceivedMessage.where("from_user_id = ?", 1).map {|x| "Purpose: #{x.purpose} - Body: #{x.body}"}
    puts("Username: #{User.find(1).username}, has the following messages in inbox:")
    puts("Messages Sent: ")
    puts(result2)
    puts
    puts("Messages Received: ")
    puts(result)
    puts
    puts("EOQ") # End Of Query -- always add this line after a query.
    puts


    puts("Query 8: Get all messages sent by a user to other users.")
    result = ReceivedMessage.where("from_user_id = ?", 2).map {|x| "Sent to: #{User.find(x.user_id).username} - Purpose: #{x.purpose} - Body: #{x.body}"}
    puts("Username: #{User.find(2).username}, has sent the following messages:")
    puts(result)
    puts
    puts("EOQ") # End Of Query -- always add this line after a query.
    puts


    puts("Query 9: Get all users with administrative privileges in the system.")
    result = User.where("admin = ?", true).map {|x| "#{x.username} has administrator privileges"}
    puts(result)
    puts
    puts("EOQ") # End Of Query -- always add this line after a query.
    puts

    puts("Query 10: Creating a user that has the same username as PedroGamer (Already existing username)")
    begin
      u2 = User.create(first_name: 'Felipe',last_name: 'Arancibia',username:'PedroGamer',email:'felipe@gmail.com',password:'123',current_role:'guest')
      u2.save!
    rescue StandardError => e
      puts(e.message)
    end
    puts
    puts("EOQ") # End Of Query -- always add this line after a query.
    puts


    puts("Query 11: Creating a user with ill-formatted email")
    begin
      u2 = User.create(first_name: 'Felipe',last_name: 'Arancibia',username:'FelipeA123',email:'felipea123/gmail,com',password:'123',current_role:'guest')
      u2.save!
    rescue StandardError => e
      puts(e.message)
    end
    puts
    puts("EOQ") # End Of Query -- always add this line after a query.
    puts
  end
end