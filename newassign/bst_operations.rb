require 'io/console'
class Node 
  attr_accessor :value, :left, :right
  
  def initialize (value)
    @value = value 
    @left = nil 
    @right = nil 
  end
end 

class BST    
  def insertElement(root,key)
    if root==nil
      return Node.new(key) 
    end  
    if key < root.value
      root.left=insertElement(root.left,key)
    else
      root.right=insertElement(root.right,key)
    end
    return root
  end

  def smallestElement(root)
    if root==nil 
      return nil
    elsif(root.left==nil)
      return root.value
    else
      return smallestElement(root.left)
    end   
  end

  def largestElement(root)
    if root==nil 
      return nil
    elsif(root.right==nil)
      return root.value
    else
      return largestElement(root.right)
    end   
  end

  def printInorder(root)
    if root==nil
      return
    end
    printInorder(root.left)
    puts root.value
    printInorder(root.right)
  end

  def printPreorder(root,arr)
    if root==nil
      return
    end
    arr.push(root.value)
    puts root.value
    printPreorder(root.left,arr)
    printPreorder(root.right,arr)
  end

  def printPostorder(root)
    if root==nil
      return
    end
    printPostorder(root.left)
    printPostorder(root.right)
    puts root.value
  end  

  def searchElement(root,key)
    if root==nil
      return false
    end
    if key < root.value 
      return searchElement(root.left,key)
    elsif key > root.value 
      return searchElement(root.right,key)
    else 
      return true
    end    
  end  

  def printAllPaths(root,arr)
    arr.push(root.value.to_i)
    if root.left != nil 
      printAllPaths(root.left,arr)
    end  
    if root.right != nil
      printAllPaths(root.right,arr)
    end
    if (root.left==nil && root.right==nil)
      puts arr
    end
    arr.pop()     
  end

  def minValueNode(node)
    current = node
    while(current.left!=nil)
      current = current.left
    end
    return current
  end  

  def deleteNode(root, key)
    if root == nil
      return root
    end    
    if(key<root.value)
      root.left = deleteNode(root.left,key)
    elsif (key>root.value)
      root.right = deleteNode(root.right,key)
    else
      if root.left == nil
        temp = root.right
        root = nil
        return temp
      elsif root.right == nil
        temp = root.left
        root = nil
        return temp
      end
      temp = minValueNode(root.right)
      root.value = temp.value
      root.right = deleteNode(root.right, temp.value)
    end
    return root
  end  
end  

pre=[]
File.foreach(ARGV[0]) {|line| pre.push(line.to_i)}
p pre
bst=BST.new
root=nil

for i in pre
  root=bst.insertElement(root,i)
end

while 1
  command=$stdin.gets
  if(command.chomp=="quit")
    ftwo = File.open(ARGV[0], "w") 
    ftwo.truncate(0)
    preorder=[]
    bst.printPreorder(root,preorder)
    for x in preorder  
      ftwo.puts(x) 
    end
    exit()
  elsif command.chomp=="insert"
    key=$stdin.gets
    root=bst.insertElement(root,key.chomp.to_i)
  elsif command.chomp=="largest"
    puts bst.largestElement(root)
  elsif command.chomp=="smallest"
    puts bst.smallestElement(root)
  elsif command.chomp=="inorder"
    bst.printInorder(root)
  elsif command.chomp=="preorder"
    bst.printPreorder(root,[]) 
  elsif command.chomp=="postorder"
    bst.printPostorder(root)
  elsif command.chomp=="search"
    key=$stdin.gets
    p bst.searchElement(root,key.chomp.to_i)
  elsif command.chomp=="printallpaths"
    arr=[]
    bst.printAllPaths(root,arr)
  elsif command.chomp=="delete"
    key=$stdin.gets
    root=bst.deleteNode(root,key.chomp.to_i)  
  else 
    p "Invalid Command"
  end
end     


