# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
#
puts %{ Ten users will be created all with proper lattitude and longitude 
        Attributes. Check out test/fixtures/users.rb for a better idea.}
puts
puts %{ The Admins login:
        email: hayduke19us@gmail.com
        password: password}

def seed_user(email, password, confirm, lat, long)
  user = User.create(email: email,
                     password: password,
                     password_confirmation: confirm,
                     lat: lat,
                     long: long)

  seed_guardian(user, email, password)

end

def seed_guardian user, email, password
  Guardian.create(email: email + "/guard",
                  password: password + "/guard",
                  password_confirmation: password + "/guard",
                  user_id: user.id
                 )
end

seed_user("hayduke19us@gmail.com", "password", "password", 32.7801399, -96.80045109999999)
seed_user("zoey@gmail.com", "frannypass", "frannypass", 47.6062095, -122.3320708)

seed_user("franny@gmail.com", "zoeypass", "zoeypass", 32.7801399, -96.8004510)

seed_user("buddy@gmail.com", "buddypass", "buddypass", 48.856614, 2.3522219)

seed_user("seymore@gmail.com", "seymorepass", "seymorepass", 30.26715, -97.7430608)


