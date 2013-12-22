#--------------------------------------------------------------------------
#  line_statistic.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 22, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require_relative 'line_statistic'

module OCritic
  module LineStats

    class LinesCountExcludingWhitespace < LineStatistic

      def self.pretty_name
        "Lines count (excluding whitespace)"
      end

      def self.symbol
        :lines_count_exc_whitespace
      end

      def initialize
        @count = 0
      end

      def process_line(string)
        @count += 1 unless string.strip.length == 0
      end

      def value
        @count
      end
    end

  end
end