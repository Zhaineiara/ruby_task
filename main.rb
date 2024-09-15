# The hashes of array
names = [
  { national_id: "uid1", name: "Precious", age: 21 },
  { national_id: "uid2", name: "Mico", age: 22 },
  { national_id: "uid3", name: "Olivia", age: 20 },
  { national_id: "uid4", name: "Noah", age: 23 },
  { national_id: "uid5", name: "Emma", age: 19 },
  { national_id: "uid6", name: "Elijah", age: 24 },
  { national_id: "uid7", name: "Sophia", age: 22 },
  { national_id: "uid8", name: "Lucas", age: 20 },
  { national_id: "uid9", name: "Mia", age: 21 },
  { national_id: "uid10", name: "Mason", age: 23 },
  { national_id: "uid11", name: "Isabella", age: 18 },
  { national_id: "uid12", name: "Logan", age: 25 },
  { national_id: "uid13", name: "Charlotte", age: 20 },
  { national_id: "uid14", name: "James", age: 22 },
  { national_id: "uid15", name: "Amelia", age: 21 },
  { national_id: "uid16", name: "Benjamin", age: 23 },
  { national_id: "uid17", name: "Harper", age: 20 },
  { national_id: "uid18", name: "Jacob", age: 24 },
  { national_id: "uid19", name: "Evelyn", age: 22 },
  { national_id: "uid20", name: "Michael", age: 19 }
]


# Function to display the last user at the top
def display_users(users)
  puts "\nList of Users:"

  if users.any? 
    last_user = users.pop
    puts "#{last_user[:national_id]} - #{last_user[:name]} (Age: #{last_user[:age]})"

    users.each do |user|
      puts "#{user[:national_id]} - #{user[:name]} (Age: #{user[:age]})"
    end
    puts "\n"
    users.push(last_user)
  else
    puts "No users to display."
  end
end


# Function to ask add_delete_edit_exit
def adee_option(user_names)
  loop do
    print "What action do you want to take? (add_user|delete_user|edit_user|exit): "
    action_adee = gets.chomp

    case action_adee
      when 'add_user'
        add_user_option(user_names)
      when 'delete_user'
        delete_user_option(user_names)
      when 'edit_user'
        edit_user_option(user_names)
      when 'exit'
        exit_confirmation
        break
    else
      puts "\nInvalid Input. Enter a valid one."
    end    
  end
end


# Function to add another user in an array
def add_user_option(array_names)
  print "Enter national ID: "
  given_national_id = gets.chomp

  #check if id is unique
  checking_given_id = id_uniqueness_check(array_names, given_national_id)

  while checking_given_id == true
    puts "\nFailed to add: National ID already exists."
    print "Enter national ID: "
    given_national_id = gets.chomp
    checking_given_id = id_uniqueness_check(array_names, given_national_id)
  end

  print "Enter name: "
  given_name = gets.chomp
  print "Enter age: "
  given_age = gets.chomp.to_i

  # Add given data to the array
  array_names.append({national_id: given_national_id, name: given_name, age: given_age })

  puts "\nUser added successfully!"
  display_users(array_names)

  another_option_question(array_names)
end


# Function to delete user in an array
def delete_user_option(array_names)
  print "Enter national ID: "
  given_national_id = gets.chomp

  #check if id it exist in the array
  checking_given_id = id_uniqueness_check(array_names, given_national_id)

  while checking_given_id == false
    puts "\nUser not found"
    print "Enter national ID: "
    given_national_id = gets.chomp
    checking_given_id = id_uniqueness_check(array_names, given_national_id)
  end

  if checking_given_id == true
    index_of_national_id = array_names.find_index {|person| person[:national_id] == given_national_id}
    array_names.delete_at(index_of_national_id)
  end

  puts "\nSuccessfully deleted!"
  display_users(array_names)

  another_option_question(array_names)
end


# Function to edit user in an array
def edit_user_option(array_names)
  print "Enter national ID: "
  given_national_id = gets.chomp

  #check if id it exist in the array
  checking_given_id = id_uniqueness_check(array_names, given_national_id)

  while checking_given_id == false
    puts "\nUser not found"
    print "Enter national ID: "
    given_national_id = gets.chomp
    checking_given_id = id_uniqueness_check(array_names, given_national_id)
  end

  if checking_given_id == true
    print "Enter new name: "
    new_name = gets.chomp
    print "Enter new age: "
    new_age = gets.chomp.to_i

    index_of_national_id = array_names.find_index {|person| person[:national_id] == given_national_id}
    array_names[index_of_national_id][:name] = new_name
    array_names[index_of_national_id][:age] = new_age

    puts array_names[index_of_national_id][:name]
    puts array_names[index_of_national_id][:age]
  end

  puts "\nSuccessfully updated!"
  display_users(array_names)

  another_option_question(array_names)
end


# Function for exit confirmation
def exit_confirmation
  print "Are you sure you want to exit? (y/n): "
  yes_no = gets.chomp

  if yes_no == 'y'
    puts "\nSystem exit."
    exit
  end
end


# Function to check if the given national id it in the array
def id_uniqueness_check(given_array, given_id)
  given_array.any? {|item| item[:national_id] == given_id}
end


# Function to ask user if want to have another options. Will be redirect to ADEE function
def another_option_question(array_names)
loop do
  print "Do you want another option? (y|n): "
  another_option = gets.chomp

  case another_option
    when 'n'
      exit_confirmation
    when 'y'
      adee_option(array_names)
    else
      puts "\nInvalid input."
    end
  end
end


# Main start of code
loop do
  display_users(names)
  another_option_question(names)
end
