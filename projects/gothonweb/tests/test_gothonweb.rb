require 'minitest/autorun'
require 'rack/test'
require './bin/app.rb'

class MyAppTest < Minitest::Test
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_my_default
    get '/'
    assert_equal last_response.status, 302
    assert last_response.location.include?('game')
  end

  def test_game_page_no_session
    get '/game'
    assert last_response.ok?
    # no session so death screen
    assert last_response.body.include?('Looks like you bit the dust')
  end

  def test_game_page_with_session
    get '/game', {}, 'rack.session' => {:room => 'CENTRAL_CORRIDOR'}
    assert last_response.ok?
    assert last_response.body.include?('The Gothons of Planet Percal')
  end

  def test_game_post
    post '/game', params = {:action => 'tell a joke'}, 'rack.session' => {:room => 'CENTRAL_CORRIDOR'}
    assert_equal last_response.status, 302
    assert last_response.location.include?('game')

    follow_redirect!
    assert last_response.ok?
  end
end