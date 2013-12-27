#--------------------------------------------------------------------------
#  file_statistic.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 27, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require_relative 'base_statistic'
require_relative 'subclass_registry'

module OCritic

  # File statistics process file as a whole.
  class FileStatistic < BaseStatistic
    include StatisticRegistry
  end

end