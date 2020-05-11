class MyArray
  attr_reader :length, :data

  def initialize
    @length = 0;
    @data = {};
  end

  def get(index) 
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

  def delete(index)
    item = @data[index]

    self.shift_items(index)
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

  def print
    @data.each_value do |value|
      p value
    end
  end
end 

my_array = MyArray.new()
my_array.push(3)
my_array.push(5)
# print my_array.data
# my_array.get(1)
# my_array.pop()
# my_array.length
# print my_array.data
# my_array.delete(0)
# print my_array.data
# my_array.length

my_array.print()
