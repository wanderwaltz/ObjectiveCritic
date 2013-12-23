#--------------------------------------------------------------------------
#  processor.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 22, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require_relative 'file_info'
require_relative 'line_info'

module OCritic

  class Processor

    def initialize(*filenames)
      @filenames = filenames
      @file_info = {}
    end


    def run
      process_files(@filenames)
      print_stats
    end


    def process_files(filenames)
      filenames.each do |file|
        process_file(file)
      end
    end


    def process_file(filename)

      info = FileInfo.new(filename)

      @file_info[filename] = info

      File.open(filename, "r") do |file|
        process_IO(info, file)
      end
    end


    def process_IO(file_info, io)
      process_lines(file_info, io)
    end


    def process_lines(file_info, io)
      index = 0
      io.each_line do |string|
        index += 1
        process_line(file_info, index, string)
      end
    end


    def process_line(file_info, index, string)
      file_info.all_lines << line_info = LineInfo.new(file_info.filename, index, string)

      file_info.line_stats.each do |key, statistic|
        statistic.process_line(line_info)
      end
    end


    def print_stats
      @file_info.each do |filename, info|

        puts filename

        info.line_stats.each do |key, statistic|
          puts "  #{statistic.class.pretty_name}: #{statistic.to_s}"
        end

        puts ''
      end
    end

  end

end