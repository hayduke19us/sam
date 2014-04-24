require 'active_support/concern'

module Shaman

  extend ActiveSupport::Concern

  class Journey

    attr_reader :journey, :itenerary

    def initialize args
      @journey = args.fetch(:journey)
      @itenerary = ""
    end

    def user
      self.journey.user
    end

    def create_itenerary
      @itenerary = Itenerary.new(journey_id: self.journey.id)
      if @itenerary.save
        Shaman::Symposium.new(journey, itenerary)
      end
    end
  end

  class Symposium

    attr_reader :itenerary, :journey, :user, :base_user

    def initialize(journey, itenerary)
      @journey = journey
      @itenerary = itenerary
      @user = journey.user
      @base_user = ""
      create_interactions
    end

    def create_interactions
      if journey.short?
        short_interaction
      elsif journey.long?
        long_interaction
      end
    end

    def short_interaction
      @base_user = user.base_interaction 200
      base = create_base_interaction
      #the observer at test/observer.rb
      interaction_observer base, "#SHORT BASE"
      interaction_increment itenerary.interactions.first, 3
    end

    def long_interaction
      @base_user = user.base_interaction 6000
      base = create_base_interaction 
      #the observer at test/observer.rb
      interaction_observer base, "#LONG BASE"
      interaction_increment itenerary.interactions.first, 6
    end

    def create_base_interaction
      interaction  = Interaction.new(itenerary_id: itenerary.id,
                                        user_id:  base_user.id)
      interaction.save
      interaction
    end

    def new_interaction distance
      interaction  = Interaction.new(itenerary_id: itenerary.id,
                                     user_id: user.next_interaction(distance).id)
      interaction.save
      interaction
    end

    def interaction_increment base, num
      x = 0
      while x <= 20 && itenerary.interactions.count < num
        distance = user.distance_to(itenerary.interactions.last.user.geo)
        unless user.by_distance(distance, :<).empty?

          interaction = new_interaction(distance)
          interaction_observer interaction, "#increment"

        end
        x += 1
      end
    end

    private

      def interaction_observer interaction, note
        path = File.expand_path('../../sam/test/observer.rb', '__FILE__')
        File.open(path, "a+") do |f|
          unless interaction == nil
            f.puts note
            f.puts "Interaction: #{interaction.id}"
            f.puts "User => #{interaction.user.email}"
            f.puts "Distance From: #{self.user.range_finder(interaction.user.geo)}"
            f.puts "------------------------------------------------------------"
          else
            f.puts note
            f.puts "Interaction nil"
          end
            f.close
         end
      end

  end

end
