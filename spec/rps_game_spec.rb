require "rspec"
# require "rspec-mocks"
require 'rspec/mocks'
require_relative "../classes/rps_game.rb"

RSpec.describe RpsGame do
  before(:each) do
    # setup Person double
    @joe = double("book")
    allow(@joe).to receive(:name) { "Joe" }
    allow(@joe).to receive(:score) { 0 }
  end
  context "responds to" do
    it "#player" do
      game = RpsGame.new("favorite", @joe)
      expect(game.respond_to? :player).to eq true 
    end
    it "#print_score" do
      game = RpsGame.new("favorite", @joe)
      expect(game.respond_to? :print_score).to eq true 
    end
  end
  context "#new" do
    context "when passed Player parameter" do
      it "creates a new instance with player." do
        game = RpsGame.new("favorite", @joe)
        expect(game.player.name).to eql "Joe"
      end
    end
    context "when not passed a strategy" do
      it "raises an Exception." do
        expect{RpsGame.new(@joe)}.to raise_error
      end
    end
  end
  context "#make_move" do
    context "when not passed a 'move' argument" do
      it "raised an error" do
        game = RpsGame.new("favorite", @joe)
        expect{game.make_move}.to raise_error
      end
    end
  end
end
