require './command'

RSpec.describe 'Command Test' do
  it 'positive case' do |test|
    statusCode, out = run("dir /B /N .") #ファイル名のみをアルファベット順で表示
    expect(statusCode).to eq 0
    expect(out).to include "command.rb"

    p "=== " + test.description + " ==="
    out.split(/\r\n/).each { |str| puts str }
  end

  it 'negative case' do |test|
    statusCode, out = run("dir /B Invalid")
    expect(statusCode).to_not eq 0

    p "=== " + test.description + " ==="
    puts out.encoding
    out.force_encoding("SJIS").split(/\r\n/).each { |str| puts str }
  end
end
