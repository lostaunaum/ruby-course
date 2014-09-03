module PuppyBreeder
  class Purchaserequest
    attr_reader :breed_request 
    attr_accessor :status
    def initialize(breed_request, status="pending")
      @breed_request = breed_request
      @status = status
    end 
    #We are creating our transactions here 
  end 

  class Transaction_manager
    @@transactions_hash = {}
    def initialize(transaction)
      @transaction = transaction
    end 
    #We create a class to manage our transaction

    def accepting_requests
      @transaction.status = 'accepted'
      puts "Transaction #{@transaction.status} for a #{@transaction.breed_request}" 
    end
    #this method will allow us to change the status and accept them

    def inputing_transactions
      if @@transactions_hash[@transaction.status] == nil
        @@transactions_hash[@transaction.status] = [@transaction]
      else
        @@transactions_hash[@transaction.status].push(@transaction)
      end
      p @@transactions_hash
    end 
    #this method will allow us to create a hash and use the statuses as a key while pointing to an array of transaction objects

    def put_orders_on_hold
      if PuppyBreeder::Puppymanager.in_the_pen[@transaction.breed_request] == nil
        @transaction.status = "dog not in pen status ON HOLD"
      else 
        @transaction.status = "pending"
        p "That puppy has become available"
      end
    end
    #If the puppy does not exisist within our pen we put the statys on HOLD because we cannot fulfill the order if the puppy becomes available, it will automatically change the status to PENDING

    def self.viewing_pending_transactions
      y = @@transactions_hash["pending"].map do |x|
        x.status
      end
      p "You have #{y.length} orders pending"
    end 
  end
  #This method will print out how many PENDING orders we have in our hash.
end 


# transaction1 = PuppyBreeder::Purchaserequest.new("Rotweiler")
# transaction2 = PuppyBreeder::Purchaserequest.new("Rotweiler")
# transaction3 = PuppyBreeder::Purchaserequest.new("Rotweiler")
# transaction4 = PuppyBreeder::Purchaserequest.new("German Shepard")
# today = PuppyBreeder::Transaction_manager.new(transaction1)
# today1 = PuppyBreeder::Transaction_manager.new(transaction2)
# today2 = PuppyBreeder::Transaction_manager.new(transaction3)
# today3 = PuppyBreeder::Transaction_manager.new(transaction4)
# today.inputing_transactions
# today1.inputing_transactions
# today2.inputing_transactions
# today3.inputing_transactions

# today.accepting_requests

# PuppyBreeder::Transaction_manager.viewing_pending_transactions

