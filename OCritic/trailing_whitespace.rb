#--------------------------------------------------------------------------
#  trailing_whitespace.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 22, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require_relative 'line_statistic'
require 'ostruct'

module OCritic
  module LineStats

    class TrailingWhitespace < LineStatistic

      def self.pretty_name
        "Lines with trailing whitespace"
      end

      def self.symbol
        :trailing_whitespace
      end

      def initialize
        @count = 0
      end

      def process_line(line)
        text    = line.to_s
        @count += 1 if text.rstrip.length+1 < text.length
      end

      def value
        @count
      end

      def to_s
        @count.to_s
      end
    end

  end
end