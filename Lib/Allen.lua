--------------------------------------------------------------------------
-- @author Roland Yonaba
-- @release $Id: Allen.lua,v1.1.1 09/24/2012 Roland_Yonaba$
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
local tonumber = tonumber
local getfenv = getfenv

local luaKwords = {
  ['and'] = true,     ['break'] = true,   ['do'] = true,
  ['else'] = true,    ['elseif'] = true,  ['end'] = true ,
  ['false'] = true,   ['for'] = true,     ['function'] = true,
  ['if'] = true,      ['in'] = true,      ['local'] = true ,
  ['nil'] = true,     ['not'] = true ,    ['or'] = true,
  ['repeat'] = true,  ['return'] = true,  ['then'] = true ,
  ['true'] = true ,   ['until'] = true ,  ['while'] = true,
}

local luaTypes = {
  ['nil'] = true,       ['boolean'] = true,
  ['number'] = true,    ['thread'] = true,
  ['userdata'] = true,  ['table'] = true,
  ['string'] = true,    ['function'] = true,
}

local luaTokens = {
  ['+'] = true,   ['-']= true,    ['*'] = true,   ['/'] = true,
  ['%'] = true,   ['=='] = true,  ['~='] = true,  ['<='] = true,
  ['>='] = true,  ['<'] = true,   ['>'] = true,   ['^'] = true,
  ['#'] = true,   ['='] = true,   ['('] = true,   [')'] = true,
  ['{'] = true,   ['}'] = true,   ['['] = true,   [']'] = true,
  [';'] = true,   [':'] = true,   ['.'] = true,   ['..'] = true,
  ['...'] = true,
}


------------------------------------------------------------------
-- Arithmetic metamethods/Indexing features for strings
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

local old_mtIndex = mtstr.__index
function mtstr.__index(str,i)
  if type(i)=='number' then
    local char = str:sub(i,i)
    return (char and char~='') and char or nil
  elseif type(old_mtIndex) == 'table' then return old_mtIndex[i]
  else return old_mtIndex(str,i)
  end
end

function mtstr.__call(str,i,j)
  local i = i or 1
  local j = j or i
  if type(i) == 'number' then
    if type(j) == 'number' then 
      return str:sub(i,j)
    elseif type(j) == 'string' then 
      return str:sub(1,i-1)..j:sub(1,1)..str:sub(i+1)
    end
  end
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
local function preOrSucc(char,dir) 
  return string.char(char:byte()+dir) 
end

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
function _.capitalizeFirst(str) 
  return (str:lower():gsub('^%l', string.upper)) 
end
_.capFirst = _.capitalizeFirst

-- Capitalizes each word in a string
function _.capitalizesEach(str)
  return str:gsub("(%w[%w]*)",
      function (match) return _.capFirst(match) end)
end
_.capEach = _.capitalizesEach
_.caps = _.capitalizesEach

-- Capitalizes substring i to j in a given string
function _.capitalize(str,i,j)
  local i,j = i,j
  if not i then i,j = 1,#str end
  return (str:gsub(str:sub(i,j),str:sub(i,j)):upper())
end
_.cap = _.capitalize

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
_.isLowerCase = _.isLower

-- Tests if a given string contains any lower-case character
function _.isUpper(str) return not str:find('%l') end
_.isUpperCase = _.isUpper

-- Tests if a given string starts with a lower-case character
function _.startsLower(str) return _.isLower(str:sub(1,1)) end
_.startsLowerCase = _.startsLower

-- Tests if a given starts with an upper-case character
function _.startsUpper(str) return _.isUpper(str:sub(1,1)) end
_.startsUpperCase = _.startsUpper

-- Swaps the case of each characters in substring i-j inside a given string
function _.swapCase(str,i,j)
  local i,j = i,j
  if not i then i,j = 1,#str end
  local oldPat = str:sub(i,j)
  local _sub = _.chars(oldPat)
  if _sub then
    for i,char in ipairs(_sub) do 
      _sub[i] = _.isUpper(char) and char:lower() or char:upper() 
    end
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
_.trim = _.clean

-- Escape any magic character in agiven string
function _.escape(str) return (str:gsub('[%^%$%(%)%%%.%[%]%*%+%-%?]','%%%1')) end
_.esc = _.escape

