module ComponentAssembler
  class AssemblerDirectory
    def initialize(destination, component)
      @destination = destination
      @component   = component
    end

    def <<(string)
      FileUtils.mkdir_p(@destination) if path_missing?
      File.open("#{@destination}/#{@component.downcase}.js", "a+") { |file| file << string }
    end

    private

    def path_missing?
      !Dir.exist? @destination
    end
  end
end
