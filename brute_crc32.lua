local crc32 = require 'crc32'

function edit_file(input_file, line, content)
  local file = io.open(input_file, 'r')
  local file_content = {}
  for line in file:lines() do
      table.insert(file_content, line)
  end
  io.close(file)

  file_content[line] = content

  file = io.open(input_file, 'w')
  for index, value in ipairs(file_content) do
      file:write(value..'\n')
  end
  io.close(file)
end

local attempts = 0

repeat
  local random_crc32  = crc32.hash(attempts)
  edit_file('i_know_my_crc32.lua', 13, "local crc32_expected = '" .. random_crc32 .. "'")
  local match = require('i_know_my_crc32')
  attempts = attempts + 1
  print(attempts)
until(match)
