require 'spec_helper'
require_relative '../liby.rb'

include Utils

describe 'Parser' do

  describe 'Arithmetic' do

    before do
      @parsed = execute('(+ 3 3 3)')
    end

    context 'when numbers are added' do

      it "should return the result" do
        expect(@parsed).to eq(9)
      end
    end
  end

end
