# require gemfile
require 'bundler'
# load the gems specified in the gemfile
Bundler.require

# add the entire project to LOAD_PATH
# so sinatra can find all the files
$: << File.expand_path('../', __FILE__)

# require each file found in model, view and controller folders
Dir['./app/**/*.rb'].sort.each { |file| require file }

# configure sinatra
set :root, Dir['./app']
set :public_folder, Proc.new { File.join(root, 'assets') }
# erb = embedded ruly files, and layout => css files
set :erb, :layout => :'layouts/application'