require 'rubygems'  # Ruby 1.8 対応のため rubygems を require しているが Ruby 1.9 では不要である
require 'sqlite3'
require 'yaml'

include SQLite3
# db = Database.new("test.db")

SQL=<<EOS
create table #{"tennis"}(
  id integer primary key autoincrement, 
  fac text, 
  pro text
) ;
EOS

db.execute(SQL)
tennis = {:fac=>"dad", :pro => 32}
db.execute("insert into #{"tennis"} (fac,pro) values('#{tennis[:fac]}', '#{tennis[:pro].to_s}')") ;
