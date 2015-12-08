require "rspec"
require_relative "../classes/rps_player.rb"

RSpec.describe RpsPlayer do
  context "responds to" do
    it "#name" do
      joe = RpsPlayer.new("joe")
      expect(joe.respond_to? :name).to eq true
    end
    it "#move_history" do
      joe = RpsPlayer.new("joe")
      expect(joe.respond_to? :move_history).to eq true
    end
    it "#move_counter" do
      joe = RpsPlayer.new("joe")
      expect(joe.respond_to? :move_counter).to eq true
    end
  end
  context "#new" do
    context "when passed 'name' parameter" do
      it "creates a new instance with name." do
        joe = RpsPlayer.new("joe")
        expect(joe.name).to eql "Joe" 
      end
    end
  end
  context "#log_move" do
    context "when passed 'move' parameter" do
      it "increments @move_counter with correct move key" do
        joe = RpsPlayer.new("joe")
        joe.log_move("rock")
        expect(joe.move_counter["rock"]).to eq 1
        expect{joe.log_move("rock")}.to change{joe.move_counter["rock"]}.by(1)
      end
      it "adds the move string to the @move_history" do
        joe = RpsPlayer.new("joe")
        joe.log_move("rock")
        expect(joe.move_history.pop).to eq "rock" 
      end
    end
    it "when not passed 'move' parameter" do
      joe = RpsPlayer.new("joe")
      expect{joe.log_move}.to raise_error
    end
  end
end
