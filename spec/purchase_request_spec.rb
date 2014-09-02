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

  it "allows to change the status of pending transactions" do
    request = PuppyBreeder::Purchaserequest.new("Rotweiler")
    request_information = PuppyBreeder::Transaction_manager.new(request)

    expect(request_information.accepting_requests).to eq("Transaction accepted for a Rotweiler")
  end

end