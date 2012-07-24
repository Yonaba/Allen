--------------------------------------------------------------------------
-- Allen Library
-- Release Id: Allen.lua,v 0.1 07/24/2012
--------------------------------------------------------------------------

--Copyright (c) 2012 Roland Yonaba
--[[
Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
--]]

------------------------------------------------------------------
-- Internalization
------------------------------------------------------------------

local _ = {}
local string = string
local pairs,ipairs = pairs, ipairs
local min = math.min
local type = type
local t_concat = table.concat
local t_insert = table.insert

------------------------------------------------------------------
-- Arithmetic metamethods for strings
------------------------------------------------------------------

local mtstr = getmetatable('')
function mtstr.__add(a,b) return a .. b end
function mtstr.__mul(a,b) return type(a) == 'string' and a:rep(b) or b:rep(a) end
function mtstr.__pow(a,b) return a:rep(b) end
function mtstr.__div(a,b) return _.chop(a,b) end
function mtstr.__unm(a) return a:reverse() end
function mtstr.__mod(a,b)
	local _chopped = _.chop(a,b)
	return ((#a)%b==0) and nil or _chopped[#_chopped]
end

------------------------------------------------------------------
-- Private Helpers
------------------------------------------------------------------

-- Creates a zero-matrix
local function matrix(row,col)
	local m = {}
	for i = 1,row do m[i] = {}
		for j = 1,col do m[i][j] = 0 end
	end
	return m
end

-- Returns the minimum of a collection of numbers
local function minOf(...)
	local _arg = {...}
	local m = _arg[1]
	for k,v in ipairs(_arg) do m = min(m,v) end
	return m
end

-- Retuns the precedent/next character in Ascii table
local function preOrSucc(char,dir) return string.char(char:byte()+dir) end

-- Returns a list of functions keys packed into an object
local function functions(obj)
	local funcs = {}
	for k,v in pairs(obj) do
		if type(v) == 'function' then t_insert(funcs,k) end
	end
	return funcs
end

-- Returns the index of value v in table t
local function findValue(t,v)
	for k,_v in pairs(t) do
		if (_v==v) then return k end
	end
	return nil
end

------------------------------------------------------------------
-- Library functions
------------------------------------------------------------------

-- Capitalizes the first character of a given string
function _.capitalizeFirst(str) return (str:lower():gsub('^%l', string.upper)) end

-- Capitalizes substring i to j in a given string
function _.capitalize(str,i,j)
	local i,j = i,j
	if not i then i,j = 1,#str end
	return (str:gsub((str:sub(i,j)),(str:sub(i,j)):upper()))
end

-- Lowers the first character case in a given string
function _.lowerFirst(str) return (str:gsub('^%u', string.lower)) end

-- Lowers substring i to j case in a given string
function _.lower(str,i,j)
	local i,j = i,j
	if not i then i,j = 1,#str end
	local pat = str:sub(i,j)
	return (str:gsub(pat,pat:lower()))
end

-- Tests if a given string contains any upper-case character
function _.isLower(str) return not str:find('%u') end

-- Tests if a given string contains any lower-case character
function _.isUpper(str) return not str:find('%l') end

-- Tests if a given string starts with a lower-case character
function _.startsLower(str) return _.isLower(str:sub(1,1)) end

-- Tests if a given starts with an upper-case character
function _.startsUpper(str) return _.isUpper(str:sub(1,1)) end

-- Swaps the case of each characters in substring i-j inside a given string
function _.swapCase(str,i,j)
	local i,j = i,j
	if not i then i,j = 1,#str end
	local oldPat = str:sub(i,j)
	local _sub = _.chars(oldPat)
	if _sub then
		for i,char in ipairs(_sub) do _sub[i] = _.isUpper(char) and char:lower() or char:upper() end
	return (str:gsub(oldPat, t_concat(_sub)))
	end
	return str
end

-- Returns the levenshtein distance from stringA to stringB
function _.levenshtein (strA,strB)
	local M = matrix(#strA+1,#strB+1)
	local i,j,cost
	local row,col = #M,#M[1]
	for i = 1,row do M[i][1] = i-1 end
	for j = 1,col do M[1][j] = j-1 end
	for i = 2,row do
		for j = 2,col do
			if (strA:sub(i-1,i-1) == strB:sub(j-1,j-1)) then cost = 0
			else cost = 1
			end
		M[i][j] = minOf(M[i-1][j]+1,M[i][j-1]+1,M[i-1][j-1]+cost)
		end
	end
	return M[row][col]
end

-- Converts a string to an array of step characters
function _.chop(str,step)
	local step = step or 1
	if not (#str > 0) then return nil end
	local _chopped = {}
		for w in str:gmatch(('.'):rep(step)) do t_insert(_chopped,w) end
	local s,e
	if _chopped and (#_chopped > 0) then
		s,e = str:find(_chopped[#_chopped])
		if e then
		local _end = str:sub(e+1)
			if _end~='' then t_insert(_chopped,_end) end
		end
	elseif #str<=step then _chopped = {str}
	end
	return _chopped
end

-- Clears all special characters or characters matching a given pattern inside a given string
function _.clean(str,pat) return (str:gsub(pat or '%A','')) end

-- Tests if a given substring is included in a given string
function _.includes(str,sub) return (str:find(sub)) and true or false end

-- Converts a given string to an array of chars
function _.chars(str)
	local _chars = {}
	for char in str:gmatch('.') do t_insert(_chars,char) end
	return #_chars>0 and _chars or nil
end

-- Returns the number of substring occurences in a given string
function _.count(str,sub) return select(2,str:gsub(sub,sub)) end

-- Inserts substring at index position in a given string
function _.insert(str,index,substring) return str:sub(1,index) + substring + str:sub(index+1) end

-- Tests if a given string contain any alphanumeric character
function _.isBlank(str) return (_.count(str,'%w')==0) end

-- Returns a string composed of a concatenation of all given arguments, separated with a given separator
function _.join(sep,...) return t_concat({...},sep) end

-- Splits a given string in an array on the basis of end-lines characters included.
function _.lines(str)
	local _lines = {}
	for l in str:gmatch('[^\n\r]+') do t_insert(_lines,l) end
	return #_lines>0 and _lines or nil
end

-- Replaces howMany characters after index position in a given string with a given substring
function _.splice(str,index,howMany,substring)
	local _str = _.insert(str,index,substring)
	local index = index + (#substring)
	return _str:sub(1,index) + _str:sub(index + howMany + 1)
end

-- Tests if a given string starts with a given pattern
function _.startsWith(str,starts) return (str:find('^'..starts)) and true or false end

-- Tests if a given string ends with a given pattern
function _.endsWith(str,ends) return (str:find(ends..'$')) and true or false end

-- Returns the successor of a given character or set of characters
function _.succ(str,step) return (str:gsub('.',function(match) return preOrSucc(match,step or 1) end)) end

-- Returns the predecessor of a given character or set of characters
function _.pre(str,step) return (str:gsub('.',function(match) return preOrSucc(match,step and -step or -1) end)) end

-- Title-izes a given string (each word beginning with a capitalized letter)
function _.titleize(str) return (str:gsub('%s*(%a+%s*)', function(match) return match:sub(1,1):upper()..match:sub(2) end)) end

-- Converts a given string (underscored or dasherized) into camelized style
function _.camelize(str) return (str:find('[_-]') and _.clean(_.titleize(str:gsub('[_-]',' ')),'%s') or _.clean(str,'%s')) end

-- Converts a given string (camelized or dasherized) into underscored style
function _.underscored(str)
	if #str < 2 then return str end
	local str = str:sub(1,1):lower()..str:sub(2)
	str = str:find('[%u]') and str:gsub('(%u)',function(match) return '_' + match:lower() end) or str
	return (str:gsub('-','_'):gsub('^_',''):gsub('_[_]+','_'))
end

-- Converts a given string (underscored or camelized) into dasherized style
function _.dasherized(str)
	local str = str:find('[%u]') and str:gsub('(%u)',function(match) return '-' + match:lower() end) or str
	return (str:gsub('_','-'):gsub('^-',''):gsub('(-+)','-'))
end

-- Converts a given string (underscored, humanized, dasherized or camelized) into a human-readable form
function _.humanized(str)
	local str = str:gsub('[_-]',' '):gsub('%s%s+',''):gsub('%s$',''):gsub('^%s','')
				   :gsub('%w%u%w',function(match) return match:sub(1,1) + ' ' + match:sub(2):lower() end)
	return (str:sub(1,1):upper()) .. (str:sub(2):lower())
end

-- Converts a given string into an array of words
function _.words(str)
	local _words = {}
	for word in str:gmatch('%w+') do t_insert(_words,word) end
	return #_words>0 and _words or nil
end

-- Pads a given string with characters
function _.pad(str,length,padStr,side)
	local str = str
	local padStr = padStr:sub(1,1)
	local side = side or 'left'
	if side == 'left' then return (padStr:rep(length - str:len()) .. str)
	elseif side == 'right' then return str..(padStr:rep(length - str:len()))
	elseif side == 'both' then
		local side = 'left'
			while str:len() < length do
			str = _.pad(str,str:len() + 1,padStr,side)
			side = (side =='left' and 'right' or 'left')
			end
		return str
	end

end

-- Left-pad a given string
function _.lpad(str,length,padStr) return _.pad(str,length,padStr,'left') end
_.rjust = _.lpad

-- Right-pad a given string
function _.rpad(str,length,padStr) return _.pad(str,length,padStr,'right') end
_.ljust = _.rpad

-- Left and right pad a given string
function _.lrpad(str,length,padStr) return _.pad(str,length,padStr,'both') end
_.center = _.lrpad

-- Returns the substring after the first pattern occurence in a given string
function _.strRight(str,pattern)
	local s,e = str:find(pattern)
	if e then return str:sub(e+1) end
	return nil
end

-- Returns the substring after the last pattern occurence in a given string
function _.strRightBack(str,pattern)
	local _str,s,e
	for i = -1,-(#str),-1 do
		_str = str:sub(i)
		s,e = _str:find(pattern)
		if e then return _str:sub(e+1) end
	end
	return nil
end

-- Returns the substring before the first pattern occurence in a given string
function _.strLeft(str,pattern)
	local s,e = str:find(pattern)
	if s then return str:sub(1,s-1) end
	return nil
end

-- Returns the substring before the last pattern occurence in a given string
function _.strLeftBack(str,pattern)
	local _str,s,e
	for i = -1,-(#str),-1 do
		_str = str:sub(i)
		s,e = _str:find(pattern)
		if s then return str:sub(1,#str+i) end
	end
	return nil
end

-- Converts an array of strings into a human-readable sentence (string)
function _.toSentence(array,delimiter, lastDelimiter)
	local delimiter = delimiter or ','
	local lastDelimiter = lastDelimiter or ' and '
	local j = #array
	for i,entry in ipairs(array) do
		if i>1 and i<j then array[i] = entry:gsub('^%w',function(match) return ' ' + match end) end
	end
	return _.capitalizeFirst(t_concat(array,delimiter,1,j-1) + lastDelimiter + array[j]) .. '.'
end

-- Repeats a given string concatenated with a given separator count times
function _.rep(str,count,sep) return (str .. (sep or ' ')):rep(count or 2) end

-- Wraps a given string
function _.surround(str,wrap) return wrap .. str .. wrap end

-- Returns a quoted string
function _.quote(str) return string.format('%q',str) end

-- Returns an array of Ascii codes of a character or a set of characters
function _.bytes(str)
	local _set = _.chars(str)
	local _byteSet = {}
	for char in str:gmatch('.') do
		if not _byteSet[char] then _byteSet[char] = char:byte() end
	end
	return _byteSet
end

-- Imports functions inside string library
function _.import()
	local methods = functions(_)
	local excluded = {'join', 'toSentence','mixin'}
	for k,v in ipairs(methods) do
		if not findValue(excluded,v) then string[v] = _[v] end
	end
end

return _