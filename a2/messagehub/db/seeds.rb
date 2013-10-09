# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Seed the App db with default app options (ios, android, web, and other)
App.create(app_title: 'ios', description: 'From iOS app', active: true)
App.create(app_title: 'android', description: 'From Android app', active: true)
App.create(app_title: 'web', description: 'From default web app', active: true)
App.create(app_title: 'unknown', description: 'From an unknown source', active: true)