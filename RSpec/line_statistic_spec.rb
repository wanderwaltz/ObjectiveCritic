#--------------------------------------------------------------------------
#  line_statistic_spec.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 23, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require "../ocritic"

describe OCritic::LineStatistic do

  describe '#value' do
    it 'should always have nil value since it is a base class without any functionality' do
      OCritic::LineStatistic.new.value.should be == nil
    end
  end

  describe '#all_statistics' do
    it 'should include all subsclasses of LineStatistic' do
      class NewSubclass < OCritic::LineStatistic
      end

      OCritic::LineStatistic.all_statistics.include?(NewSubclass).should be_true
    end

    it 'should respond to #each' do
      OCritic::LineStatistic.all_statistics.respond_to?(:each).should be_true
    end 
  end


end