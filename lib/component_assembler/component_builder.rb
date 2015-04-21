module ComponentAssembler
  module ComponentBuilder
    COMPONENTS = {
      arrays: { name: "mixins", obj: "[]" },
      statics: { name: "statics", obj: "{}" },
      string: { name: "displayName" },
      functions: [
        { name: "getInitialState", args: "", body: "\t\treturn {};" },
        { name: "getDefaultProps", args: "", body: "\t\treturn {};" },
        { name: "componentWillMount", args: "" },
        { name: "componentDidMount", args: "" },
        { name: "componentWillReceiveProps", args: "nextProp" },
        { name: "shouldComponentUpdate", args: "nextProp, nextState" },
        { name: "componentWillUpdate", args: "prevProps, prevState" },
        { name: "componentDidUpdate", args: "prevProps, prevState" },
        { name: "componentWillUnmount", args: "" },
        { name: "render", args: "", body: "\t\treturn;" }
      ]
    }

    def write_other(name: name, obj: obj)
      "\t#{name}: #{obj},\n"
    end

    def write_functions(functions)
      functions.map do |name: name, args: args, body: body|
        "\t#{name}: function(#{args}) {\n#{body}\n\t}"
      end.join(",\n\n")
    end

    def compose_file(component, elem, body="var ")
      body = "\/\/ require #{component.downcase}\n\n" << body
      body << "#{component} = React.createClass({\n"

      COMPONENTS.each do |component_type, value|
        if component_type == :functions
          body << write_functions(value)
        elsif component_type == :string
          body << "\t#{value[:name]}: '#{component}',\n"
        else
          body << write_other(value)
        end
      end

      return body << "\n})\n\nmodule.exports = #{component};"
    end
  end
end
