require 'io/console'
require_relative 'class_BST'
require_relative 'class_node'
preorder=[]
File.foreach(ARGV[0]) { |line| preorder.push(line.to_i) }
p 'Preorder array from the loaded file:'
p preorder
bst=BST.new
root=nil
for element in preorder
  root=bst.insert_element(root,element)
end
while 1
  command=$stdin.gets
  if(command.chomp=="quit")
    ftwo = File.open(ARGV[0], "w") 
    ftwo.truncate(0)
    preorder=[]
    bst.print_preorder(root,preorder)
    for x in preorder  
      ftwo.puts(x) 
    end
    exit()
  elsif command.chomp=="insert"
    puts 'Enter number to insert:'
    key=$stdin.gets
    root=bst.insert_element(root,key.chomp.to_i)
  elsif command.chomp=="largest"
    puts bst.largest_element(root)
  elsif command.chomp=="smallest"
    puts bst.smallest_element(root)
  elsif command.chomp=="inorder"
    bst.print_inorder(root)
  elsif command.chomp=="preorder"
    bst.print_preorder(root,[]) 
  elsif command.chomp=="postorder"
    bst.print_postorder(root)
  elsif command.chomp=="search"
    puts 'Enter number to search:'
    key=$stdin.gets
    p bst.search_element(root,key.chomp.to_i)
  elsif command.chomp=="printallpaths"
    arr=[]
    bst.print_allPaths(root,arr)
  elsif command.chomp=="delete"
    puts 'Enter number to be deleted:'
    key=$stdin.gets
    root=bst.delete_node(root,key.chomp.to_i)  
  else 
    p "Invalid Command"
  end
end    