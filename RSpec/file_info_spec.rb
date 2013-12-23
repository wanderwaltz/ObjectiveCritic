#--------------------------------------------------------------------------
#  file_info_spec.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 23, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require "../ocritic"

describe OCritic::FileInfo do

  describe '#new' do
    it 'should create a new FileInfo object' do
      OCritic::FileInfo.new('name').should be_true
    end


    it 'should store file name' do
      info = OCritic::FileInfo.new('name')
      info.filename.should be == 'name'
    end


    it 'should create empty lines array' do
      info = OCritic::FileInfo.new('name')
      info.all_lines.count.should be == 0
    end


    it 'should populate line_stats hash' do
      info = OCritic::FileInfo.new('name')
      info.line_stats.count.should be == OCritic::LineStatistic.all_statistics.count
    end


    it 'should call #make_line_stats to do so' do
      OCritic::FileInfo.any_instance.should_receive(:make_line_stats).exactly(:once)
      info = OCritic::FileInfo.new('name')
    end
  end


  describe '#make_line_stats' do
    it 'should return a new hash with all line statistics' do

      # #make_line_stats is private, but we make it public just
      # for the purposes of this test.
      info = OCritic::FileInfo.new('name')

      class << info
        public :make_line_stats
      end

      stats = info.make_line_stats
      stats.count.should be == OCritic::LineStatistic.all_statistics.count
    end
  end

end
