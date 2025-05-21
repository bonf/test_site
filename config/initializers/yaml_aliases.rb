require "yaml"
require "active_record/railtie"

module ActiveRecord
  class Base
    class << self
      alias_method :original_configurations=, :configurations=

      def configurations=(value)
        if value.is_a?(String)
          self.original_configurations = YAML.safe_load(
            value,
            aliases: true,
            filename: Rails.root.join("config", "database.yml").to_s
          )
        else
          self.original_configurations = value
        end
      end
    end
  end
end
