require_relative "../services/parse_file_dependencies.rb"

module FitnessFunctions
  module Functions
    class CrossContextCallsChecker
      def call(file_path, whitelist: [])
        di_imports = Services::ParseFileDependencies.new.call(file_path)

        puts "Checking: '#{file_path}'"
        puts "Dependencies for file: #{di_imports}"

        di_imports.each do |dependency|
          next if dependency.start_with?(*whitelist)

          raise "Invalid dependency '#{dependency}' for '#{file_path}'"
        end
      end
    end
  end
end