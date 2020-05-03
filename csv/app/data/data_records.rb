require 'csv'
require_relative './data_record'

class DataRecords
  def read(filepath, include_header=true)
    @data_records = []
    csv_contents = CSV.read(filepath, skip_blanks: true)
    csv_contents.shift if include_header
    csv_contents.each do |csv_row|
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
