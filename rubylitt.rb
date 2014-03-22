require 'rubygems'
require 'sinatra/base'
require 'sinatra/assetpack'
require 'slim'

class Rubylitt < Sinatra::Base
  register Sinatra::AssetPack

  assets do
    serve '/js',  from: 'app/js'
    serve '/css', from: 'app/css'
    serve '/img', from: 'app/img'

    css :cssapp, [
      '/css/*.css'
    ]

    js :jsapp, [
      '/js/*.js'
    ]

    css_compression :simple # :simple | :sass | :yui | :sqwish
    js_compression  :jsmin  # :jsmin | :yui | :closure | :uglify
  end

  get '/' do
    @time = Time.now
    slim :index
  end

  run! if app_file == $0
end
