# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
#
puts %{ Ten users will be created all with proper lattitude and longitude 
        Attributes. Check out test/fixtures/users.rb for a better idea.}
puts
puts %{ The Admins login:
        email: hayduke19us@gmail.com
        password: password}

puts "=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-"

def seed_guardian(email, password, user_id)
  Guardian.create(email: email,
                  password: password,
                  password_confirmation: password,
                  user_id: user_id
                 )
end


def seed_user(email, password, lat, long)
  User.create(email: email,
               password: password,
               password_confirmation: password,
               lat: lat,
               long: long)
end

seed_user("hayduke19us@gmail.com", "password", 32.7801399, -96.80045109999999)

seed_user("zoey@gmail.com", "frannypass", 47.6062095, -122.3320708)

seed_user("franny@gmail.com", "zoeypass", 32.7801399, -96.8004510)

seed_user("buddy@gmail.com", "buddypass", 48.856614, 2.3522219)

seed_user("seymore@gmail.com", "seymorepass", 30.26715, -97.7430608)

User.all.each do |user|
  seed_guardian(user.email + "guard", "guardian", user.id)
end


