require 'systemu'

# 外部コマンドを実行する.
# 
# SAMPLE
#   code, out = run("dir /B /N .")
#   p code  #=> 0
#   out.split(/\r\n/).each { |str| p str } #=> dir結果 複数行
def run(command)
  status, stdout, stderr = systemu(command + " 2>&1")
  return status.to_i, stdout
end
