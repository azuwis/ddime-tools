#!/usr/bin/ruby
dmg_file = ARGV[0]
seek = ARGV[1].to_i

File.open(dmg_file, 'r') do |file|
  file.seek(seek, IO::SEEK_SET)
  loop do
    weight = file.read(2)
    break if not weight
    weight = weight.unpack('S')[0]
    unknown = file.read(2).unpack('S')[0]
    code_lenght = file.read(1).unpack('C')[0]
    code = file.read(code_lenght)
    text_lenght = file.read(1).unpack('C')[0]
    text = file.read(text_lenght)
    puts "#{code}\t#{text}\t#{weight}"
  end
end
