#--------------------------------------------------------------------------
#  line_info_spec.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 23, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require "../ocritic"

describe OCritic::LineInfo do
  
  describe '#new' do
    it 'should create a new LineInfo object' do
      OCritic::LineInfo.new(:file, 1, :text).should be_true
    end

    it 'should store values passed to it as arguments' do
      line = OCritic::LineInfo.new(:file, 1, :text)

      line.filename. should be == :file
      line.text.     should be == :text
      line.index.    should be == 1
    end
  end


  describe '#length' do
    it 'should be equal to text.length' do
      line = OCritic::LineInfo.new(:file, 1, 'some text')

      line.length.should be == 'some text'.length
    end
  end


  describe '#to_s' do
    it 'should return @text.to_s' do
      line = OCritic::LineInfo.new(:file, 1, :text)
      line.to_s.should be == line.text.to_s
    end
  end
end
