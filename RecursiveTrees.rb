class Node
    attr_accessor :left, :right, :data

    def initialize(value, left = nil, right = nil)
        @data = value
        @left = left
        @right = right
    end
end

class Trees
    def initialize
        @root = nil
    end

    # Time Complexity: O(log n) - Each iteration removes half of the searchable tree
    # Space Complexity: O(log n) - Uses Extra space from call stack

    def find_value(value_to_find, root)
        return puts false if root.nil?
        return puts true if value_to_find == root.data

        return find_value(value_to_find, root.left) if value_to_find < root.data

        find_value(value_to_find, root.right)
    end

    # Time Complexity: O(log n) - Each iteration removes half of the searchable tree
    # Space Complexity: O(log n) - Uses Extra space from call stack

    def insert(value, root)
        if root.nil?
            root = Node.new(value, nil, nil)
            return
        end

        insert_helper(root, value)
    end

    # Time Complexity: O(n) - Iterates through entire tree
    # Space Complexity: O(log n) - Uses Extra space from call stack

    def find_height(root)
        return 0 if root.nil?

        heightleft = find_height(root.left)
        heightright = find_height(root.right)

        return 1 + heightright if heightleft < heightright

        1 + heightleft
    end

    # Time Complexity: O(n) - Iterates through entire tree
    # Space Complexity: O(log n) - Uses Extra space from call stack

    def preorder_print(root)
        return if root.nil?

        print root.data
        preorder_print(root.left)
        preorder_print(root.right)
    end

    # Time Complexity: O(n) - Iterates through entire tree
    # Space Complexity: O(log n) - Uses Extra space from call stack

    def inorder_print(root)
        return if root.nil?

        inorder_print(root.left)
        print root.data
        inorder_print(root.right)
    end

    # Time Complexity: O(n) - Iterates through entire tree
    # Space Complexity: O(log n) - Uses Extra space from call stack

    def postorder_print(root)
        return if root.nil?

        postorder_print(root.left)
        postorder_print(root.right)
        print root.data
    end

    # Time Complexity: O(n) - Iterates through entire tree
    # Space Complexity: O(log n) - Uses Extra space from call stack

    def levelorder_print(root)
        tree_height = find_height(root)

        tree_height.times do |i|
            print_level(root, i + 1)
            i += 1
        end
    end

    # Time Complexity: O(log n) - Each iteration removes half of the searchable tree
    # Space Complexity: O(log n) - Uses Extra space from call stack

    def delete_node(value, root)
        return if root.nil?

        if value < root.data
            root.left = delete_node(value, root.left)
        elsif value > root.data
            root.right = delete_node(value, root.right)
        else
            if root.left.nil? && root.right.nil?
                root = nil
            elsif root.left.nil?
                root = root.right
            elsif root.right.nil?
                root = root.left
            else
                temp = root.left
                temp = temp.right until temp.right.nil?
                temp_value = temp.data
                root = delete_node(temp_value, root)
                root.data = temp_value

          end
      end

        root
  end

    private

    def print_level(current, i)
        return if current.nil?

        if i == 1
            print current.data
        elsif i > 1
            print_level(current.left, i - 1)
            print_level(current.right, i - 1)
        end
    end

    def insert_helper(current, value)
        if value <= current.data
            if !current.left.nil?
                insert_helper(current.left, value)
            else
                current.left = Node.new(value, nil, nil)
                nil
            end
        else
            if !current.right.nil?
                insert_helper(current.right, value)
            else
                current.right = Node.new(value, nil, nil)
                nil
            end
        end
    end
end

test_tree = Trees.new

node4 = Node.new(-4, nil, nil)
node5 = Node.new(4, nil, nil)
node6 = Node.new(8, nil, nil)
node7 = Node.new(19, nil, nil)
node3 = Node.new(11, node6, node7)
node2 = Node.new(2, node4, node5)
node1 = Node.new(5, node2, node3)

test_tree.find_value(8, node1)
test_tree.insert(6, node1)
test_tree.find_value(6, node1)
test_tree.find_value(11, node1)
test_tree.delete_node(11, node1)
test_tree.find_value(11, node1)
test_tree.find_height(node1)
test_tree.preorder_print(node1)
test_tree.inorder_print(node1)
test_tree.postorder_print(node1)
test_tree.levelorder_print(node1)
