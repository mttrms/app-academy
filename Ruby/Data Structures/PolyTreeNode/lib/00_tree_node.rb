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
    if @parent == node
      return
    elsif node.nil?
      @parent = nil
    elsif @parent && node
      @parent.children.delete(self)
      @parent = node
      @parent.children << self
    else
      @parent = node
      @parent.children << self
    end
  end

  def children
    @children
  end

  def value
    @value
  end
end
