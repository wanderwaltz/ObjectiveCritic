#--------------------------------------------------------------------------
#  processor_spec.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 22, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require "../ocritic"

describe OCritic::Processor do

  describe '#new' do
    it 'can be initialized with a list of file names' do

      expect(OCritic::Processor.new('file1', 'file2', 'file3')).to be_true
    end
  end

  describe '#run' do
    it 'should call #process_files when #run is invoked' do

      files_in  = ['file1', 'file2', 'file3']
      processor =  OCritic::Processor.new(*files_in)
      processor.should_receive(:process_files).with(files_in).at_most(:once)
      processor.run
    end
  end

  describe '#process_files' do
    it 'should call #process_file for each of the files' do

      files_in  = ['file1', 'file2', 'file3', 'some_other_filename']
      processor = OCritic::Processor.new(*files_in)
      files_out = []

      processor.stub(:process_file) do |filename| 
        files_out << filename
      end

      processor.run

      expect(files_in == files_out).to be_true
    end
  end

  describe '#process_file' do
    it 'should pass the file with the given name to #process_IO' do

      processor = OCritic::Processor.new('EmptyClass_9Lines.h')
      processor.should_receive(:process_IO).with(anything(), kind_of(File)).at_most(:once)
      processor.stub(:print_stats) # we don't care about the stats, so stub this method out
      processor.run
    end
  end
end