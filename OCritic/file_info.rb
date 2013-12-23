#--------------------------------------------------------------------------
#  file_info.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 23, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require_relative 'line_statistic'

module OCritic

  class FileInfo
    attr_reader :filename
    attr_reader :line_stats

    def initialize(filename)
      @filename   = filename.dup
      @line_stats = make_line_stats
    end

    private

    def make_line_stats
      stats = {}

      LineStatistic.all_statistics.each do |klass|

        unless stats[klass.symbol] == nil 
          raise "Conflicting line statistic access symbol :#{klass.symbol} for classes: "\
                "#{klass.name} and #{stats[klass.symbol].class.name}!" 
        end

        stats[klass.symbol] = klass.new
      end

      stats
    end
  end

end