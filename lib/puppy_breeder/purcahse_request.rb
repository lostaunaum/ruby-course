module PuppyBreeder
  class Purchaserequest
    attr_reader :breed_request
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

    def todays_transactions
      transactions_hash["pending"] = []
      transactions_hash["accepted"] = []
      if @transaction.status == "pending"
        @@transactions_hash["pending"].push(@transaction)
      else
        @@transactions_hash["accepted"].push(@transaction)
      end
    end 
  end 
end
