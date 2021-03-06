# Copyright (C) 2015 MongoDB, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module Mongo
  module Options

    # Utility class for various options mapping behaviour.
    #
    # @since 2.0.0
    module Mapper
      extend self

      # Transforms the provided options to a new set of options given the
      # provided mapping.
      #
      # @example Transform the options.
      #   Mapper.transform({ name: 1 }, { :name => :nombre })
      #
      # @param [ Hash ] options The options to transform
      # @param [ Hash ] mappings The key mappings.
      #
      # @return [ Hash ] The transformed options.
      #
      # @since 2.0.0
      def transform(options, mappings)
        options.reduce({}) do |transformed, (key, value)|
          transformed[mappings[key] || key] = value
          transformed
        end
      end

      # Coverts all the keys of the options to strings.
      #
      # @example Convert all option keys to strings.
      #   Mapper.transform({ :name => 1 })
      #
      # @param [ Hash ] options The options to transform.
      #
      # @return [ Hash ] The transformed options.
      #
      # @since 2.0.0
      def transform_keys_to_strings(options)
        options.reduce({}) do |transformed, (key, value)|
          transformed[key.to_s] = value
          transformed
        end
      end

      # Coverts all the symbol values to strings.
      #
      # @example Convert all option symbol values to strings.
      #   Mapper.transform({ :name => 1 })
      #
      # @param [ Hash ] options The options to transform.
      #
      # @return [ Hash ] The transformed options.
      #
      # @since 2.0.0
      def transform_values_to_strings(options)
        options.reduce({}) do |transformed, (key, value)|
          transformed[key] = value.is_a?(Symbol) ? value.to_s : value
          transformed
        end
      end
    end
  end
end
