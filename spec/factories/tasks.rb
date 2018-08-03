FactoryBot.define do
  factory :task do
    name 'MyString'
    file 'MyString'
    exec_command 'MyString'
    uid SecureRandom.uuid
    user
    environment
  end
end
