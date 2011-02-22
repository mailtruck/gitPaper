module GitPaper
  VERSION = "0.0.1"
end

$LOAD_PATH.unshift File.join(File.dirname(__FILE__), '..', 'vendor', 'grit', 'lib')
require "pp"
require 'grit'
require 'yaml'
require 'oauth'
require 'gitpaper/rcfile'
require 'gitpaper/oauthclient'
require 'gitpaper/repo'
require 'gitpaper/bookmarks'
