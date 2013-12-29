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
      processor.should_receive(:process_files).with(files_in).exactly(:once)
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
    it 'should pass the file object to #process_IO' do
      processor = OCritic::Processor.new
      processor.should_receive(:process_IO).with(anything(), kind_of(File)).exactly(:once)
      processor.process_file('examples_line_stats/EmptyClass_9Lines.h')
    end


    it 'should pass the file info object to #process_IO' do
      processor = OCritic::Processor.new
      processor.should_receive(:process_IO).with(kind_of(OCritic::FileInfo),
                                                 kind_of(File)).exactly(:once)
      processor.process_file('examples_line_stats/EmptyClass_9Lines.h')
    end


    it 'should create the file info object with the corresponding file name' do
      processor = OCritic::Processor.new
      processor.stub(:process_IO) do |file_info, io|
        file_info.filename.should be == 'examples_line_stats/EmptyClass_9Lines.h'
      end
      processor.process_file('examples_line_stats/EmptyClass_9Lines.h')
    end
  end


  context 'empty processor' do
    before(:each) do
      @processor = OCritic::Processor.new
    end


    describe '#process_IO' do
      it 'should pass the IO object to #process_lines and #process_file_stats' do
        @processor.should_receive(:process_lines).with(:info, :io).exactly(:once)
        @processor.should_receive(:process_file_stats).with(:info, :io).exactly(:once)
        @processor.process_IO(:info, :io)
      end
    end


    describe '#process_lines' do
      it 'should call #process_line for each line of the file' do
        @processor.should_receive(:process_line).with(:info,
                                                      kind_of(Fixnum), #line number
                                                      kind_of(String)).exactly(3).times
        @processor.process_lines(:info, "line 1
                                         line 2
                                         line 3")
      end
    end

    describe '#process_line' do
      it 'should store lines in the file info object' do
        file_info = OCritic::FileInfo.new('name')
        @processor.process_line(file_info, 1, 'line')

        file_info.all_lines.count.should be == 1

        line = file_info.all_lines[0]

        line.text.     should be == 'line'
        line.filename. should be == 'name'
        line.index.    should be == 1
      end
    end
  end

end