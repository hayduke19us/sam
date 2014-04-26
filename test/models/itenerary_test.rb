require "test_helper"

class IteneraryTest < ActiveSupport::TestCase

  def setup
    @itenerary = iteneraries(:franny_journey_itenerary)
  end

  test "an itenerary belongs to a journey" do
    franny_journey = journeys(:franny_journey)
    assert_equal franny_journey, @itenerary.journey
  end

  test "an itenerary without a journey_id is invalid" do
    @itenerary.journey_id = nil
    refute @itenerary.valid?
  end

  test "returns a collection of users" do
    assert_equal 1, @itenerary.users.count
  end

  test "returns a collection of cities" do
    assert_equal 1, @itenerary.cities.count
  end

  test "figaro is working (flickr_api_key in config/application.yml)" do
    assert ENV["flickr_api_key"]
    assert ENV["flickr_secret"]
  end

  test "Photo::Flickr attributes are accessible" do
    flickr = Photo::Flickr.new
    assert flickr.base_uri
  end

  test "Flickr.search returns array of photo information" do
    flickr = Photo::Flickr.new
    assert_equal 10,  flickr.search("seattle").count
  end

  test "Flickr::Search has accesible attributes" do
    search = Photo::Search.new ["seattle", "austin"]
    assert 2, search.cities_array.count
    assert search.flickr
  end

  test "::Search returns a hash of cities and results" do
    search  = Photo::Search.new ["seattle", "austin"]
    repo = search.flickr_repo
    assert_equal Hash, repo.class 
    assert_equal 2, repo.count 
  end

  test "::Search image_urls return hash of city and href urls for the values" do
    search  = Photo::Search.new ["seattle", "austin"]
    urls = search.image_urls
    assert_equal 2, urls.count
    assert_equal 10, urls["seattle"].count
  end

  test "iteneraries has access to photo search return hash of photos by city" do
    assert_equal 2, @itenerary.photos(["seattle", "San Francisco"]).count
  end

  test "interaction photos returns collection of photos per interaction city" do
    assert_equal 1, @itenerary.interaction_photos.count
  end


end
