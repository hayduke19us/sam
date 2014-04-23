require 'active_support/concern'

module Shaman

  extend ActiveSupport::Concern

  def self.add
    1 + 1
  end

  class Journey

    attr_reader :journey

    def initialize args
      @journey = args.fetch(:journey)
    end

    def create_itenerary
      itenerary = Itenerary.new(journey_id: self.journey.id)
      itenerary.save
    end

  end


end
