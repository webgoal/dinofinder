require 'test_helper'

class DinosaurTest < ActiveSupport::TestCase
  fixtures :dinosaurs

  test "Seach parameter with no value returns empty response" do
    assert_equal Dinosaur.search(:with_name => ""), Dinosaur.all
  end

  test "Search with_name must retrieve only dinosaurs with matching name" do
    dinos_with_name = Dinosaur.search(:with_name=>"Stego")
    dinos_with_name.each do |dino|
      assert_match /stego/, dino.name.downcase
    end
  end

  test "Search with more than one parameter should match corresponding dinosaurs" do
    dinos = Dinosaur.search(:with_name=>"saurus", :taller_than => "4")
    dinos.each do |dino|
      assert_match /saurus/, dino.name.downcase
      assert dino.height > 4
    end
  end

   test "Search taller_than must retrieve only dinosaurs with matching height" do
    dinos_with_name = Dinosaur.search(:taller_than => "4")
    dinos_with_name.each do |dino|
      assert dino.height > 4
    end
  end

end
