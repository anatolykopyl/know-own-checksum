local md5 = require 'md5'
local this_file = 'i_know_my_md5.lua'

function read_all(file)
	local f = assert(io.open(file, "rb"))
	local content = f:read("*all")
	f:close()
	return content
end

local content = read_all(this_file)
local md5_result  = md5.sumhexa(content)
local md5_expected = ''

print('My expected md5 checksum is ' .. md5_expected)
print('My own md5 checksum is ' .. md5_result)

local match = md5_result == md5_expected
return match
