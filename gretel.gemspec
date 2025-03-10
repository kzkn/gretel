require_relative 'lib/gretel/version'

Gem::Specification.new do |gem|
  gem.name          = "gretel"
  gem.version       = Gretel::VERSION
  gem.authors       = ["Lasse Bunk", "Kazuki Nishikawa"]
  gem.email         = ["kzkn@users.noreply.github.com"]
  gem.description   = %q{Gretel is a Ruby on Rails plugin that makes it easy yet flexible to create breadcrumbs.}
  gem.summary       = %q{Flexible Ruby on Rails breadcrumbs plugin.}
  gem.homepage      = "https://github.com/kzkn/gretel"
  gem.license       = "MIT"

  gem.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  gem.require_paths = ["lib"]

  gem.metadata = {
    "changelog_uri" => "https://github.com/kzkn/gretel/blob/main/CHANGELOG.md",
  }

  gem.add_dependency "railties", ">= 6.1"
  gem.add_dependency "actionview", ">= 6.1"
end
