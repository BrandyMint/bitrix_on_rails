# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{bitrix_on_rails}
  s.version = "0.2.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Danil Pismenny"]
  s.date = %q{2011-08-30}
  s.description = %q{Использование инфоблоков 1С-Битрикс в Ruby On Rails проектах}
  s.email = %q{danil@orionet.ru}
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "Guardfile",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "app/models/iblock.rb",
    "app/models/iblock_element.rb",
    "app/models/iblock_element_property.rb",
    "app/models/iblock_field.rb",
    "app/models/iblock_group.rb",
    "app/models/iblock_property.rb",
    "app/models/iblock_property_enum.rb",
    "app/models/iblock_section.rb",
    "app/models/iblock_section_element.rb",
    "app/models/iblock_type.rb",
    "bitrix_on_rails.gemspec",
    "init.rb",
    "lib/bitrix_on_rails.rb",
    "lib/bitrix_on_rails/active_record.rb",
    "lib/bitrix_on_rails/configuration.rb",
    "lib/bitrix_on_rails/engine.rb",
    "lib/bitrix_on_rails/iblock_element.rb",
    "lib/bitrix_on_rails/iblock_element_prop_m.rb",
    "lib/bitrix_on_rails/iblock_element_prop_s.rb",
    "lib/php_serialize_encoded.rb",
    "test/dump.sql",
    "test/factories.rb",
    "test/get_dump.sh",
    "test/helper.rb",
    "test/schema.rb",
    "test/test_active_record.rb",
    "test/test_bitrix_on_rails.rb",
    "test/test_iblock_element.rb",
    "test/test_iblock_element_prop_s.rb",
    "test/test_php_serialize_encoded.rb"
  ]
  s.homepage = %q{http://github.com/dapi/bitrix_on_rails}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.6.2}
  s.summary = %q{Работа с инфоблоками 1С-Битрикс}

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.0"])
      s.add_runtime_dependency(%q<php_serialize>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<ruby-debug19>, [">= 0"])
      s.add_development_dependency(%q<factory_girl>, [">= 0"])
      s.add_development_dependency(%q<test-unit>, [">= 0"])
      s.add_development_dependency(%q<rb-fsevent>, [">= 0"])
      s.add_development_dependency(%q<growl>, [">= 0"])
      s.add_development_dependency(%q<guard-test>, [">= 0"])
      s.add_development_dependency(%q<rr>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.0"])
      s.add_dependency(%q<php_serialize>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<ruby-debug19>, [">= 0"])
      s.add_dependency(%q<factory_girl>, [">= 0"])
      s.add_dependency(%q<test-unit>, [">= 0"])
      s.add_dependency(%q<rb-fsevent>, [">= 0"])
      s.add_dependency(%q<growl>, [">= 0"])
      s.add_dependency(%q<guard-test>, [">= 0"])
      s.add_dependency(%q<rr>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.0"])
    s.add_dependency(%q<php_serialize>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.4"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<ruby-debug19>, [">= 0"])
    s.add_dependency(%q<factory_girl>, [">= 0"])
    s.add_dependency(%q<test-unit>, [">= 0"])
    s.add_dependency(%q<rb-fsevent>, [">= 0"])
    s.add_dependency(%q<growl>, [">= 0"])
    s.add_dependency(%q<guard-test>, [">= 0"])
    s.add_dependency(%q<rr>, [">= 0"])
  end
end

