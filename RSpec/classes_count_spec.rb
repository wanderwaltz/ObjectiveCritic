#--------------------------------------------------------------------------
#  classes_count_spec.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 29, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require "../ocritic"

describe OCritic::FileStats::ClassesCount do
  before(:each) do
    @stat = OCritic::FileStats::ClassesCount.new
  end

  describe '#process_file' do
    it 'should properly count class interfaces for cc_empty_single sample' do
      process_file('cc_empty_single.h')
      @stat.value.should be == 1
      @stat.class_names.should be == ['EmptyClass_Single']
    end

    it 'should properly count class interfaces for cc_empty_two sample' do
      process_file('cc_empty_two.h')
      @stat.value.should be == 2
      @stat.class_names.should be == ['EmptyClass_First', 'EmptyClass_Second']
    end

    it 'should properly count class interfaces for cc_empty_three sample' do
      process_file('cc_empty_three.h')
      @stat.value.should be == 3
      @stat.class_names.should be == ['EmptyClass_First','SecondEmptyClass','ThirdClass_AlsoEmpty']
    end
  end

  def process_file(filename)
    file = File.open('examples_classes_count/' + filename, 'r')
    @stat.process_file(:info, file)
  end
end