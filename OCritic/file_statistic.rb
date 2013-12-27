#--------------------------------------------------------------------------
#  file_statistic.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 27, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require_relative 'base_statistic'
require_relative 'subclass_registry'

require 'polyglot'
require 'treetop'

module OCritic

  # File statistics process file as a whole.
  class FileStatistic < BaseStatistic
    include StatisticRegistry

    @parser = nil

    # Processes the file as a single IO object
    def process_file(file_info, io)
      io.seek(0)
      process_string(file_info, io.read(nil))
    end

    def process_string(file_info, string)

      parser = self.class.parser

      if nodes = parser.parse(string)
        puts "#{self.class.pretty_name} parsed '#{file_info.filename}' successfully"
        puts nodes.to_s
      else
        puts "#{self.class.pretty_name} failed to parse file '#{file_info.filename}'"
        puts parser.failure_reason
        puts parser.failure_line
        puts parser.failure_column
      end
    end

    class << self
      def treetop_filename
        "#{self.name.split(':').last}Parser"
      end

      def parser
        if @parser == nil
          Treetop.load "#{File.dirname(__FILE__)}/#{treetop_filename}.treetop"
          @parser = Object.const_get(treetop_filename+'Parser').new
        end

        @parser
      end
    end
  end

end