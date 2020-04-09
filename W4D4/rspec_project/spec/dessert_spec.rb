require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", :name => "Jason", :titleize => "Jason, but titalized") }
  subject(:dessert) { Dessert.new("lava cake", 15, chef)}


  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("lava cake")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(15)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("lava cake", "15", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(dessert.ingredients).to be_empty
      dessert.add_ingredient("cocoa")
      expect(dessert.ingredients).to include("cocoa")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do 
      dessert.add_ingredient("a")
      dessert.add_ingredient("b")
      dessert.add_ingredient("c")
      dessert.add_ingredient("d")
      pre_ingredients = dessert.ingredients.dup
      dessert.mix!
      post_ingredients = dessert.ingredients.dup

      expect(pre_ingredients).to_not eq(post_ingredients)
      expect(pre_ingredients).to match_array(post_ingredients)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      expect {dessert.eat(7) }.to change {dessert.quantity}.by(-7)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect {dessert.eat(10000)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      expect(dessert.serve).to include(chef.titleize)
      expect(chef).to receive(:titleize)
      dessert.serve
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
