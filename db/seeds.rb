# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

users = User.create([
  { :name => "mark.odermatt", 
    :salt => "1234", 
    :hashed_password => User.encrypted_password('secret', "1234"),
    :is_admin => true }, 
  { :name => "aulosmember", 
    :salt => "5678",
    :hashed_password => User.encrypted_password('taerbinu', "5678")}
])