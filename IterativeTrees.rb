class Node
    attr_reader :data
    attr_accessor :left, :right

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
    # Space Complexity: Constant - Uses only variables

    def find_value(value_to_find, root)
        current = root

        until current.nil?
            return puts true if current.data == value_to_find

            current = if value_to_find < current.data
                          current.left
                      else
                          current.right
                      end
        end

        puts false
    end

    # Time Complexity: O(log n) - Each iteration removes half of the searchable tree
    # Space Complexity: Constant - Uses only variables

    def insert(value, root)
        temp = Node.new(value, nil, nil)
        if root.nil?
            root = temp
            return
        end

        current = root
        parent = nil

        until current.nil?
            parent = current
            current = if value <= current.data
                          current.left
                      else
                          current.right
                      end
        end

        if value <= parent.data
            parent.left = temp
        else
            parent.right = temp
        end
    end

    # Time Complexity: O(n) - Iterates through entire tree
    # Space Complexity: O(n) - Uses Extra space from queue array that stores nodes

    def find_height(root)
        queue = []
        height = 0
        node_count = 0

        if root.nil?
            return 0
        else
            queue << root
        end

        loop do
            node_count = queue.length
            if node_count == 0
                return puts height
            else
                height += 1
            end

            while node_count > 0
                temp = queue.shift

                queue << temp.left unless temp.left.nil?

                queue << temp.right unless temp.right.nil?

                node_count -= 1
            end
        end
    end

    # Time Complexity: O(n) - Iterates through entire tree
    # Space Complexity: O(n) - Uses Extra space from stack array that stores nodes

    def preorder_print(root)
        return if root.nil?

        stack = []
        stack.push(root)

        until stack.empty?
            current = stack.pop

            print current.data

            stack.push(current.right) if current.right

            stack.push(current.left) if current.left
        end
    end

    # Time Complexity: O(n) - Iterates through entire tree
    # Space Complexity: O(n) - Uses Extra space from stack array that stores nodes

    def inorder_print(root)
        return if root.nil?

        stack = []
        stack.push(root)

        current = root

        until current.nil? || stack.empty?
            if !current.nil?
                stack.push(current)
                current = current.left
            elsif !stack.empty?
                current = stack.pop
                print current.data
                current = current.right
            end
        end
    end

    # Time Complexity: O(n) - Iterates through entire tree
    # Space Complexity: O(n) - Uses Extra space from stack array that stores nodes

    def postorder_print(root)
        return if root.nil?

        stack1 = []
        stack2 = []
        stack1.push(root)

        until stack1.empty?
            current = stack1.pop
            stack2.push(current)

            stack1.push(current.left) unless current.left.nil?
            stack1.push(current.right) unless current.right.nil?
        end

        until stack2.empty?
            temp = stack2.pop
            print temp.data
        end
    end

    # Time Complexity: O(n) - Iterates through entire tree
    # Space Complexity: O(n) - Uses Extra space from queue array that stores nodes

    def levelorder_print(root)
        return if root.nil?

        queue = []
        queue << root

        until queue.empty?
            current = queue.pop
            print current.data

            queue << current.left unless current.left.nil?
            queue << current.right unless current.right.nil?
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
test_tree.find_height(node1)
test_tree.preorder_print(node1)
test_tree.inorder_print(node1)
test_tree.postorder_print(node1)
test_tree.levelorder_print(node1)
