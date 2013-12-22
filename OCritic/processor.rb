#--------------------------------------------------------------------------
#  processor.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 22, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require_relative 'line_statistic'

module OCritic

  class Processor

    def initialize(*filenames)
      @filenames       = filenames
      @file_statistics = {}
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

      stats = make_empty_stats     

      @file_statistics[filename] = stats

      File.open(filename, "r") do |file|
        process_IO(stats, file)
      end    
    end


    def make_empty_stats
      stats = {}

      LineStatistic.all_statistics.each do |klass|
        stats[klass.symbol] = klass.new
      end

      stats
    end


    def process_IO(stats, io)
      io.each_line do |string|
        process_line(stats, string)
      end
    end


    def process_line(stats, string)
      stats.each do |key, statistic|
        statistic.process_line(string)
      end
    end


    def print_stats
      @file_statistics.each do |filename, stats|

        puts filename

        stats.each do |key, statistic|
          puts "  #{statistic.class.pretty_name}: #{statistic.value}"
        end
      
        puts ''
      end   
    end

  end

end