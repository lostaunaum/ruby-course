require_relative 'spec_helper.rb'

describe PuppyBreeder::Puppy do

  it "initializes a puppy with three attribues" do
    puppy1 = PuppyBreeder::Puppy.new("Marco", "Rotweiler", 5)
    expect(puppy1.name).to eq("Marco")
    expect(puppy1.breed).to eq("Rotweiler")
    expect(puppy1.age).to eq(5)
  end

  it "associates puppies of the same breed to a same key within a hash" do 
    puppy1 = PuppyBreeder::Puppy.new("Marco", "Rotweiler", 5)
    the_pen = PuppyBreeder::Puppymanager.new(puppy1)
    expect(the_pen.puppies_breed).to be_a(Hash)
  end 
end 