Gem::Specification.new do |s|
  s.name        = 'component-assembler'
  s.version     = '0.0.0'
  s.date        = '2015-04-21'
  s.summary     = "Simple tool for generating React.js component files"
  s.description = "ReactJS component builder"
  s.authors     = ["Matt Long"]
  s.email       = 'matthewhl@gmail.com'
  s.files       = [
    "lib/component_assembler.rb",
    "lib/component_assembler/component_builder.rb",
    "lib/component_assembler/assembler_cli.rb",
    "bin/component-assemble"
  ]
  s.homepage    = 'https://wismer.github.io'
  s.license     = 'MIT'
  s.executables << 'component-assemble'
end
