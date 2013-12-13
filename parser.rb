require 'nokogiri'
require 'Sequel'

class Absence

  def initialize (args)
    @database = Sequel.connect("sqlite://#{args}.db")
  end

  def parse(file)
    xmlfile = Nokogiri::HTML(File.open(file))
    data = xmlfile.search('row').map do |row|
      Hash[row.attributes.keys.zip(row.attributes.values.map(&:value))]
    end
  end

  def create_table(table_name)
    @database.create_table table_name do
      primary_key :id
      Integer :conf
      Integer :absence_instance_id
      String :created
      String :date
      String :employee_identifier
      Integer:school_external_id
      String :school_name
      String :substitute_identifier
      String :start_time_absence
      String :end_time_absence
      String :filled
      String :absence_reason
      String :approval_status
      String :approved_by
      Float :duration_absence
      String :reconciled_date
      String :reconciled
    end
  end

  def insert_table(table_name, xml_hash)
    testing = @database[table_name]
     xml_hash.each do |hash|
      testing.insert(hash)
      end
  end
end

#creates the database file after each new instance
absence = Absence.new("absencedb")

#parse for AesopAbsences.xml
parse = absence.parse('AesopAbsences.xml')

#creates table within the database
absence.create_table(:absencedata)

absence.insert_table(:absencedata, parse)