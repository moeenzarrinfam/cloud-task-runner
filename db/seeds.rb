# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
ruby = Environment.find_or_create_by(name: 'Ruby')
ruby.update_attributes(file_extension: 'rb', active: false)

ruby = Environment.find_or_create_by(name: 'Python2')
ruby.update_attributes(file_extension: 'py', active: true)

ruby = Environment.find_or_create_by(name: 'Python3')
ruby.update_attributes(file_extension: 'py', active: true)
