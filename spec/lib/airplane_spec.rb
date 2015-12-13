require_relative "../../lib/airplane"

RSpec.describe Airplane do
let (:my_plane) { Airplane.new("cesna", 10, 150) }

  describe "#initialization" do
    it "Retuns a new airplane object" do
      expect(my_plane).to be_a(Airplane)
    end
    it "Retuns the desired attributes" do
      expect(my_plane.type).to eq("cesna")
      expect(my_plane.wing_loading).to eq(10)
      expect(my_plane.horsepower).to eq(150)
    end
  end

  describe "#land" do
    context "The plane is sitting idle" do
      it "Checks if the engines are running" do
        my_plane

        expect(my_plane.land).to eq ("airplane not started, please start")
      end
    end

    context "Engines are up and running" do
      it "Checks if the plane is still grounded" do
        my_plane.start
        my_plane.land

        expect(my_plane.land).to eq ("airplane already on the ground")
      end
    end

    context "The plane is airbourne" do
      it "Land the plane" do
        my_plane.start
        my_plane.takeoff
        my_plane.land

        expect(my_plane.land).to eq ("airplane landed")
      end
    end
  end

  describe "#takeoff" do
    context "Prepares for takeoff" do
      it "Checks if the engines are running" do
        my_plane

        expect(my_plane.takeoff).to eq("airplane not started, please start")
      end
    end
    context "Prepares for takeoff" do
      it "Barrels down the runway if engines are on" do
        my_plane.start
        my_plane.takeoff

        expect(my_plane.takeoff).to eq("airplane launched")
      end
    end
  end

  describe "#start" do
    context "When engines are switched off" do
      it "Turns ignition to start the engines" do
        expect(my_plane.start).to eq("airplane started")
      end
    end

    context "When engines are running" do
      it "Indicates engines are running" do
        my_plane.start

        expect(my_plane.start).to eq("airplane already started")
      end
    end
  end
end
