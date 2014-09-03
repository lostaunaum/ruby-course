require_relative 'spec_helper.rb'

describe PuppyBreeder::Purchaserequest do

  it "initializes a transaction with 2 attributes" do
    transaction1 = PuppyBreeder::Purchaserequest.new("Rotweiler")
    expect(transaction1.status).to eq("pending")
  end

  it "stores pending transactions in one hash with the key pending" do
    transaction1 = PuppyBreeder::Purchaserequest.new("Rotweiler")
    transactions = PuppyBreeder::Transaction_manager.new(transaction1)

    expect(transactions.inputing_transactions).to be_a(Hash)
  end 

  it "it allows the user to view the pending transactions in a hash" do
    request = PuppyBreeder::Purchaserequest.new("Galifardo")
    expect(request.breed_request).to eq("Galifardo")
    request_information = PuppyBreeder::Transaction_manager.new(request)

    expect(request_information.inputing_transactions.class).to eq(Hash)

    request_information


    # expect(PuppyBreeder::Transaction_manager.viewing_pending_transactions).to eq("Something")
  end 

  it "It allows the user to change the status of an Order if the dogs breed is not in the pen" do
    request = PuppyBreeder::Purchaserequest.new("ALIEN DOG")
    request_information = PuppyBreeder::Transaction_manager.new(request)

    expect(request_information.put_orders_on_hold).to eq("dog not in pen status ON HOLD")

    puppy1 = PuppyBreeder::Puppy.new("ET", "ALIEN DOG", 5)
    puppy1_in_pen = PuppyBreeder::Puppymanager.new(puppy1)
    expect(puppy1_in_pen.puppies_breed).to be_a(Hash)

    expect(request_information.put_orders_on_hold).to eq("That puppy has become available")

  end

  it "once the puppy becomes available it will alert the customer" do
    request = PuppyBreeder::Purchaserequest.new("Rotweiler")
    request_information = PuppyBreeder::Transaction_manager.new(request)
    expect(request_information.put_orders_on_hold).to eq("That puppy has become available")
  end

  it "it allows the user to view ONLY the pending transactions not the ones on HOLD" do
    request1 = PuppyBreeder::Purchaserequest.new("German Shepard")
    request2 = PuppyBreeder::Purchaserequest.new("Rotweiler")
    request_information1 = PuppyBreeder::Transaction_manager.new(request1)
    request_information2 = PuppyBreeder::Transaction_manager.new(request2)
    expect(request_information1.put_orders_on_hold).to eq("dog not in pen status ON HOLD")
    expect(PuppyBreeder::Transaction_manager.viewing_pending_transactions).to eq("You have 2 orders pending")
  end 

end