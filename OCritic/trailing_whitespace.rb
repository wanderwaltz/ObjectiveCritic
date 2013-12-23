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

      attr_reader :lines

      def self.pretty_name
        "Lines with trailing whitespace"
      end

      def self.symbol
        :trailing_whitespace
      end

      def initialize
        @lines = []
      end

      def process_line(line)
        text = line.to_s
        @lines << line if text.rstrip.length+1 < text.length
      end

      def value
        @lines.count
      end
    end

  end
end