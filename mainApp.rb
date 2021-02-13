

class List
  attr_accessor :X, :Y, :Z, :input

  def initialize
    @X = []
    @Y = []
    @Z = []
    @input = ""
  end

  def rotate
    temporaryList = @X
    @X = @Y
    @Y = @Z
    @Z = temporaryList
    self
  end

  def switchXandY
    temporaryList = @X
    @X = @Y
    @Y = temporaryList
    self
  end

  def mergeList(xList,yList)
    resultArray = []
    i = 0; j =0
    while(i < (xList.length) && j < (yList.length))
      if(xList[i] < yList[j])
        resultArray << xList[i]
        i+=1
      else
        resultArray << yList[j]
        j+=1
      end

    end
    while(i < (xList.length))
      resultArray << xList[i]
      i+=1
    end
    while(j < (yList.length))
      resultArray << yList[j]
      j+=1
    end
    resultArray
  end

  def copyXinY(xList,yList)

  end

  def to_s
    puts "X: #{@X} \n Y: #{@Y} \n Z: #{@Z}"
  end
end

class Node
  attr_accessor :value,:left,:right
  def initialize value
    @value = value
    @left  = nil
    @right = nil
  end


end

class BST
  attr_accessor :root , :list

  def initialize
    @root = nil
    @list = []
  end

  def insert node,val

    if @root.nil?
      @root = Node.new val
    else
      if val > node.value
        if node.right
          insert node.right,val
        else
          node.right = Node.new val
        end
      else
        if node.left
          insert node.left,val
        else
          node.left = Node.new val
        end
      end
    end
  end

  def print_inorder_with_recursion(current)
    return if current.nil?

    print_inorder_with_recursion(current.left)
    self.list << current.value
    print_inorder_with_recursion(current.right)
  end

  def sortList(inputlist)
    arrOfNumbers = inputlist.split
    self.root = Node.new(arrOfNumbers[0].to_i)
    for x in (1..arrOfNumbers.length-1) do

      number = arrOfNumbers[x].to_i

      self.insert(self.root,number)
    end
    self.print_inorder_with_recursion(self.root)
    self.list
  end

  def to_s
    puts "#{@list}"
  end

end

class PerformOperations

  def inputProcessing(commandInput ,listObj)

      case commandInput
      when 'X'
        puts "Enter the numeric values for List X:"
        listObj.X = gets.chomp
        binarySearchTreeObj = BST.new()
        listObj.X = binarySearchTreeObj.sortList(listObj.X)
        listObj.to_s
      when 'Y'
        puts "Enter the numeric values for List Y:"
        listObj.Y = gets.chomp
        binarySearchTreeObj = BST.new()
        listObj.Y = binarySearchTreeObj.sortList(listObj.Y)
        listObj.to_s
      when 'Z'
        puts "Enter the numeric values for List Z:"
        listObj.Z = gets.chomp
        binarySearchTreeObj = BST.new()
        listObj.Z = binarySearchTreeObj.sortList(listObj.Z)
        listObj.to_s
      when 'r'
        listObj.rotate.to_s
      when 's'
        listObj.switchXandY.to_s
      when 'm'
        listObj.X = listObj.mergeList(listObj.X, listObj.Y)
        puts listObj.to_s
      when 'c'
        listObj.X = listObj.copyXinY(listObj.X, listObj.Y)
        puts listObj.to_s
      when 'l i'
        listObj.rotate.to_s
      when 'p'
        listObj.to_s
      else
        puts "Invalid command. Please try again."

      end
  end

  def merge(list1,list2)

  end
end


=begin
nk = BST.new
nk.insert nk.root,23
nk.insert nk.root,45
nk.insert nk.root,12

nk.print_inorder_with_recursion(nk.root)
p nk.list
=end

l = List.new
operationObject = PerformOperations.new
while true
  puts "Enter the command to be executed : "
  l.input = gets.chomp
  if l.input != 'q'
    operationObject.inputProcessing(l.input, l)
  else
    puts "Thank you for your time and consideration."
    break
  end
end
