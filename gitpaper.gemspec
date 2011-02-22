## This is the rakegem gemspec template. Make sure you read and understand
## all of the comments. Some sections require modification, and others can
## be deleted if you don't need them. Once you understand the contents of
## this file, feel free to delete any comments that begin with two hash marks.
## You can find comprehensive Gem::Specification documentation, at
## http://docs.rubygems.org/read/chapter/20
Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '1.3.5'

  ## Leave these as is they will be modified for you by the rake gemspec task.
  ## If your rubyforge_project name is different, then edit it and comment out
  ## the sub! line in the Rakefile
  s.name              = 'gitpaper'
  s.version           = '0.0.1'
  s.date              = '2011-02-22'
  s.rubyforge_project = 'gitpaper'

  ## Make sure your summary is short. The description may be as long
  ## as you like.
  s.summary     = "Instapaper bookmark backup using git."
  s.description = "Instapaper bookmark backup using git."

  ## List the primary authors. If there are a bunch of authors, it's probably
  ## better to set the email to an email list or something. If you don't have
  ## a custom homepage, consider using your GitHub URL or the like.
  s.authors  = ["Curtis Henson"]
  s.email    = 'curtishenson@gmail.com'
  s.homepage = 'http://curtishenson.com'

  ## This gets added to the $LOAD_PATH so that 'lib/NAME.rb' can be required as
  ## require 'NAME.rb' or'/lib/NAME/file.rb' can be as require 'NAME/file.rb'
  s.require_paths = %w[lib]

  ## If your gem includes any executables, list them here.
  s.executables = ["gitpaper"]
  s.default_executable = 'gitpaper'

  ## List your runtime dependencies here. Runtime dependencies are those
  ## that are needed for an end user to actually USE your code.
  s.add_dependency('oauth', ["~> 0.4.4"])
  s.add_dependency('yajl-ruby', ["~> 0.8.1"])

  ## Leave this section as-is. It will be automatically generated from the
  ## contents of your Git repository via the gemspec task. DO NOT REMOVE
  ## THE MANIFEST COMMENTS, they are used as delimiters by the task.
  # = MANIFEST =
  s.files = %w[
    Gemfile
    Gemfile.lock
    LICENSE
    bin/gitpaper
    gitpaper.gemspec
    lib/gitpaper.rb
    lib/gitpaper/bookmarks.rb
    lib/gitpaper/oauthclient.rb
    lib/gitpaper/rcfile.rb
    lib/gitpaper/repo.rb
    vendor/grit/API.txt
    vendor/grit/History.txt
    vendor/grit/LICENSE
    vendor/grit/PURE_TODO
    vendor/grit/README.md
    vendor/grit/Rakefile
    vendor/grit/benchmarks.rb
    vendor/grit/benchmarks.txt
    vendor/grit/examples/ex_add_commit.rb
    vendor/grit/examples/ex_index.rb
    vendor/grit/grit.gemspec
    vendor/grit/lib/grit.rb
    vendor/grit/lib/grit/actor.rb
    vendor/grit/lib/grit/blame.rb
    vendor/grit/lib/grit/blob.rb
    vendor/grit/lib/grit/commit.rb
    vendor/grit/lib/grit/commit_stats.rb
    vendor/grit/lib/grit/config.rb
    vendor/grit/lib/grit/diff.rb
    vendor/grit/lib/grit/errors.rb
    vendor/grit/lib/grit/git-ruby.rb
    vendor/grit/lib/grit/git-ruby/commit_db.rb
    vendor/grit/lib/grit/git-ruby/file_index.rb
    vendor/grit/lib/grit/git-ruby/git_object.rb
    vendor/grit/lib/grit/git-ruby/internal/file_window.rb
    vendor/grit/lib/grit/git-ruby/internal/loose.rb
    vendor/grit/lib/grit/git-ruby/internal/pack.rb
    vendor/grit/lib/grit/git-ruby/internal/raw_object.rb
    vendor/grit/lib/grit/git-ruby/object.rb
    vendor/grit/lib/grit/git-ruby/repository.rb
    vendor/grit/lib/grit/git.rb
    vendor/grit/lib/grit/index.rb
    vendor/grit/lib/grit/jruby.rb
    vendor/grit/lib/grit/lazy.rb
    vendor/grit/lib/grit/merge.rb
    vendor/grit/lib/grit/process.rb
    vendor/grit/lib/grit/ref.rb
    vendor/grit/lib/grit/repo.rb
    vendor/grit/lib/grit/ruby1.9.rb
    vendor/grit/lib/grit/status.rb
    vendor/grit/lib/grit/submodule.rb
    vendor/grit/lib/grit/tag.rb
    vendor/grit/lib/grit/tree.rb
  ]
  # = MANIFEST =

  ## Test files will be grabbed from the file list. Make sure the path glob
  ## matches what you actually use.
  s.test_files = s.files.select { |path| path =~ /^test\/test_.*\.rb/ }
end