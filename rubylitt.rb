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

    css :cssapp, '/css/app.css', [
      '/css/normalize.css',
      '/css/foundation.css'
    ]

    js :foundation, [
      '/js/foundation/foundation.js',
      '/js/foundation/foundation.*.js'
    ]

    js :jsapp, [
      '/js/vendor/*.js',
      '/js/app.js'
    ]

    css_compression :sass  # :simple | :sass | :yui | :sqwish
    js_compression  :jsmin # :jsmin | :yui | :closure | :uglify
  end

  get '/' do
    slim :index
  end

  run! if app_file == $0
end
