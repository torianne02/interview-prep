class MyArray
  attr_reader :length

  def initialize
    @length = 0
    @data = {}
  end

  def at(index) 
    @data[index]
  end 

  def push(item)
    @data[@length] = item 
    @length += 1
  end

  def pop()
    lastItem = @data[@length - 1]
    @data.delete(@length - 1)
    @length -= 1
    return lastItem
  end 

  def delete_at(index)
    item = @data[index]

    self.shift_items(index)
    return item
  end

  def delete(item)
    @data.each_value.with_index do |value, index|
      if value === item
        self.shift_items(index)
      end 
    end
    return item
  end 

  def shift_items(index)
    counter = index
    while counter < @length - 1 do
      @data[counter] = @data[counter + 1]
      counter += 1
    end 

    @data.delete(@length - 1)
    @length -= 1
  end

  def includes?(item)
    result = false
    @data.each_value { |value| result = true if value === item }
    return result
  end 

  def print
    @data.each_value do |value|
      p value
    end
  end
end 

my_array = MyArray.new()
my_array.push(3)
my_array.push(5)
my_array.push(8)
# my_array.at(1)
# my_array.pop()
# my_array.delete_at(0)
# print my_array.delete(5)
print my_array.includes?(9)

# print my_array.print()
