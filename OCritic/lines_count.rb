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

    class LinesCount < LineStatistic

      def self.pretty_name
        "Lines count"
      end

      def self.symbol
        :lines_count
      end

      def initialize
        @count = 0
      end

      def process_line(string)
        @count += 1
      end

      def value
        @count
      end
    end

  end
end