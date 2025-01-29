require 'glimmer-dsl-web'

class WelcomePresenter
  attr_reader :welcomes, :one_greeting
  def initialize
    HTTP.get('/welcomes.json') do |response|
      @welcomes = Native(response.body)
      puts @welcomes[2].greeting
      @one_greeting = @welcomes[2].greeting
    end
  end
end

class HelloGreeting
  include Glimmer::Web::Component

  before_render do
    @presenter = WelcomePresenter.new
    puts @presenter.one_greeting
  end

  markup {
    div(parent: '#app-container', class: 'welcome_container') {
      div(class: "subcontainer") {
        @presenter.one_greeting
      }
    }
  }
end
