class BST    
    def insert_element(root,key)
      if root==nil
        return Node.new(key) 
      end  
      if key < root.value
        root.left=insert_element(root.left,key)
      else
        root.right=insert_element(root.right,key)
      end
      return root
    end
  
    def smallest_element(root)
      if root==nil 
        return nil
      elsif(root.left==nil)
        return root.value
      else
        return smallest_element(root.left)
      end   
    end
  
    def largest_element(root)
      if root==nil 
        return nil
      elsif(root.right==nil)
        return root.value
      else
        return largest_element(root.right)
      end   
    end
  
    def print_inorder(root)
      if root==nil
        return
      end
      print_inorder(root.left)
      puts root.value
      print_inorder(root.right)
    end
  
    def print_preorder(root,arr)
      if root==nil
        return
      end
      arr.push(root.value)
      puts root.value
      print_preorder(root.left,arr)

      print_preorder(root.right,arr)
    end
  
    def print_postorder(root)
      if root==nil
        return
      end
      print_postorder(root.left)

      print_postorder(root.right)
      puts root.value
    end  
  
    def search_element(root,key)
      if root==nil
        return false
      end
      if key < root.value 
        return search_element(root.left,key)
      elsif key > root.value 
        return search_element(root.right,key)
      else 
        return true
      end    
    end  
  
    def print_allPaths(root,arr)
      arr.push(root.value.to_i)
      if root.left != nil 
        print_allPaths(root.left,arr)
      end  
      if root.right != nil
        print_allPaths(root.right,arr)
      end
      if (root.left==nil && root.right==nil)
        puts arr
      end
      arr.pop()     
    end
  
    def min_node(node)
      current = node
      while(current.left!=nil)
        current = current.left
      end
      return current
    end  
  
    def delete_node(root, key)
      if root == nil
        return root
      end    
      if(key<root.value)
        root.left = delete_node(root.left,key)
      elsif (key>root.value)
        root.right = delete_node(root.right,key)
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
        temp = min_node(root.right)
        root.value = temp.value
        root.right = delete_node(root.right, temp.value)
      end
      return root
    end  
end