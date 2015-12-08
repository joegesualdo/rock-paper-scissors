require "rspec"
require_relative "../classes/player.rb"

RSpec.describe Player do
  context "#new" do
    context "when passed 'name' parameter" do
      it "creates a new instance with name." do
      joe = Player.new("joe")
      expect(joe.name).to eql "Joe" 
    end
    end
  end
end
