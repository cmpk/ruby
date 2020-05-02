require 'csv'
require './data_record'

class DataRecords
  def read(filepath)
    @data_records = []
    CSV.foreach(filepath, skip_blanks: true) do |csv_row|
      @data_records << DataRecord.new(
        column_size: csv_row.length,
        date: csv_row[0]&.strip,
        title: csv_row[1]&.strip,
        count: csv_row[2]&.strip,
        ip_address: csv_row[3]&.strip,
        notes: csv_row[4]&.strip
      )
    end
    @data_records
  end
end
