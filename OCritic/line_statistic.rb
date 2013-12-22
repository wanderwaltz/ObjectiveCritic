#--------------------------------------------------------------------------
#  line_statistic.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 22, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require_relative 'base_statistic'

module OCritic

  class LineStatistic < BaseStatistic

    def process_line(string)
    end

    def value
    end

    def to_s
      value.to_s
    end

    @line_statistics = []

    class << self
      def all_statistics
        @line_statistics
      end

      def inherited(klass)
        @line_statistics << klass
      end
    end

  end

end