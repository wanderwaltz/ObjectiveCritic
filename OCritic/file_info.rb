#--------------------------------------------------------------------------
#  file_info.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 23, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require_relative 'line_statistic'
require_relative 'file_statistic'

module OCritic

  class FileInfo
    attr_reader :filename
    attr_reader :line_stats
    attr_reader :file_stats
    attr_reader :all_lines

    def initialize(filename)
      @filename   = filename.dup
      @line_stats = LineStatistic.create_instances
      @file_stats = FileStatistic.create_instances
      @all_lines  = []
    end

  end

end