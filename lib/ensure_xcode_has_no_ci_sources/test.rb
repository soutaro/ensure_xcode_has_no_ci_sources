module EnsureXcodeHasNoCiSources
  CaseInsensitiveSource = Struct.new(:file_path, :project_path)

  class Test
    attr_reader :project
    attr_reader :children

    def initialize(project)
      @project = project

      @children = {}
    end

    def case_insensitive_file_path(path)
      child_paths = @children[path.parent.to_s]

      unless child_paths
        child_paths = path.parent.children
        children[path.parent.to_s] = child_paths
      end

      child_paths.find {|child| child.basename.to_s.upcase == path.basename.to_s.upcase && child.basename != path.basename }
    end

    def case_insensitive_sources
      sources = []

      @project.files.each do |source|
        source_path = source.real_path        
        if source_path.file? || source_path.directory?
          case_insensitive_file_path(source_path).try do |file_path|
            sources << CaseInsensitiveSource.new(file_path, source_path)
          end
        end
      end

      sources
    end
  end
end
