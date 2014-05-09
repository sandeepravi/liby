module Slisp

  # In file parser.rb
  require 'treetop'

  # Find out what our base path is
  BASE_PATH = File.expand_path(File.dirname(__FILE__))

  # Load our custom syntax node classes so the parser can use them
  require File.join(BASE_PATH, 'node_extensions.rb')

  class Parser

    Treetop.load(File.join(Slisp::BASE_PATH, 'clojure_parser.treetop'))
    @@parser = ClojureParser.new

    attr_reader :content

    def initialize(content)
      @content = content.dup
    end

    def parse
      # Pass the data over to the parser instance
      tree = @@parser.parse(@content)

      # If the AST is nil then there was an error during parsing
      # we need to report a simple error message to help the user
      if(tree.nil?)
        raise Exception, "Parse error at : #{@content[@@parser.index]}"
      end

      Parser.clean_tree(tree)

      return tree.to_value
    end

    private

    def self.clean_tree(root_node)
      return if(root_node.elements.nil?)
      root_node.elements.delete_if{|node| node.class.name == "Treetop::Runtime::SyntaxNode" }
      root_node.elements.each {|node| self.clean_tree(node) }
    end
  end
end
