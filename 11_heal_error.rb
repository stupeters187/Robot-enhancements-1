require_relative 'spec_helper'

describe Robot do

  before :each do
    @robot = Robot.new
  end
  describe "#heal!" do
    context "Only heals live robots" do
      it "Raises RuntimeError" do
        robot2 = Robot.new
        robot2.instance_variable_set(:@health, 0)
        expect{@robot.heal!(robot2)}.to raise_error(Robot::DeadRobotError)
      end
    end
  end


end