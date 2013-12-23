#--------------------------------------------------------------------------
#  line_length_spec.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 23, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require "../ocritic"

describe OCritic::LineStats::LineLength do

  before(:each) do
    @stat = OCritic::LineStats::LineLength.new
  end


  describe '#new' do
    it 'will be initialized with zero max line length and zero lines count' do
      @stat.value.should be == 0
      @stat.long_lines.count.should be == 0
    end
  end


  describe '#process_line' do
    it 'will increase max line length when passed longer lines' do
      @stat.process_line('line')
      @stat.value.should be == 'line'.length

      @stat.process_line('longer line')
      @stat.value.should be == 'longer line'.length
    end


    it 'will store lines with length exceeding threshold' do
      @stat.stub(:length_threshold) { 6 }
      @stat.process_line('short')
      @stat.process_line('too long')

      @stat.value.should be == 'too long'.length
      @stat.long_lines.should be == ['too long']
    end
  end

end