-- Substitute any ${var} or $var pattern-like with a value
function _.substitute(str,value) return (str:gsub('%${*([%w]+)}*',value)) end
_.subst = _.substitute
_.interpolate = _.substitute

-- Tests if a given substring is included in a given string
function _.includes(str,sub) return (str:find(sub)) and true or false end

-- Converts a given string to an array of chars
function _.chars(str)
  local _chars = {}
  for char in str:gmatch('.') do t_insert(_chars,char) end
  return #_chars>0 and _chars or nil
end
_.explode = _.chars

-- Checks if a given string features only alphabetic characters
function _.isAlpha(str)  return not str:find('%A') end

-- Checks if a given string features only digits
function _.isNumeric(str) return tonumber(str) and true or false end

-- Checks if a given string features alphanumeric characters
function _.isAlphaNumeric(str) return not str:find('%W') end

-- Checks if a given string is hex
function _.isHex(str) return tonumber(str,16) and true or false end
_.isHexadecimal = _.isHex

-- Returns the character at index i
function _.index(str,i) return str[i] end
_.charAt = _.index

-- Checks if a given string matches an email address syntax
function _.isEmail(str)
  local nAt = _.count(str,'@')
  if nAt > 1 or nAt == 0 or str:len() > 254 or str:find('%s') then return false end
  local localPart = _.strLeft(str,'@')
  local domainPart = _.strRight(str,'@')
  if not localPart or not domainPart then return false end

  if not localPart:match("[%w!#%$%%&'%*%+%-/=%?^_`{|}~]+") 
      or (localPart:len() > 64) then 
        return false 
  end
  if _.startsWith(localPart,'%.+') 
      or _.endsWith(localPart,'%.+') or localPart:find('%.%.+') then 
        return false 
  end

  if not domainPart:match('[%w%-_]+%.%a%a+$') 
      or domainPart:len() > 253 then 
        return false 
  end
  local fDomain = _.strLeftBack(domainPart,'%.')
  if _.startsWith(fDomain,'[_%-%.]+') 
      or _.endsWith(fDomain,'[_%-%.]+') or fDomain:find('%.%.+') then 
        return false 
  end

  return true
end

-- Returns the number of substring occurences in a given string
function _.count(str,sub) return select(2,str:gsub(sub,sub)) end

-- Inserts substring at index position in a given string
function _.insert(str,index,substring) 
  return str:sub(1,index) + substring + str:sub(index+1) 
end

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
function _.startsWith(str,starts) 
  return (str:find('^'..starts)) and true or false 
end

-- Tests if a given string ends with a given pattern
function _.endsWith(str,ends) 
  return (str:find(ends..'$')) and true or false 
end

-- Returns the successor of a given character or set of characters
function _.succ(str,step) 
  return (str:gsub('.',
        function(match) return preOrSucc(match,step or 1) end)) 
end
_.next = _.succ

-- Returns the predecessor of a given character or set of characters
function _.pre(str,step) 
  return (str:gsub('.',
        function(match) return preOrSucc(match,step and -step or -1) end)) 
end

-- Title-izes a given string (each word beginning with a capitalized letter)
function _.titleize(str) 
  return (str:gsub('%s*(%a+%s*)',
        function(match) return match:sub(1,1):upper()..match:sub(2) end)) 
end

-- Converts a given string (underscored or dasherized) into camelized style
function _.camelize(str) 
  return (str:find('[_-]') 
     and _.clean(_.titleize(str:gsub('[_-]',' ')),'%s') 
      or _.clean(str,'%s')) 
end

-- Converts a given string (camelized or dasherized) into underscored style
function _.underscored(str)
  if #str < 2 then return str end
  local str = str:sub(1,1):lower()..str:sub(2)
  str = str:find('[%u]') 
      and str:gsub('(%u)',function(match) return '_' + match:lower() end) 
       or str
  return (str:gsub('-','_'):gsub('^_',''):gsub('_[_]+','_'))
end

-- Converts a given string (underscored or camelized) into dasherized style
function _.dasherized(str)
  local str = str:find('[%u]') 
        and str:gsub('(%u)',function(match) return '-' + match:lower() end) 
         or str
  return (str:gsub('_','-'):gsub('^-',''):gsub('(-+)','-'))
