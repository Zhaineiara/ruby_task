# The hashes of array
names = [
  { national_id: "uid1", name: "Precious", age: 21 },
  { national_id: "uid2", name: "Mico", age: 22 },
  { national_id: "uid3", name: "Olivia", age: 20 },
  { national_id: "uid4", name: "Noah", age: 23 },
  { national_id: "uid5", name: "Emma", age: 19 },
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

# Function to add another user in an array
def add_user(user_names)
  clear_screen
  puts "ADD USER"
  print "Enter national ID: "
  national_id = gets.chomp

  #check if id exist in an array
  item_included = item_existence(user_names, national_id)

  while item_included == true
    puts "\nFailed to add: National ID already exists."
    print "Enter national ID: "
    national_id = gets.chomp
    item_included = item_existence(user_names, national_id)
  end

  print "Enter name: "
  name = gets.chomp
  print "Enter age: "
  age = gets.chomp.to_i

  # Add given data to the array
  user_names.append({national_id: national_id, name: name, age: age })

  clear_screen
  puts "\nUser added successfully!"
end

# Function to delete user in an array
def delete_user(array_names)
  clear_screen
  puts "DELETE USER"
  print "Enter national ID: "
  national_id = gets.chomp

  #check if id it exist in the array
  item_included = item_existence(array_names, national_id)

  #loop if national id is not found
  #user_not_found(item_included, national_id, array_names)
  while item_included == false
    puts "\nUser not found"
    print "Enter national ID: "
    national_id = gets.chomp
    item_included = item_existence(array_names, national_id)
  end

  if item_included == true
    national_id_index = array_names.find_index {|person| person[:national_id] == national_id}
    array_names.delete_at(national_id_index)
  end

  clear_screen
  puts "\nSuccessfully deleted!"
end

# Function to edit user in an array
def edit_user(array_names)
  clear_screen
  puts "EDIT USER"
  print "Enter national ID: "
  national_id = gets.chomp

  #check if id it exist in the array
  item_included = item_existence(array_names, national_id)

  while item_included == false
    puts "\nUser not found"
    print "Enter national ID: "
    national_id = gets.chomp
    item_included = item_existence(array_names, national_id)
  end

  if item_included == true
    print "Enter new name: "
    new_name = gets.chomp
    print "Enter new age: "
    new_age = gets.chomp.to_i

    national_id_index = array_names.find_index {|person| person[:national_id] == national_id}
    array_names[national_id_index][:name] = new_name
    array_names[national_id_index][:age] = new_age
  end

  clear_screen
  puts "\nSuccessfully updated!"
end

# Function to search for a user by national ID
def search_user(array_names)
  clear_screen
  puts "SEARCH USER"
  print "Enter national ID: "
  national_id = gets.chomp

  # Check if the ID exists in the array
  item_included = item_existence(array_names, national_id)

  while item_included == false
    puts "\nUser not found"
    print "Enter national ID: "
    national_id = gets.chomp
    item_included = item_existence(array_names, national_id)
  end

  clear_screen
  puts "\nSuccessfully found!"
  if item_included
    user = array_names.find { |person| person[:national_id] == national_id }
    puts "\nDATA IN THE GIVEN NATIONAL ID"
    puts "Name: #{user[:name]}"
    puts "Age: #{user[:age]}"
  end

end

# Function for exit confirmation
def exit_confirmation
  clear_screen
  puts "EXIT"
  print "Are you sure you want to exit? (y/n): "
  exit_response = gets.chomp

  if exit_response == 'y'
    clear_screen
    puts "\nSystem exit."
    exit
  elsif  exit_response == 'n'
    clear_screen
  else
    clear_screen
    print "\nInvalid Input. Enter a valid one."
    puts "\n"
  end
end

# Function to check if the given national id is in the array
def item_existence(given_array, given_id)
  given_array.any? {|item| item[:national_id] == given_id}
end

# Function to clear screen
def clear_screen
  print "\e[H\e[2J"
end

# Main start of code
loop do
  display_users(names)
  print "What action do you want to take?
(1). add_user
(2). delete_user
(3). edit_user
(4). search user
(5). exit
Enter the number: "
  action = gets.chomp

  case action
  when '1'
    add_user(names)
  when '2'
    delete_user(names)
  when '3'
    edit_user(names)
  when '4'
    search_user(names)
  when '4'
    exit_confirmation
  else
    clear_screen
    puts "\nInvalid Input. Enter a valid one."
  end
end
