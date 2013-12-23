#--------------------------------------------------------------------------
#  line_info.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 23, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
module OCritic

  class LineInfo
    attr_reader :filename
    attr_reader :text
    attr_reader :index

    def initialize(filename, index, text)
      @filename = filename
      @text     = text
      @index    = index
    end

    def to_s
      @text.to_s
    end

    def length
      @text.length
    end
  end

end