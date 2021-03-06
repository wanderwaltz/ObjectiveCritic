#--------------------------------------------------------------------------
#  line_statistic.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 22, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require_relative 'base_statistic'
require_relative 'subclass_registry'

module OCritic

  # Line statistics are used to process files line by line
  # and do not utilize any context beyond the line itself.
  class LineStatistic < BaseStatistic
    include StatisticRegistry

    def process_line(string)
      # to be overridden in subclasses
    end

  end

end