#--------------------------------------------------------------------------
#  lines_count.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 22, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require_relative 'line_statistic'
require 'ostruct'

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
        @value             = OpenStruct.new
        @value.count       = 0
        @value.count_total = 0
      end

      def process_line(line)
        @value.count_total += 1
        @value.count       += 1 unless line.to_s.strip.length == 0
      end

      attr_reader :value

      def to_s
        "#{@value.count} (#{@value.count_total} if including whitespace-only lines)"
      end
    end

  end
end