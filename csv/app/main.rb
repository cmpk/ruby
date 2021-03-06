require_relative './data/data_records'

def main
  data_records = DataRecords.new
  data_record_list = data_records.read("#{File::dirname(__dir__)}/files/data.csv")
  data_record_list.each do |r|
    if r.invalid? then
      r.errors.full_messages.each do |m|
        p m
      end
    end
    print("#{r.column_size}, #{r.date}, #{r.title}, #{r.count}, #{r.ip_address}, #{r.notes}\n")
  end
end

# 'ruby main.rb' のように自分自身が呼び出されたときのみ実行する
if __FILE__ == $0
  main
end
