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
        create_interactions
      end
    end

    def create_interactions
      case journey.distance
      when "short"
        short_interaction
      when "long"
        long_interaction
      end
    end

    def short_interaction
      base = base_interaction 500
      #the observer at test/observer.rb
      interaction_observer base, "#short base"
      interaction_increment itenerary.interactions.first, 3
    end

    def base_interaction distance
      interaction  = Interaction.new(itenerary_id: itenerary.id,
                                     user_id: user.base_interaction(distance).id)
      interaction.save
      interaction
    end

    def next_interaction distance
      interaction  = Interaction.new(itenerary_id: self.id,
                                      user_id: user.next_interaction(distance).id)
      interaction.save
      interaction
    end

    def long_interaction
      base = base_interaction 2000
      #the observer at test/observer.rb
      interaction_observer base, "#long base"
      interaction_increment itenerary.interactions.first, 6
    end

    def interaction_increment base, num
      x, y = 0, (num - 1)
      while x <= y
        distance = user.distance_to(itenerary.interactions.last.user.geo)
        unless user.by_distance(distance, :<).empty?
          interaction = new_interaction(distance)
          interaction_observer interaction, "#increment"
        end
      x += 1
      y -= 1
      end
    end

    def new_interaction distance
      interaction  = Interaction.new(itenerary_id: itenerary.id,
                                     user_id: user.next_interaction(distance).id)
      interaction.save
      interaction
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
