require 'spec_helper'
require_relative '../lang/parser'

describe 'Parser' do

  before do
    filepath = File.join(File.dirname(__FILE__), 'sample.slisp')
    @content = File.open(filepath).read.split("\n").first
    @parsed = Slisp::Parser.new(@content).parse
  end

  # describe 'Integer' do

  #   context 'when a single integer is passed' do
  #     it "should parse the integer" do
  #       Slisp::Parser.new("1").parse.should eq([1])
  #     end
  #   end

  #   context 'when a single string is passed' do
  #     it "should parse the string" do
  #       Slisp::Parser.new("1").parse.should eq(["1"])
  #     end
  #   end

  #   context 'when a single float is passed' do
  #     it "should parse the float" do
  #       Slisp::Parser.new("1.1").parse.should eq([1.1])
  #     end
  #   end

  # end

  describe 'Expression' do

    context 'when an expression is passed' do

      it "should parse the expression" do
        raise @parsed.inspect
      end
    end
  end

end
