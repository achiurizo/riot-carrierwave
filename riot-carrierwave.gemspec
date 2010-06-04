# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run the gemspec command
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{riot-carrierwave}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Arthur Chiu"]
  s.date = %q{2010-06-03}
  s.description = %q{riot macros for carrierwave testing}
  s.email = %q{mr.arthur.chiu@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.md"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.md",
     "Rakefile",
     "VERSION",
     "lib/riot-carrierwave.rb",
     "lib/riot-carrierwave/has_dimensions.rb",
     "lib/riot-carrierwave/has_permission.rb",
     "lib/riot-carrierwave/identical_to.rb",
     "lib/riot-carrierwave/wrappers.rb",
     "test/fixtures/fail.jpg",
     "test/fixtures/test.jpg",
     "test/has_dimensions_test.rb",
     "test/has_permission_test.rb",
     "test/identical_to_test.rb",
     "test/teststrap.rb"
  ]
  s.homepage = %q{http://github.com/achiu/riot-carrierwave}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{riot macros for carrierwave}
  s.test_files = [
    "test/has_dimensions_test.rb",
     "test/has_permission_test.rb",
     "test/identical_to_test.rb",
     "test/teststrap.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<riot>, [">= 0"])
    else
      s.add_dependency(%q<riot>, [">= 0"])
    end
  else
    s.add_dependency(%q<riot>, [">= 0"])
  end
end

