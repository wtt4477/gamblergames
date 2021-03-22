require "dm-core"
require "dm-migrations"

configure :development do

 DataMapper.setup(:default, “sqlite3://#{Dir.pwd}/development.db”)
end

configure :production do
	DataMapper.setup(:default, ENV[‘DATABASE_URL’])
end


class Gambler
  include DataMapper::Resource

  property :id, Serial
  property :username, String
  property :password, String
  property :totalwin, Integer
  property :totalloss, Integer
  property :totalprofit, Integer
end

DataMapper.auto_migrate!
DataMapper.auto_upgrade!

DataMapper.finalize






