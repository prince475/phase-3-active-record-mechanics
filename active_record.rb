require "pry"
require "active_record"

# Setup a database connection
# once establish_connection is run, ActtveRecord::Base kepps it stored as a class variable
# at ActiveRecord::Base.connection

# This is the connection to our database
# ActiveRecord::Base.establish_connection(
#   adapter: "sqlite3",
#   database: "db/students.sqlite"
#)

ActiveRecord::Base.establish_connection(
  adapter: "sqlite3",
  database: "db/students.sqlite"
)

# Create a Students table
# sql = <<-SQL
#   CREATE TABLE IF NOT EXISTS students (
#     id INTEGER PRIMARY KEY,
#     name TEXT
#   )
# SQL
# creating our table using sql querry

sql = <<-SQL
CREATE TABLE IF NOT EXISTS students (
  id INTEGER PRIMARY KEY,
  name TEXT
)
SQL
# Since we have already established the connection to the database at the top we need to execute the SQL to our db
ActiveRecord::Base.connection.execute(sql)

# Log SQL output to the terminal
ActiveRecord::Base.logger = Logger.new(STDOUT)

# performing inheritance through active record which allows us to link Student model to the student DB
# Thus ourclass (Student) becomes a subclass of ActiveRecord::Base and becomes the gateway for talking with table in db.
# Have the Student class inherit from ActiveRecord::Base
class Student < ActiveRecord::Base
end

binding.pry
""
