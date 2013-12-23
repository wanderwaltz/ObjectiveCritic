#--------------------------------------------------------------------------
#  lines_count_spec.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 23, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require "../ocritic"

describe OCritic::LineStats::LinesCount do

  before(:each) do
    @stat = OCritic::LineStats::LinesCount.new
  end


  describe '#new' do
    it 'will be initialized with zero lines count' do
      @stat.value.count.should be == 0
      @stat.value.count_total.should be == 0
    end
  end


  describe '#process_line' do
    it 'will increase lines count when passed a non-whitespace line' do
      @stat.process_line('some non-whitespace text')
      @stat.value.count.should be == 1
      @stat.value.count_total.should be == 1
    end


    it 'will increase total lines count when passed a whitespace-only line, '\
       'but count will stay the same' do
      @stat.process_line('         ')

      @stat.value.count.should be == 0
      @stat.value.count_total.should be == 1
    end
  end

end