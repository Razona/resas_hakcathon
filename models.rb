require 'bundler/setup'
Bundler.require
if development?
  ActiveRecord::Base.establish_connection("sqlite3:db/development.db")
end

class History < ActiveRecord::Base
end

class Face < ActiveRecord::Base
end

class User < ActiveRecord::Base
end