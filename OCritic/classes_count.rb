#--------------------------------------------------------------------------
#  classes_count.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 27, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require_relative 'file_statistic'

module OCritic

  module FileStats
    class ClassesCount < FileStatistic
      def self.pretty_name
        "Objectice-C classes count"
      end

      def self.symbol
        :classes_count
      end

      def process_parser_result(result)
        # Assuming the parser was of ClassesCountGrammarParser class
        @class_names = result.class_names
        @value       = @class_names.count
      end
    end

  end
end