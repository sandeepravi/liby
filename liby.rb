def evaluate(ast)
  ast[1..-1].reduce(ast[0])
end

def parse(ast)
  ast = ast.first
  ast.map do |token|
    if token_is_a_function?(token)
      token.to_sym
    elsif token_is_an_integer?(token)
      token.to_i
    end
  end
end

def strip_comments(str)
  str.gsub(/^;.*\n/ , "")
end

def token_is_an_integer?(token)
  token.match(/[\-\+]?[0-9]+/)
end

def token_is_a_function?(token)
  ["+", "-", "/", "*"].include? token
end

def lexer(code)
  code.gsub("(","( ").gsub(")"," )").split
end

def analyzer(tokens)
  return [tokens[1..-2]] if tokens[0] == "(" && tokens[-1] == ")"
  raise "Incorrect Syntax"
end

#code = open("sample.lisp", 'r'){|f| f.read }
#t1 = Time.now.to_f
#result = evaluate(parse(analyzer(lexer(strip_comments(code)))))
#t2 = Time.now.to_f
#
#puts result
#
#puts "\n Time taken : #{(t2 - t1).to_f}"
