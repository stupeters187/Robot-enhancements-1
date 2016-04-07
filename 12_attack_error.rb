require_relative 'spec_helper'

describe Robot do

  describe "#attack!" do
    context "Only attacks robots" do
      it "Raises NotRobotError" do
        @robot = Robot.new
        expect{@robot.attack!(Item)}.to raise_error(Robot::NotRobotError)
      end
    end
  end


end