#--------------------------------------------------------------------------
#  subclass_registry.rb
#  ObjectiveCritic
#
#  Created by Egor Chiglintsev on December 27, 2013.
#  Copyright (c) 2013 Egor Chiglintsev. All rights reserved.
#--------------------------------------------------------------------------
module OCritic
  module SubclassRegistry

    def self.included(base)
      base.send :include, InstanceMethods
      base.extend ClassMethods
    end

    module ClassMethods
      def inherited(klass)
        @registered_subclasses ||= []
        @registered_subclasses << klass
      end
    end
  end

  module StatisticRegistry
    def self.included(base)
      base.extend OCritic::SubclassRegistry::ClassMethods
      base.extend ClassMethods
    end

    module ClassMethods
      def all_statistics
        @registered_subclasses ||=[]
      end

      def create_instances
        stats = {}

        all_statistics.each do |klass|
          unless stats[klass.symbol] == nil
            raise "Conflicting statistic access symbol :#{klass.symbol} for classes: "\
                  "#{klass.name} and #{stats[klass.symbol].class.name}!"
          end
          stats[klass.symbol] = klass.new
        end

        stats
      end

    end
  end
end