require 'spec_helper'
require_relative '../liby.rb'

include Utils

describe 'Parser' do

  describe 'Comments' do

    context 'when an entire line has a comment' do

      before do
        @parsed = execute(';This is a test.\n(+ 3 3 3)')
      end

      it "should ignore the line with the comment" do
        expect(@parsed).to eq(9)
      end
    end
  end

  describe 'Arithmetic' do

    context 'when numbers are added' do

      before do
        @parsed = execute('(+ 3 3 3)')
      end

      it "should return the result" do
        expect(@parsed).to eq(9)
      end
    end

    context 'when numbers are subtracted' do

      before do
        @parsed = execute('(- 10 5)')
      end

      it "should return the result" do
        expect(@parsed).to eq(5)
      end
    end

  end

  context 'when numbers are multiplied' do

    before do
      @parsed = execute('(* 3 2 3)')
    end

    it "should return the result" do
      expect(@parsed).to eq(18)
    end
  end

  context 'when numbers are divided' do

    before do
      @parsed = execute('(/ 27 3)')
    end

    it "should return the result" do
      expect(@parsed).to eq(9)
    end
  end

end
