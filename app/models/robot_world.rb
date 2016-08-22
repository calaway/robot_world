require 'yaml/store'

class RobotWorld
  attr_reader :database

  def initialize(database)
    @database = database
  end

  def create(robot)
    database.execute(
      "INSERT INTO robots
        (name, city, state, birthdate, date_hired, department)
      VALUES (
        '#{robot[:name]}',
        '#{robot[:city]}',
        '#{robot[:state]}',
        '#{robot[:birthdate]}',
        '#{robot[:date_hired]}',
        '#{robot[:department]}'
      );"
    )
  end

  def raw_robots
    database.execute(
      "SELECT * FROM robots;"
    )
  end

  def all
    raw_robots.map { |data| Robot.new(data) }
  end

  def raw_robot(id)
    raw_robots.find { |robot| robot["id"] == id }
  end

  def find(id)
    Robot.new(raw_robot(id))
  end

  def update(id, robot)
    database.execute(
      "UPDATE robots
      SET
        name = '#{robot[:name]}',
        city = '#{robot[:city]}',
        state = '#{robot[:state]}',
        birthdate = '#{robot[:birthdate]}',
        date_hired = '#{robot[:date_hired]}',
        department = '#{robot[:department]}'
      WHERE id = #{id};"
    )
  end

  def destroy(id)
    database.execute(
      "DELETE FROM robots WHERE id=#{id};"
    )
  end

  def destroy_all
    database.execute(
      "DELETE FROM robots"
    )
  end
end
