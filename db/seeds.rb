# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

users = User.create! [
    {username: "Fiorina", password_digest: "123"},
    {username: "Trump", password_digest: "456"},
    {username: "Carson", password_digest: "789"},
    {username: "Clinton", password_digest: "1011"}
]

profiles = Profile.create! [
    {gender: "female", birth_year: 1954, first_name: "Carly", last_name: "Fiorina"},
    {gender: "male", birth_year: 1946, first_name: "Donald", last_name: "Trump"},
    {gender: "male", birth_year: 1951, first_name: "Ben", last_name: "Carson"},
    {gender: "female", birth_year: 1947, first_name: "Hillary", last_name: "Clinton"}
]

i = 0

while (i < users.length)
	users[i].profile = profiles[i]
	i = i + 1
end



todolists = TodoList.create! [
    {list_name: "Carly's list", list_due_date: Date.today + 1.year},
    {list_name: "Donald's list", list_due_date: Date.today + 1.year},
    {list_name: "Ben's list", list_due_date: Date.today + 1.year},
    {list_name: "Hillary's list", list_due_date: Date.today + 1.year},
]

todolists_tab = TodoList.all.to_a

User.all.each do |user|
    v = todolists_tab.shift
    user.todo_lists << v
  end

ti_user1 = TodoItem.create! [
    {due_date: Date.today + 1.year,title: "Djokovic", description: "n°1 tennis men", completed: false},
    {due_date: Date.today + 1.year,title: "Nadal", description: "n°10 tennis men", completed: false},
    {due_date: Date.today + 1.year,title: "Federer", description: "n°5 tennis men", completed: true},
    {due_date: Date.today + 1.year,title: "Wawrinka", description: "n°3 tennis men", completed: true},
    {due_date: Date.today + 1.year,title: "Raonic", description: "n°7 tennis men", completed: false}
]

ti_user2 = TodoItem.create! [
    {due_date: Date.today - 23.year,title: "Houphouet", description: "First president", completed: true},
    {due_date: Date.today - 5.year,title: "Gbagbo", description: "In jail", completed: false},
    {due_date: Date.today + 4.year,title: "Ado", description: "The actual one", completed: true},
    {due_date: Date.today - 30.year,title: "Sankara", description: "The fighter", completed: false},
    {due_date: Date.today + 1.year,title: "Bedie", description: "The pacifist", completed: false}
]

ti_user3 = TodoItem.create! [
    {due_date: Date.today + 1.year,title: "Maths", description: "My favorite", completed: false},
    {due_date: Date.today + 1.year,title: "Telecom", description: "Default choice", completed: true},
    {due_date: Date.today + 1.year,title: "Programming", description: "My hope", completed: false},
    {due_date: Date.today + 1.year,title: "Physics", description: "Second choice", completed: true},
    {due_date: Date.today + 1.year,title: "Network", description: "Needed", completed: false}
]

ti_user4 = TodoItem.create! [
    {due_date: Date.today + 1.year,title: "Ruby", description: "In progress", completed: false},
    {due_date: Date.today + 1.year,title: "Python", description: "The next one", completed: false},
    {due_date: Date.today + 1.year,title: "Responsive design", description: "The goal", completed: false},
    {due_date: Date.today + 1.year,title: "Perl", description: "Utile", completed: false},
    {due_date: Date.today + 1.year,title: "Bash", description: "Of course", completed: false}
]



todo_items_all = TodoItem.all.to_a

TodoList.all.each do |td_list|
	j = 0
    while j < 5
    	td_list.todo_items << todo_items_all.shift
    	j = j + 1
    end
end
# i = 0

# while (i < todolists.length)
# 	j = 0
#     while (j < 5)
#     	todolists[i].todo_items << todo_items_all.shift
#     	j = j + 1
#     end
#     i = i + 1
# end













