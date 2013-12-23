#--------------------------------------------------------------------------
#  trailing_whitespace.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 23, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require "../ocritic"

describe OCritic::LineStats::TrailingWhitespace do

  before(:each) do
    @stat = OCritic::LineStats::TrailingWhitespace.new
  end


  describe '#new' do
    it 'will be initialized with zero lines count' do
      @stat.value.should be == 0
    end
  end


  describe '#process_line' do
    it 'will not increase lines count for lines without trailing whitespace' do
      @stat.process_line('no trailing whitespace')
      @stat.value.should be == 0
    end


    it 'will not increase count for lines with leading whitespace' do
      @stat.process_line('         leading whitespace')
      @stat.value.should be == 0
    end


    it 'will increase count for lines with trailing whitespace' do
      @stat.process_line('trailing whitespace         ')
      @stat.value.should be == 1
    end  


    it 'will increase count for whitespace-only lines' do
      @stat.process_line('         ')
      @stat.value.should be == 1
    end
  end

end