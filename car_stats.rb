class CarStats
  
  def self.calc_top_color(cars)
    cars_color_count = Hash.new(0)
    cars.each do |car|
      cars_color_count[car.color] += 1
    end
    most_pop_color = cars_color_count.max_by {|color, count| count} #max_by will accept a block argument very important!!
    most_pop_color.first
  end

  def self.calc_bottom_color(cars)
    cars_color_count = Hash.new(0)
      cars.each do |car|
      cars_color_count[car.color] += 1 
    end
    bottom_color = cars_color_count.min_by {|color, count| count} #min_by will require a block argument and will return the key value pair with the least amount of items
    bottom_color.first
  end
end 


#could not have done this without the help of JOSH! Thanks Man!