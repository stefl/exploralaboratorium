class Explora < Padrino::Application
  register Padrino::Rendering
  register Padrino::Mailer
  register Padrino::Helpers
  register Padrino::Sprockets
  register Padrino::Cache

  sprockets :minify => (Padrino.env == :production)

  #enable :sessions

  set :cache, Padrino::Cache::Store::Memcache.new(::Dalli::Client.new(ENV["MEMCACHE_SERVERS"] || '127.0.0.1:11211', :exception_retry_limit => 1))
  
  enable :caching if Padrino.env == :production

  set :google_analytics, "UA-34825962-1"
  set :typekit, "rvb1ljc"
  set :title, "The Exploralaboratorium"
  set :base_host, "exploralaboratorium.com"
  set :description, "The Comic Relief Exploralaboratorium"
end