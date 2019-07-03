class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end

  def parent=(node)
    return @parent = nil if node.nil?
    @parent.children.delete(self) if @parent && node
    @parent = node
    @parent.children << self
  end

  def children
    @children
  end

  def value
    @value
  end
end
