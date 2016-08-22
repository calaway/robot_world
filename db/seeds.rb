require 'sqlite3'

database = SQLite3::Database.new("db/robot_world_development.db")

# Delete existing records from the robots table before inserting these new records; we'll start from scratch.
database.execute("DELETE FROM robots")

# Insert records.
database.execute(
  "INSERT INTO robots
    (name, city, state, birthdate, date_hired, department)
  VALUES
    ('Raobot', 'denver', 'CO', '2016-02-04', '2016-08-07', 'Mergers & Acquisitions');"
)

# Verifying that our SQL INSERT statement worked
puts "It worked and:"
p database.execute("SELECT * FROM robots;")
