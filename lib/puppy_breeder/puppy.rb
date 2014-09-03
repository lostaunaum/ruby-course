#Refer to this class as PuppyBreeder::Puppy
module PuppyBreeder
  class Puppy
    attr_reader :name, :breed, :age
    def initialize(name, breed, age)
      @name = name
      @breed = breed
      @age = age
    end
    #we are creating our puppy object
  end

  class Puppymanager
    @@in_the_pen = {}
    attr_reader :in_the_pen
    def initialize(puppy_object)
      @puppy_object = puppy_object
    end
    #We are inserting our puppy object within a class that will manage all our puppies within a pen

    def puppies_breed
      if @@in_the_pen[@puppy_object.breed] == nil
        @@in_the_pen[@puppy_object.breed] = [@puppy_object]
      else
        @@in_the_pen[@puppy_object.breed].push(@puppy_object)
      end
      p @@in_the_pen
    end

    #This hash is being created but we are using our breeds as a key and it is pointing to an array of dog objects

    def self.in_the_pen
      @@in_the_pen
    end

    #this method will allow us to call our HASH OF DOGS in our other ruby pages. 

  end
end

# puppy1 = PuppyBreeder::Puppy.new("Mark", "Rotweiler", 5)
# puppy2 = PuppyBreeder::Puppy.new("Oso", "Rotweiler", 5)
# puppy3 = PuppyBreeder::Puppy.new("Max", "Rotweiler", 5)
# puppy4 = PuppyBreeder::Puppy.new("Delilah", "German Shepard", 5)
# puppy5 = PuppyBreeder::Puppy.new("Jimmy", "West Highland Terrier", 5)
# add_puppy1 = PuppyBreeder::Puppymanager.new(puppy1)
# add_puppy1.puppies_breed 
# add_puppy2 = PuppyBreeder::Puppymanager.new(puppy2)
# add_puppy2.puppies_breed 
# add_puppy3 = PuppyBreeder::Puppymanager.new(puppy3)
# add_puppy3.puppies_breed 
# add_puppy4 = PuppyBreeder::Puppymanager.new(puppy4)
# add_puppy4.puppies_breed 
# add_puppy5 = PuppyBreeder::Puppymanager.new(puppy5)
# add_puppy5.puppies_breed 
