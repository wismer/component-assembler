module ComponentAssembler
  class Assembler < Thor
    include ComponentBuilder

    desc "composes the main js file by adding `require`", 'require add'
    method_options :alias => "-b"
    def browserify
      Dir["./*.js"].each do |file|
        data = File.read(file)
      end
    end

    desc "create a React component with all the bells and whistles", "component bldr"
    method_options :alias => 'a'
    def all(component="", elem="", destination="")
      component = component.split("_").map(&:capitalize).join
      AssemblerDirectory.new(destination, component) << compose_file(component, elem)
    end

    desc "creates js file of [COMPONENT]", "shows react component"
    method_options :alias => :g
    def generate(component="", elem="")
      component = component.split("_").map(&:capitalize).join
      file = File.new("#{component.downcase}.js", 'w+')
      file <<
        "var #{component} = React.createClass({\n"\
        "  render: function() {\n"\
        "    return (\n"\
        "      <#{elem}></#{elem}>\n"\
        "    )\n"\
        "  }\n"\
        "})\n"\
        "\n"\
        "module.exports = #{component};"
      file.close
    end
  end
end
