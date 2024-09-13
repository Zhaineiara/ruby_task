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
# puts "TASK 3"
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

puts "Updated List of Users"
puts names









