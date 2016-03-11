require "optparse"

module EnsureXcodeHasNoCiSources
  class CLI
    attr_reader :argv

    attr_reader :warn
    attr_reader :silent

    def initialize(argv)
      @argv = argv

      @warn = false
      @silent = false
    end

    def run
      OptionParser.new do |opts|
        opts.on("-w", "--warn", "Exit with 0, even if case insensitive files are found") { @warn = true }
        opts.on("-s", "--silent", "Does not print anything") { @silent = true }
      end.parse!(argv)

      failed = false

      argv.each do |path|
        project = Xcodeproj::Project.open(path)
        ci_sources = EnsureXcodeHasNoCiSources::Test.new(project).case_insensitive_sources
        if ci_sources.size > 0
          failed = true

          unless silent
            puts Rainbow("#{project.path.relative_path_from(Pathname(".").realpath)} has case insensitive sources 💣").red
            ci_sources.each do |source|
              puts "  In Xcode Project: #{source.project_path.basename}"
              puts "    In File System: #{source.file_path.relative_path_from(project.path.parent)}"
            end
          end
        else
          unless silent
            puts Rainbow("#{project.path.relative_path_from(Pathname(".").realpath)} has no case insensitive sources 👍").green
          end          
        end
      end

      if failed
        exit 1 if !warn
      end
    end
  end
end

