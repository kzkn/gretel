require 'gretel/railtie'

module Gretel
  module Crumbs
    class << self
      include Resettable

      # Returns a hash of all stored crumb blocks.
      def crumbs
        @crumbs ||= {}
      end

      # Returns true if a crumb with the given key has been set.
      def crumb_defined?(key)
        crumbs.has_key?(key)
      end

      # Loads the breadcrumb configuration files.
      def load_breadcrumbs
        builder = Builder.new

        loaded_file_mtimes.clear
        breadcrumb_files.each do |file|
          builder.instance_eval open(file).read, file
          loaded_file_mtimes << File.mtime(file)
        end

        @crumbs = builder.crumbs
        @loaded = true
      end

      # Reloads the breadcrumb configuration files if they have changed.
      def reload_if_needed
        load_breadcrumbs if reload?
      end

      # Returns true if a breadcrumbs reload is needed based on configuration file changes.
      def reload?
        return true unless loaded?
        return false unless Gretel.reload_environments.include?(Rails.env)

        loaded_file_mtimes != breadcrumb_files.map { |file| File.mtime(file) }
      end

      # Returns true if the breadcrumb configuration files have been loaded.
      def loaded?
        !!@loaded
      end

      # List of breadcrumb configuration files.
      def breadcrumb_files
        Dir[*Gretel.breadcrumb_paths]
      end

      def breadcrumb_routes
        named_routes = {}

        Rails.application.routes.named_routes.each do |name, route|
          path = route.path.spec.to_s.gsub(/\(\.:format\)/, '')
          next if path.blank? || path.start_with?('/rails')

          named_routes[path] = {
            name: name,
            route: route
          }
        end

        named_routes.map do |path, named_route|
          current_name = named_route[:name]

          parent_path = path.split('/')
          parent_path.pop
          parent_path[-1] = ':id' if parent_path.last&.match?(/:.+_id/)
          parent_name = named_routes.dig(parent_path.join('/'), :name)

          required_parts = named_route[:route].required_parts.map do |part|
            if part == :id
              'current'
            else
              part.to_s.gsub(/_id/, '')
            end
          end.join(', ')

          if required_parts.present?
            <<~RUBY
              crumb :#{current_name} do |#{required_parts}|
                link current., #{current_name}_path(#{required_parts})
                parent :#{parent_name}, parent
              end
            RUBY
          else
            <<~RUBY
              crumb :#{current_name} do
                link I18n.t("breadcrumb.#{current_name}"), #{current_name}_path
                parent :#{parent_name}
              end
            RUBY
          end
        end.join("\n")
      end

    private

      def loaded_file_mtimes
        @loaded_file_mtimes ||= []
      end

      class Builder
        attr_reader :crumbs

        def initialize
          @crumbs = {}
        end

        # Stores the supplied block for later use.
        def crumb(key, &block)
          crumbs[key] = block
        end

        def build_by_route(route)
          crumb route.name.to_sym do ||

          end
        end

        # Returns a hash of all stored crumb blocks.
        def crumbs
          @crumbs ||= {}
        end

        # Returns true if a crumb with the given key has been set.
        def crumb_defined?(key)
          crumbs.has_key?(key)
        end
      end
    end
  end
end
