require 'sqlite3'

class Student

  @@db = SQLite3::Database.new('student.db')

  ATTRIBUTES = {
     :name => :text,
     :bio => :text,
     :tagline => :text
   }

  def self.db
    @@db
  end

  def self.attributes
    ATTRIBUTES
  end

  def self.drop
    db.execute("DROP TABLE IF EXISTS #{table_name}")
  end

  def self.create_table
    db.execute("CREATE TABLE IF NOT EXISTS #{table_name}(
      #{attributes_for_sql}
      )")
  end

  def self.attributes_for_sql
    self.attributes.collect{|k,v| [k,v].join(" ")}.join(",")
  end

  def self.table_exists?(table_name)
    db.execute("SELECT * FROM sqlite_master WHERE type='table' AND name = ?", table_name)
  end

  def self.table_name
    "#{self.to_s.downcase}s"
  end


end
