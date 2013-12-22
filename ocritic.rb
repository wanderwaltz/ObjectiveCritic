#--------------------------------------------------------------------------
#  ocritic.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 22, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
require_relative 'OCritic/processor'

# line statistics
require_relative 'OCritic/lines_count'                # total number of lines in a file
require_relative 'OCritic/lines_count_exc_whitespace' # number of lines excluding whitespace-only lines