#supported environemts

# ruby = Environment.find_or_create_by(name: 'ruby')
# ruby.update_attributes(file_extension: 'rb', active: false)
#
# ruby = Environment.find_or_create_by(name: 'python2')
# ruby.update_attributes(file_extension: 'py', active: true)

ruby = Environment.find_or_create_by(name: 'python3')
ruby.update_attributes(file_extension: 'py', active: true)
