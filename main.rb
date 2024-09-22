class Person
  attr_accessor :name, :age, :national_id

  @@records = []

  def initialize(name, age, national_id)
    @name = name
    @age = age
    @national_id = national_id
  end

  def save
    @@records.prepend({ name: @name, age: @age, national_id: @national_id })
  end

  def self.all
    @@records
  end

  def first
    @@records.first
  end

  def last
    @@records.last
  end

  def display
    puts "Name: #{@name}\nAge: #{@age}\nNational ID: #{@national_id}"
  end

  def self.find_by_national_id(id)
    person = @@records.find { |record| record[:national_id] == id }
    if person
      puts "#{person[:name]}, #{person[:age]}, #{person[:national_id]}"
    else
      puts "Person not found"
    end
  end

  def update(name: @name, age: @age, national_id: @national_id)
    @name = name if name
    @age = age if age
    @national_id = national_id if national_id

    person = @@records.find { |record| record[:national_id] == @national_id }
    if person
      person[:name] = @name
      person[:age] = @age
      person[:national_id] = @national_id
    end
  end

  def destroy
    @@records.pop
  end

end

p_1 = Person.new("Precious", 21, "uid1")
p_1.save
p_2 = Person.new("Mico", 18, "uid2")
p_2.save

# DISPLAYS TO CHECK OUTPUTS
#puts Person.class_variable_get(:@@records).inspect # another way to display outside the class
#puts Person.all
#puts p_1.first
#puts p_1.last
#puts Person.find_by_national_id("uid1")
#p_1.update(name:"Dan", national_id: "uid1")
puts Person.all
p_1.destroy
puts Person.all


# names = [
#   { national_id: "uid1", name: "Precious", age: 21 },
#   { national_id: "uid2", name: "Mico", age: 22 },
#   { national_id: "uid3", name: "Olivia", age: 20 },
#   { national_id: "uid4", name: "Noah", age: 23 },
#   { national_id: "uid5", name: "Emma", age: 19 },
#   { national_id: "uid6", name: "Elijah", age: 24 },
#   { national_id: "uid7", name: "Sophia", age: 22 },
#   { national_id: "uid8", name: "Lucas", age: 20 },
#   { national_id: "uid9", name: "Mia", age: 21 },
#   { national_id: "uid10", name: "Mason", age: 23 },
#   { national_id: "uid11", name: "Isabella", age: 18 },
#   { national_id: "uid12", name: "Logan", age: 25 },
#   { national_id: "uid13", name: "Charlotte", age: 20 },
#   { national_id: "uid14", name: "James", age: 22 },
#   { national_id: "uid15", name: "Amelia", age: 21 },
#   { national_id: "uid16", name: "Benjamin", age: 23 },
#   { national_id: "uid17", name: "Harper", age: 20 },
#   { national_id: "uid18", name: "Jacob", age: 24 },
#   { national_id: "uid19", name: "Evelyn", age: 22 },
#   { national_id: "uid20", name: "Michael", age: 19 }
# ]
#
# def display_users(users)
#   puts "\nList of Users:"
#   if users.any?
#     last_user = users.pop
#     puts "#{last_user[:national_id]} - #{last_user[:name]} (Age: #{last_user[:age]})"
#
#     users.first(4).each do |user|
#       puts "#{user[:national_id]} - #{user[:name]} (Age: #{user[:age]})"
#     end
#     puts "\n"
#     users.push(last_user)
#   else
#     puts "No users to display."
#   end
# end
#
# def add_user(user_names)
#   clear_screen
#   puts "ADD USER"
#   print "Enter national ID: "
#   national_id = gets.chomp
#
#   item_included = item_existence(user_names, national_id)
#
#   while item_included == true
#     puts "\nFailed to add: National ID already exists."
#     print "Enter national ID: "
#     national_id = gets.chomp
#     item_included = item_existence(user_names, national_id)
#   end
#
#   print "Enter name: "
#   name = gets.chomp
#   print "Enter age: "
#   age = gets.chomp.to_i
#
#   user_names.append({national_id: national_id, name: name, age: age })
#
#   clear_screen
#   puts "\nUser added successfully!"
# end
#
# def delete_user(array_names)
#   clear_screen
#   puts "DELETE USER"
#   print "Enter national ID: "
#   national_id = gets.chomp
#
#   item_included = item_existence(array_names, national_id)
#
#   while item_included == false
#     puts "\nUser not found"
#     print "Enter national ID: "
#     national_id = gets.chomp
#     item_included = item_existence(array_names, national_id)
#   end
#
#   if item_included == true
#     national_id_index = array_names.find_index {|person| person[:national_id] == national_id}
#     array_names.delete_at(national_id_index)
#   end
#
#   clear_screen
#   puts "\nSuccessfully deleted!"
# end
#
# def edit_user(array_names)
#   clear_screen
#   puts "EDIT USER"
#   print "Enter national ID: "
#   national_id = gets.chomp
#
#   item_included = item_existence(array_names, national_id)
#
#   while item_included == false
#     puts "\nUser not found"
#     print "Enter national ID: "
#     national_id = gets.chomp
#     item_included = item_existence(array_names, national_id)
#   end
#
#   if item_included == true
#     print "Enter new name: "
#     new_name = gets.chomp
#     print "Enter new age: "
#     new_age = gets.chomp.to_i
#
#     national_id_index = array_names.find_index {|person| person[:national_id] == national_id}
#     array_names[national_id_index][:name] = new_name
#     array_names[national_id_index][:age] = new_age
#   end
#
#   clear_screen
#   puts "\nSuccessfully updated!"
# end
#
# def search_user(array_names)
#   clear_screen
#   puts "SEARCH USER"
#   print "Enter national ID: "
#   national_id = gets.chomp
#
#   item_included = item_existence(array_names, national_id)
#
#   while item_included == false
#     puts "\nUser not found"
#     print "Enter national ID: "
#     national_id = gets.chomp
#     item_included = item_existence(array_names, national_id)
#   end
#
#   clear_screen
#   puts "\nSuccessfully found!"
#   if item_included
#     user = array_names.find { |person| person[:national_id] == national_id }
#     puts "\nDATA IN THE GIVEN NATIONAL ID"
#     puts "Name: #{user[:name]}"
#     puts "Age: #{user[:age]}"
#   end
#
# end
#
# def exit_confirmation
#   clear_screen
#   puts "EXIT"
#   print "Are you sure you want to exit? (y/n): "
#   exit_response = gets.chomp
#
#   if exit_response == 'y'
#     clear_screen
#     puts "\nSystem exit."
#     exit
#   elsif  exit_response == 'n'
#     clear_screen
#   else
#     clear_screen
#     print "\nInvalid Input. Enter a valid one."
#     puts "\n"
#   end
# end
#
# def item_existence(given_array, given_id)
#   given_array.any? {|item| item[:national_id] == given_id}
# end
#
# def clear_screen
#   print "\e[H\e[2J"
# end
#
# loop do
#   display_users(names)
#   print "What action do you want to take?
# (1). add_user
# (2). delete_user
# (3). edit_user
# (4). search user
# (5). exit
# Enter the number: "
#   action = gets.chomp
#
#   case action
#   when '1'
#     add_user(names)
#   when '2'
#     delete_user(names)
#   when '3'
#     edit_user(names)
#   when '4'
#     search_user(names)
#   when '5'
#     exit_confirmation
#   else
#     clear_screen
#     puts "\nInvalid Input. Enter a valid one."
#   end
# end
