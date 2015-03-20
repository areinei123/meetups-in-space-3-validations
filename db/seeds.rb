# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Example:
#
#   Person.create(first_name: 'Eric', last_name: 'Kelly')

Meetup.create(name:'The Place', location:'At the Thing', description:'With the things', time:'19:20')

User.create(provider:'those people', uid:'123456', email:'thing@otherthing.com', username:'whats_that',avatar_url:'http://whatever.com')
