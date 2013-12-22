#--------------------------------------------------------------------------
#  base_statistic.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 22, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------

module OCritic

  class BaseStatistic
    class << self
      
      # return class name by default, override if needed
      def pretty_name
        self.name.split(':').last
      end

      # symbol which can be used to access the statistic in procerssor;
      def symbol
        pretty_name.to_sym
      end

    end
  end
end