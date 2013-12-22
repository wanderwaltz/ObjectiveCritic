#!/usr/bin/ruby
# coding: utf-8
#--------------------------------------------------------------------------
#  demo.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 22, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
$: << "./" # Add current directory to the search path

require 'ocritic'

proc = OCritic::Processor.new('RSpec/EmptyClass_10Lines.m')

proc.run