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

sum = 0
names.each do
  puts names[sum][:name]
  sum += 1
end


