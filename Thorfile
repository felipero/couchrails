# enconding: utf-8
require File.join(File.dirname(__FILE__), "lib", "couchrails", "support", "version")
require 'rubygems'
require 'bundler'
require 'thor/rake_compat'
require 'spec/rake/spectask'
begin
  require 'rdoc/task'
rescue LoadError
end

Bundler.setup
Bundler.require(:default, :development)

GEM_NAME = 'couchrails'
EXTRA_RDOC_FILES = ["README", "LICENSE", "CHANGELOG.rdoc", "VERSION", "Thorfile"]

class Default < Thor
  include Thor::RakeCompat

  default_task :spec

  Spec::Rake::SpecTask.new(:spec) do |t|
    t.libs << 'lib'
    t.spec_opts = ['--options', "spec/spec.opts"]
    t.spec_files = FileList['spec/**/*_spec.rb']
  end

  Spec::Rake::SpecTask.new(:rcov) do |t|
    t.libs << 'lib'
    t.spec_opts = ['--options', "spec/spec.opts"]
    t.spec_files = FileList['spec/**/*_spec.rb']
    t.rcov = true
    t.rcov_dir = "rcov"
  end

  if defined?(RDoc)
    RDoc::Task.new do |rdoc|
      rdoc.main     = "README"
      rdoc.rdoc_dir = "rdoc"
      rdoc.title    = GEM_NAME
      rdoc.rdoc_files.include(*EXTRA_RDOC_FILES)
      rdoc.rdoc_files.include('lib/**/*.rb')
      rdoc.options << '--line-numbers' << '--inline-source'
    end
  end

  begin
    require 'jeweler'
    Jeweler::Tasks.new do |g|
      g.name = GEM_NAME
      g.version = CouchRails::VERSION
      g.summary = "A Object Document Mapper for Rails 3 that implements ActiveModel"
      g.description = "A Object Document Mapper for Rails 3 that implements ActiveModel. It is based on CouchRest"
      g.email = "couchrails@fratech.net"
      g.homepage = "http://github.com/felipero/couchrails"
      g.authors = ["Felipe Rodrigues"]
      g.test_files.include 'spec/**/*'
      g.has_rdoc = false
      g.extra_rdoc_files = EXTRA_RDOC_FILES
      g.require_path = 'lib'
      g.files = g.extra_rdoc_files + Dir.glob("{bin,lib}/**/*")
#      g.bindir = "bin"
#      g.executables = %w( couchrest )
#      g.test_files.exclude 'spec/sandbox/**/*'
    end

    Jeweler::GemcutterTasks.new
  rescue LoadError
    puts "Jeweler, or one of its dependencies, is not available. Install it with: gem install jeweler"
  end
end