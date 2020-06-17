require 'sqlite3'

#creating the database 
DB = {:conn => SQLite3::Database.new("db/songs.db")}
DB[:conn].execute("DROP TABLE IF EXISTS songs")

#creating the songs table 
sql = <<-SQL
  CREATE TABLE IF NOT EXISTS songs (
  id INTEGER PRIMARY KEY,
  name TEXT,
  album TEXT
  )
SQL

#ruby gem (results as hash)
#When a select statement is executed, don't return a database row
#as an array, return it as a hash with the column names as keys.
DB[:conn].execute(sql)
DB[:conn].results_as_hash = true
