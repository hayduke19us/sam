class WelcomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to users_dashboard_path
    end
    @questions = {"What's your favorite food?" =>
                  {"I like to eat Butter Chicken with Baryani."=>
                    "Banglore, india",
                    "White cheese pizza from Cibeli's of course."=>
                   "Bend, Oregon"},
                  "What do you want to be when your old?"=>
                    {"An Astronaut"=> "Kansas City, Missouri",
                     "I don't know"=> "Kenya, Africa"},
                  "Do you celebrate Christmas?"=>
                    {"No we celebrate Hanika"=> "Tel Aviv, Israel",
                     "Christmas is my favorite" => "Berlin, Germany"},
                  "Do you have any pets?"=> 
                    {"We have two dogs" => "Dallas, Texas",
                     "My dad says 'our flat is not pet compatible'" =>
                     "London, England"}}
  end
end
