module PuppyBreeder
  class Purchaserequest
    attr_reader :breed_request 
    attr_accessor :status
    def initialize(breed_request, status="pending")
      @breed_request = breed_request
      @status = status
    end 
  end 

  class Transaction_manager
    @@transactions_hash = {}
    def initialize(transaction)
      @transaction = transaction
    end 

    def accepting_requests
      @transaction.status = 'accepted'
      puts "Transaction #{@transaction.status} for a #{@transaction.breed_request}" 
    end

    def inputing_transactions
      if @@transactions_hash[@transaction.status] == nil
        @@transactions_hash[@transaction.status] = [@transaction]
      else
        @@transactions_hash[@transaction.status].push(@transaction)
      end
      p @@transactions_hash
    end 

    def self.viewing_pending_transactions
      i = 0
      @@transactions_hash["pending"].each do |order|
        puts "#{i += 1}. Order #{order.status} for a #{order.breed_request}"
      end 
    end 
  end
end 


transaction1 = PuppyBreeder::Purchaserequest.new("Rotweiler")
transaction2 = PuppyBreeder::Purchaserequest.new("Rotweiler")
transaction3 = PuppyBreeder::Purchaserequest.new("Rotweiler")
transaction4 = PuppyBreeder::Purchaserequest.new("German Shepard")
today = PuppyBreeder::Transaction_manager.new(transaction1)
today1 = PuppyBreeder::Transaction_manager.new(transaction2)
today2 = PuppyBreeder::Transaction_manager.new(transaction3)
today3 = PuppyBreeder::Transaction_manager.new(transaction4)
today.inputing_transactions
today1.inputing_transactions
today2.inputing_transactions
today3.inputing_transactions

today.accepting_requests

PuppyBreeder::Transaction_manager.viewing_pending_transactions