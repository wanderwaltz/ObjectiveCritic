#--------------------------------------------------------------------------
#  line_length.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 23, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require_relative 'line_statistic'

module OCritic
  module LineStats

    class LineLength < LineStatistic

      attr_reader :long_lines

      def self.pretty_name
        "Max line length"
      end

      def self.symbol
        :line_length
      end

      def initialize
        @max_length = 0
        @long_lines = []
      end

      def process_line(line)
        text = line.to_s
        @max_length  = [@max_length, text.length].max
        @long_lines << line unless text.length < length_threshold
      end

      def length_threshold
        100 # TODO: read this from a config
      end

      def value
        @max_length
      end    

      def to_s
        text = "#{@max_length}"

        if @long_lines.count > 0 
          text + " (#{@long_lines.size} above the threshold of #{length_threshold})"
        else
          text
        end
      end
    end

  end
end