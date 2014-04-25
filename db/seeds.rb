require 'yaml'

# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"
puts %{ Nine users will be created all with proper lattitude and longitude 
        Attributes. Check out test/seed/users.yml for a better idea.}
puts
puts %{ The Admins login:
        email: hayduke19us@gmail.com
        password: password}
puts

puts %{ The Admins guardian as well as all guardians:
        email: kids email + /guard
        password: guardian}
puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"

def seed_user(email, password, lat, long)
  User.create(email: email,
               password: password,
               password_confirmation: password,
               lat: lat,
               long: long)
end

def seed_guardian(email, password, user_id)
  Guardian.create(email: email,
                  password: password,
                  password_confirmation: password,
                  user_id: user_id
                 )

end

fixture = YAML.load_file("#{Rails.root}/test/seed/users.yml")

fixture.each do |key, value|
  seed_user(value["email"], 
            value["password"],
            value["lat"],
            value["long"])
end

User.all.each do |user|
  seed_guardian(user.email + "guard", "guardian", user.id)
end

