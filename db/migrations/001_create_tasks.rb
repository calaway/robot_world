require 'sqlite3'

environments = ["test", "development"]

environments.each do |environment|
  database = SQLite3::Database.new("db/robot_world_#{environment}.db")
  database.execute(
    "CREATE TABLE robots (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      name VARCHAR(64)
    );"
  )
  puts "creating robot table for #{environment}"
end
