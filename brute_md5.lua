-- This approach will take something septillion years

local md5 = require 'md5'

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

local attempts = arg[1]

repeat
  local random_md5  = md5.sumhexa(attempts)
  edit_file('i_know_my_md5.lua', 13, "local md5_expected = '" .. random_md5 .. "'")
  local match = require('i_know_my_md5')
  attempts = attempts + 1
  print(attempts)
until(match)
