module Clojure
  class IntegerLiteral < Treetop::Runtime::SyntaxNode
    def to_value
      return self.text_value.to_i
    end
  end

  class StringLiteral < Treetop::Runtime::SyntaxNode
    def to_value
      return self.text_value
    end
  end

  class FloatLiteral < Treetop::Runtime::SyntaxNode
    def to_value
      return self.text_value.to_f
    end
  end

  class Values < Treetop::Runtime::SyntaxNode
    def to_value
      return self.elements.map {|x| x.to_value}
    end
  end

  class Body < Treetop::Runtime::SyntaxNode
    def to_value
      return self.elements.map {|x| x.to_value}
    end
  end

  class FunctionLiteral < Treetop::Runtime::SyntaxNode
    def to_value
      return self.text_value.to_s
    end
  end

  class Expression < Treetop::Runtime::SyntaxNode
    def to_value
      return self.elements.map {|x| x.to_value}
    end
  end

end
