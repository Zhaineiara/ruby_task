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


# second task
puts "TASK 2"
sum = 0
names.each do
  puts names[sum][:name] #print out names only
  sum += 1
end


# third task
puts "\nTASK 3"
person_national_id = ""
person_name = ""
person_age = 0
national_id_only = []

print "Enter the national id: "
person_national_id = gets.chomp

# national id checking
iterate_1 = 0
names.each do
  national_id_only.push(names[iterate_1][:national_id])
  iterate_1 += 1
end

checking_national_id = national_id_only.include?(person_national_id)

while checking_national_id == true
  puts "\nFailed to add: National ID already exists."
  print "Enter another value: "
  person_national_id = gets.chomp
  checking_national_id = national_id_only.include?(person_national_id)
end

print "Enter the name: "
person_name = gets.chomp
print "Enter the age: "
person_age = gets.chomp.to_i

hash_temp =   { national_id: person_national_id, name: person_name, age: person_age }
if person_national_id.empty? == false && person_name.empty? == false && person_age != 0
  names.push(hash_temp)
  puts "\nUser added successfully!"
end

puts "\nUpdated List of Users"
modified_names_1 = names.reverse

puts modified_names_1 #displaying at the top of the list


# fourth task
puts "\nTASK 4"
yes_or_no = ""
add_delete_option = ""
print "Do you want another option?(y|n): "
yes_or_no = gets.chomp

if yes_or_no == 'y'
  print "Enter your choice (add_user | delete_user): "
  add_delete_option = gets.chomp

  # DELETE
  delete_national_number = ""
  if add_delete_option == 'delete_user'
    puts "\nDELETE OPTION"
    print "Enter the national id number: "
    delete_national_number = gets.chomp

    included = names.any? { |person| person[:national_id] == delete_national_number }
    if included == true
      index_of_national_id = names.find_index {|person| person[:national_id] == delete_national_number}
      names.delete_at(index_of_national_id)
      print "Successfully deleted"

      modified_names_2 = names.reverse
      puts modified_names_2

    elsif included == false
      puts "User not found."
    end

  # ADD
  elsif add_delete_option == 'add_user'
    person_national_id = ""
    person_name = ""
    person_age = 0
    national_id_only = []

    print "\nEnter the national id: "
    person_national_id = gets.chomp

    # national id checking
    iterate_1 = 0
    names.each do
      national_id_only.push(names[iterate_1][:national_id])
      iterate_1 += 1
    end

    checking_national_id = national_id_only.include?(person_national_id)

    while checking_national_id == true
      puts "\nFailed to add: National ID already exists."
      print "Enter another value: "
      person_national_id = gets.chomp
      checking_national_id = national_id_only.include?(person_national_id)
    end

    print "Enter the name: "
    person_name = gets.chomp
    print "Enter the age: "
    person_age = gets.chomp.to_i

    hash_temp =   { national_id: person_national_id, name: person_name, age: person_age }
    if person_national_id.empty? == false && person_name.empty? == false && person_age != 0
      names.push(hash_temp)
      puts "\nUser added successfully!"
    end

    puts "\nUpdated List of Users"
    modified_names_3 = names.reverse
    puts modified_names_3
  end

elsif yes_or_no == 'n'
  puts "\nInvalid value. System exit."
end





# #first condition: THE YES ANSWER
# if yes_or_no == 'y'
#   print "Enter the national id: "
#   person_national_id = gets.chomp
#
#   #national id checking version 1
#   # iterate_1 = 0
#   # names.each do
#   #   #puts names[iterate_1][:national_id] #print out names only
#   #   iterate_1 += 1
#   #
#   #   id_checking = names.include?(person_national_id)
#   #   puts id_checking
#   #   # if id_checking == true
#   #   #   print "Invalid national id. Enter another one: "
#   #   # end
#   # end
#
#   #national id checking version 2
#
#
#   print "Enter the name: "
#   person_name = gets.chomp
#   print "Enter the age: "
#   person_age = gets.chomp.to_i
#
# =begin # to check the inputted value
#     p national_id
#     p person_name
#     p person_age
# =end
#
#   #second condition: THE NO ANSWER
# elsif yes_or_no == 'n'
#   puts "\nUser don't want to add another person. System exit."
#   break
# end
#
# end