end

-- Converts a given string (underscored, humanized, dasherized or camelized) into a human-readable form
function _.humanized(str)
  local str = str:gsub('[_-]',' ')
                 :gsub('%s%s+','')
                 :gsub('%s$','')
                 :gsub('^%s','')
                 :gsub('%w%u%w',
                      function(match) 
                        return match:sub(1,1) + ' ' + match:sub(2):lower() 
                      end)
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
  local ret
  if e then
    ret =  str:sub(e+1)
    return ret~='' and ret or nil
  end
  return nil
end

-- Returns the substring after the last pattern occurence in a given string
function _.strRightBack(str,pattern)
  local _str,s,e,ret
  for i = -1,-(#str),-1 do
    _str = str:sub(i)
    s,e = _str:find(pattern)
    if e then
      ret = _str:sub(e+1)
      return ret~='' and ret or nil
    end
  end
  return nil
end

-- Returns the substring before the first pattern occurence in a given string
function _.strLeft(str,pattern)
  local s,e = str:find(pattern)
  local ret
  if s then
    ret = str:sub(1,s-1)
    return ret~='' and ret or nil
    end
  return nil
end

-- Returns the substring before the last pattern occurence in a given string
function _.strLeftBack(str,pattern)
  local _str,s,e,ret
  for i = -1,-(#str),-1 do
    _str = str:sub(i)
    s,e = _str:find(pattern)
    if s then
      ret = str:sub(1,#str+i)
      return ret~='' and ret or nil
    end
  end
  return nil
end

-- Converts an array of strings into a human-readable sentence (string)
function _.toSentence(array,delimiter, lastDelimiter)
  local delimiter = delimiter or ','
  local lastDelimiter = lastDelimiter or ' and '
  local j = #array
  for i,entry in ipairs(array) do
    if i>1 and i<j then 
      array[i] = entry:gsub('^%w',function(match) return ' ' + match end) 
    end
  end
  return _.capitalizeFirst(t_concat(array,delimiter,1,j-1) + lastDelimiter + array[j]) .. '.'
end

-- Repeats a given string concatenated with a given separator count times
function _.rep(str,count,sep) return (str .. (sep or ' ')):rep(count or 2) end

-- Wraps a given string
function _.surround(str,wrap) return wrap .. str .. wrap end

-- Returns a quoted string
function _.quote(str) return ('%q'):format(str) end

-- Returns an array of Ascii codes of a character or a set of characters
function _.bytes(str)
  local _set = _.chars(str)
  local _byteSet = {}
  for char in str:gmatch('.') do
    if not _byteSet[char] then _byteSet[char] = char:byte() end
  end
  return _byteSet
end

-- Returns the Ascii code of character at index i.
function _.byteAt(str,i) return (str[i]):byte() end

-- Checks if the given string is a reserved keyword
function _.isLuaKeyword(str) return luaKwords[str] and true or false end
_.isLuaKword = _.isLuaKeyword
_.isReserved = _.isLuaKeyword

-- Checks if the given string is a token
function _.isToken(str) return luaTokens[str] and true or false end
_.isOperator = _.isToken
_.isOp = _.isToken

-- Checks if the given string can be an identifier
function _.isIdentifier(str)
    return (str:match('^[%a_]+[%w_]*$') and not _.isReserved(str)) and true or false
end
_.isIden = _.isIdentifier
_.isName = _.isIdentifier

-- Checks if the given input is a valid Lua type
function _.is(var,expectedType)
  local _varType = type(var)
  if expectedType then return (_varType == expectedType) end
  return luaTypes[_varType] and _varType or nil
end

-- Returns a table reporting each pattern occurences
function _.statistics(str,pat)
  local pat = pat or '.'
  local _rep = {}
  for w in (string.gmatch(str,pat,pat)) do
    _rep[w] = (_rep[w] or 0) + 1
  end
  return _rep
end
_.stats = _.statistics

-- Imports functions inside string library
function _.import()
  local methods = functions(_)
  local excluded = {join = true, toSentence = true,import = true}
  for i,v in ipairs(methods) do
    if not excluded[v] then getfenv().string[v] = _[v] end
  end
end

return _
