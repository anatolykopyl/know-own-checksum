local crc32 = require 'crc32'
local this_file = 'i_know_my_crc32.lua'

function read_all(file)
  local f = assert(io.open(file, "rb"))
  local content = f:read("*all")
  f:close()
  return content
end

local content = read_all(this_file)
local crc32_result  = crc32.hash(content)
local crc32_expected = 000000000

print('My expected crc32 checksum is ' .. crc32_expected)
print('My own crc32 checksum is ' .. crc32_result)

local match = crc32_result == crc32_expected
return match
