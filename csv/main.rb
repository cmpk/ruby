require './data_records'

data_records = DataRecords.new
data_record_list = data_records.read("./data.csv")
data_record_list.each do |r|
  if r.invalid? then
    r.errors.full_messages.each do |m|
      p m
    end
  end
  print("#{r.column_size}, #{r.date}, #{r.title}, #{r.count}, #{r.ip_address}, #{r.notes}\n")
end
