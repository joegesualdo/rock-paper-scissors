require "rspec"
# require "rspec-mocks"
require 'rspec/mocks'
require_relative "../classes/game.rb"

RSpec.describe Game do
  before(:each) do
    # setup Person double
    @joe = double("book")
    allow(@joe).to receive(:name) { "Joe" }
    allow(@joe).to receive(:score) { 0 }
  end
  context "instance methods" do
    it "#player" do
      game = Game.new(@joe)
      expect(game.respond_to? :player).to eq true 
    end
  end
  context "#new" do
    context "when passed Player parameter" do
      it "creates a new instance with player." do
        game = Game.new(@joe)
        expect(game.player.name).to eql "Joe"
      end
    end
  end
end
