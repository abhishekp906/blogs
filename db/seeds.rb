# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Role.all.count == 0

  puts 'CREATING ROLES'
  Role.create([
    { :name => 'admin' }, 
    { :name => 'user' }, 
    { :name => 'demo' }
  ], :without_protection => true)

end

if User.all.count == 0

  puts 'SETTING UP DEFAULT USER LOGIN'
  user = User.create! :name => 'Satish', :email => 'satish.nagalla@gmail.com', :password => 'please123', :password_confirmation => 'please123'
  puts 'New user created: ' << user.name
  #user2 = User.create! :first_name => 'Second User', :email => 'satish@crypsis.net', :password => 'please', :password_confirmation => 'please'
  #puts 'New user created: ' << user2.first_name
  user.add_role :admin
  #user2.add_role :VIP

end
