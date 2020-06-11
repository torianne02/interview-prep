class MyArray
  attr_reader :length

  def initialize
    @length = 0
    @elements = {}
  end

  def push(element)
    @elements[@length] = element
    @length += 1
  end 

  def at(index)
    if index < @length
      @elements.each_value.with_index { |value, i| return value if i == index }
    else 
      return nil
    end
  end 

  def pop()
    last_element = @elements[@length - 1]
    @elements.delete(@length - 1)
    @length -= 1

    return last_element
  end 

  def shift_elements(index)
    counter = index
    while counter < @length - 1 do
      @elements[counter] = @elements[counter + 1]
      counter += 1
    end 

    @elements.delete(@length - 1)
    @length -= 1
  end

  def delete_at(index)
    if index < @length
      element = @elements[index]
      self.shift_elements(index)

      return element
    else 
      return nil
    end 
  end 

  def delete(element)
    @elements.each_value.with_index do |value, index|
      if value == element
        self.shift_elements(index)
      elsif index == @length - 1
        return nil
      end 
    end 

    return element
  end

  def includes?(element)
    result = false
    @elements.each_value { |value| result = true if value == element }
    return result
  end 

  def print
    @elements.each_value do |value|
      p value
    end
  end
end 

my_array = MyArray.new()
my_array.push(3)
my_array.push(5)
my_array.push(8)
# print my_array.at(1)
# my_array.pop()
print my_array.delete(8)
# print my_array.delete(5)
# print my_array.includes?(9)

# print my_array.print()
