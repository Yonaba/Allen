--------------------------------------------------------------------------
-- Set of utility functions for strings
-- @author Roland Yonaba
-- @release $Id: Allen.lua,v 0.1 07/24/2012 Roland_Yonaba$
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
local min = math.min,
local type = type
local t_concat = table.concat
local t_insert = table.insert
local select = select

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

--- Capitalizes the first character of a given string
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.capitalizeFirst('uncapitalized') --> 'Uncapitalized' <br/>
-- _.capitalizeFirst('Capitalized') -->  'Capitalized'
-- </pre>
function _.capitalizeFirst(str) end

--- Capitalizes substring i to j in a given string
-- @param str a string
-- @param i a string. Defaults to 1 if not given. Can be negative (counting from right to left)
-- @param j a string. Default to string length if not given. (counting from right to left)
-- @return a string
-- @usage <pre class='example'> 
-- _.capitalize('capitalized') --> 'CAPITALIZED' <br/>
-- _.capitalize('capitalized',5,9) --> 'capiTALIZed' <br/>
-- print(_.capitalize('capitalized',-8) --> 'capITALIZED'
-- </pre>
function _.capitalize(str,i,j) end

--- Lowers the first character case in a given string
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.lowerFirst('HIGH') --> 'hIGH'
-- </pre>
function _.lowerFirst(str) end

--- Lowers substring i to j case in a given string
-- @param str a string
-- @param i a string. Defaults to 1 if not given. Can be negative (counting from right to left)
-- @param j a string. Default to string length if not given (counting from right to left)
-- @return a string
-- @usage <pre class='example'> 
-- _.lower('HIGHER') --> 'higher' <br/>
-- _.lower('HIGHER',2,4) --> 'HighER' <br/>
-- _.lower('HIGHER',-3) --> 'HIGher'
-- </pre>
function _.lower(str,i,j) end

--- Tests if a given string contains any upper-case character
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.isLower('String') --> false <br/>
-- _.isLower('strinG') --> false <br/>
-- print(_.isLower('string') --> true
-- </pre>
function _.isLower(str) end

--- Tests if a given string contains any lower-case character
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.isUpper('String') --> false <br/>
-- _.isUpper('sTRinG') --> false <br/>
-- _.isUpper('STRING') --> true
-- </pre>
function _.isUpper(str) end

--- Tests if a given string starts with a lower-case character
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.startsLower('String') --> false <br/>
-- _.startsLower('sTRinG') --> true
-- </pre>
function _.startsLower(str) end

--- Tests if a given string starts with an upper-case character
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.startsLower('String') --> false <br/>
-- _.startsLower('sTRinG') --> true
-- </pre>
function _.startsUpper(str) end

--- Swaps the case of each characters in substring i-j inside a given string
-- @param str a string
-- @param i a string. Defaults to 1 if not given. Can be negative (counting from right to left)
-- @param j a string. Default to string length if not given (counting from right to left)
-- @return a string
-- @usage <pre class='example'> 
-- _.swapCase('AlTeRnAtE') -->  'aLtErNaTe' <br/>
-- _.swapCase('AlTeRnAtE',3,7) --> 'AltErNatE' <br/>
-- _.swapCase('AlTeRnAtE',-4) --> 'AlTeRNaTe'
-- </pre>
function _.swapCase(str,i,j) end

--- Returns the Levenshtein distance between stringA to stringB (See <a href="http://en.wikipedia.org/wiki/Levenshtein_distance" id="Levenshtein Distance on Wikipedia">Levenshtein Distance on Wikipedia</a>)
-- @param strA a string
-- @param strB another string
-- @return a number
-- @usage <pre class='example'> 
-- _.levenshtein('test','text') --> 1 <br/>
-- _.levenshtein('rich','chinese') --> 6
-- </pre>
function _.levenshtein (strA,strB) end

--- Splits a string to an array of subsets string, each subset string made of step characters.
-- @param str a string
-- @param step an integer. Defaults to 1 if not given.
-- @return an array of strings
-- @usage <pre class='example'> 
-- _.chop('test',2) --> {'te','st'} <br/>
-- _.chop('aLongerString',3) --> {'aLo',nge','rSt','rin','g'}
-- </pre>
-- @see _.chars
function _.chop(str,step) end

--- Clears all special characters or characters matching a given pattern inside a given string
-- @param str a string
-- @param pat a pattern matching string to be cleaned from the original string. If not given, will clean non-alphanumeric characters.
-- @return a string
-- @usage <pre class='example'> 
-- _.clean('H_; e\nl\rl^o') --> 'Hello' <br/>
-- _.clean('Lua','%u') --> 'ua'
-- </pre>
function _.clean(str,pat) end

--- Tests if a given substring is included in a given string
-- @param str a string
-- @param sub a substring
-- @return a boolean
-- @usage <pre class='example'> 
-- _.includes('Programming','mmi') --> true
-- </pre>
function _.includes(str,sub) end

--- Converts a given string to an array of chars
-- @param str a string
-- @return an array
-- @usage <pre class='example'> 
-- _.chars('array') --> {'a','r','r','a','y'}
-- </pre>
-- @see _.chop
function _.chars(str) end

--- Returns the number of substring occurences in a given string
-- @param str a string
-- @param sub a subtring
-- @return an array
-- @usage <pre class='example'> 
-- _.count('Betty Butter bought a bit of butter.','tt') --> 2
-- </pre>
function _.count(str,sub) end

--- Inserts substring at index position in a given string
-- @param str a string
-- @param index an index position in th given string
-- @param substring a substring
-- @return a string
-- @usage <pre class='example'> 
-- _.insert('Am Gram',3,'Stram ') --> 'Am Stram Gram'
-- </pre>
function _.insert(str,index,substring) end

--- Checks if a given string contains any alphanumeric character
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'> 
-- _.isBlank('_a;') --> false <br/>
-- _.isBlank('_- :\/#`|~&') --> true
-- </pre>
function _.isBlank(str) end

--- Returns a string made of a concatenation of all given arguments, separated with a given separator. Delegates to Lua's native <tt>table.concat</tt>
-- @param sep a string used as separator
-- @param ... a list of strings
-- @return a string
-- @usage <pre class='example'> 
-- _.join(' ','a','b','c','d','e','f','g','h') --> 'a b c d e f g h' <br/>
-- _.join(',','a','b','c','d','e') --> 'a,b,c,d,e'
-- </pre>
function _.join(sep,...) end

--- Splits a given string in an array on the basis of end-lines characters included.
-- @param str a string
-- @return an array
-- @usage <pre class='example'> 
-- _.lines('FirstLine\nSecondLine\rThirdLine') --> {'FirstLine', 'SecondLine', 'ThirdLine'}
-- </pre>
function _.lines(str) end

--- Replaces <tt>howMany</tt> characters after <tt>index</tt> position in a given string by a given substring
-- @param str a string
-- @param index an index position in the given string
-- @param howMany the number of characters to be replaced
-- @param substring a substring to be inserted
-- @return a string
-- @usage <pre class='example'> 
-- _.splice('http://root@admin.com',12,5,'localhost') --> 'http://root@localhost.com'
-- </pre>
function _.splice(str,index,howMany,substring) end

--- Tests if a given string starts with a given pattern
-- @param str a string
-- @param starts a pattern matching string
-- @return a boolean
-- @usage <pre class='example'> 
-- local url = 'http://local@localhost.com' <br/>
-- _.startsWith(url,'http') --> true <br/>
-- _.startsWith(url,'http*') --> true <br/>
-- _.startsWith(url,'%l') --> true
-- </pre>
function _.startsWith(str,starts) end

--- Tests if a given string ends with a given pattern
-- @param str a string
-- @param ends a pattern matching string
-- @return a boolean
-- @usage <pre class='example'> 
-- local email = 'local@localhost.com' <br/>
-- _.endsWith(email,'com') --> true <br/>
-- _.endsWith(email,'.%w+') --> true
-- </pre>
function _.endsWith(str,ends) end

--- Returns the successor of a given character or set of characters
-- @param str a string
-- @param step If given, returns the step-th successor of the given string. Defaults to 1 if not given.
-- @return a string
-- @usage <pre class='example'> 
-- _.succ('a') --> 'b' <br/>
-- _.succ('wxy') --> 'xyz' <br/>
-- _.succ('D',3) --> 'G'
-- </pre>
function _.succ(str,step) end

--- Returns the predecessor of a given character or set of characters
-- @param str a string
-- @param step If given, returns the step-th predecessor of the given string. Defaults to 1 if not given.
-- @return a string
-- @usage <pre class='example'> 
-- _.pre('Z',4) --> 'V' <br/>
-- _.pre('defijk') --> 'cdehij' 
-- </pre>
function _.pre(str,step) end

-- Title-izes a given string (each word beginning with a capitalized character)
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.titleize('my tailor is rich') --> 'My Tailor Is Rich'
-- </pre>
function _.titleize(str) end

--- Converts a given string (underscored or dasherized) into camelized style
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.camelize('a_class') --> 'AClass' <br/>
--_.camelize('the-object') --> 'TheObject' <br/>
-- _.camelize('one-level_up') --> 'OneLevelUp'
-- </pre>
function _.camelize(str) end

--- Converts a given string (camelized or dasherized) into underscored style
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.underscored('-a_class') --> 'a_class' <br/>
-- _.underscored('The---Whole----Object') --> 'the_whole_object' <br/>
-- _.underscored('One-LevelUp') --> 'one_level_up'
-- </pre>
function _.underscored(str) end

--- Converts a given string (underscored or camelized) into dasherized style
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.underscored('a_class') --> 'a-class' <br/>
--_.underscored('The---Whole----Object') --> 'the-whole-object' <br/>
-- _.underscored('One-LevelUp') --> 'one-level-up'
-- </pre>
function _.dasherized(str) end

--- Converts a given string (underscored, humanized, dasherized or camelized) into a human-readable form
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.humanized('-A__--Test') --> 'A test' <br/>
-- _.humanized('anotherTest') --> 'Another test' <br/>
-- _.humanized('one-level_up') --> 'One level up'
-- </pre>
function _.humanized(str) end

--- Converts a given string into an array of words
-- @param str a string
-- @return an array
-- @usage <pre class='example'> 
-- _.words('my tailor is rich') --> {'my','tailor','is','rich'}
-- </pre>
function _.words(str) end

--- Pads a given string with characters
-- @param str a string
-- @param length the resulting length of the padded string
-- @param padStr the character used for padding. If a string is given, the first character will be used for padding
-- @param side string specifying where to pad. Can be <tt>'left'</tt>, <tt>'right'</tt> or <tt>'both'</tt>
-- @return a string
-- @usage <pre class='example'> 
-- _.pad('1',8,'0','both') --> '00001000' <br/>
-- _.pad('1',8,'0','left') --> '00000001' <br/>
-- _.pad('1',8,'0','right') --> '10000000'
-- </pre>
-- @see _.lpad
-- @see _.rpad
-- @see _.lrpad
function _.pad(str,length,padStr,side) end

--- Left-pads a given string. Alias for <tt>_.pad(str,length,padStr,'left')</tt>
-- @param str a string
-- @param length the resulting length of the padded string
-- @param padStr the character used for padding. If a string is given, the first character will be used for padding
-- @return a string
-- @usage <pre class='example'> 
-- _.lpad('1',8,'0') --> '00000001'
-- </pre>
-- @see _.pad
-- @see _.rpad
-- @see _.lrpad
function _.lpad(str,length,padStr) end

--- Left-pads a given string. In extenso, <tt>_.rjust</tt> refers to 'right-justify'. Alias for <tt>_.lpad</tt>
-- @param str a string
-- @param length the resulting length of the padded string
-- @param padStr the character used for padding. If a string is given, the first character will be used for padding
-- @return a string
-- @usage <pre class='example'> 
-- _.rjust('1',8,'0') --> '00000001'
-- </pre>
-- @see _.lpad
function _.rjust(str,length,padStr) end

--- Right-pads a given string.  Alias for <tt>_.pad(str,length,padStr,'right')</tt>
-- @param str a string
-- @param length the resulting length of the padded string
-- @param padStr the character used for padding. If a string is given, the first character will be used for padding
-- @return a string
-- @usage <pre class='example'> 
-- _.rpad('1',8,'0') --> '10000000'
-- </pre>
-- @see _.pad
-- @see _.lpad
-- @see _.lrpad
function _.rpad(str,length,padStr) end

--- Right-pads a given string. In extenso, <tt>_.ljust</tt> refers to 'left-justify'. Alias for <tt>_.rpad</tt>
-- @param str a string
-- @param length the resulting length of the padded string
-- @param padStr the character used for padding. If a string is given, the first character will be used for padding
-- @return a string
-- @usage <pre class='example'> 
-- _.ljust('1',8,'0') --> '10000000'
-- </pre>
-- @see _.rpad
function _.ljust(str,length,padStr) end

--- Left and right pads a given string.  Alias for <tt>_.pad(str,length,padStr,'both')</tt>
-- @param str a string
-- @param length the resulting length of the padded string
-- @param padStr the character used for padding. If a string is given, the first character will be used for padding
-- @return a string
-- @usage <pre class='example'> 
-- _.lrpad('1',8,'0') --> '00001000'
-- </pre>
-- @see _.pad
-- @see _.lpad
-- @see _.rpad
function _.lrpad(str,length,padStr) end

--- Left and right pads a given string. Alias for <tt>_.lrpad</tt>
-- @param str a string
-- @param length the resulting length of the padded string
-- @param padStr the character used for padding. If a string is given, the first character will be used for padding
-- @return a string
-- @usage <pre class='example'> 
-- _.center('1',8,'0') --> '00001000'
-- </pre>
-- @see _.lrpad
function _.center(str,length,padStr) end

--- Returns the substring after the given first pattern matching occurence in a given string
-- @param str a string
-- @param pattern a pattern matching string to find
-- @return a string
-- @usage <pre class='example'> 
-- _.strRight('hi dude','%s') --> 'dude' <br/>
-- _.strRight('www.internet.com','%w+.') 'internet.com'
-- </pre>
function _.strRight(str,pattern)
	local s,e = str:find(pattern)
	if e then return str:sub(e+1) end
	return nil
end

--- Returns the substring after the last given pattern matching occurence in a given string
-- @param str a string
-- @param pattern a pattern matching string to find
-- @return a string
-- @usage <pre class='example'> 
-- _.strRightBack('how are you doing','%s') --> 'doing' <br/>
-- _.strRightBack('hello.com@internet.com.net','.com') --> '.net'
-- </pre>
function _.strRightBack(str,pattern) end

--- Returns the substring before the first given pattern matching occurence in a given string
-- @param str a string
-- @param pattern a pattern matching string to find
-- @return a string
-- @usage <pre class='example'> 
-- _.strLeft('hi dude','%s') --> 'hi' <br/>
-- _.strLeft('how are you doing','%s') --> 'how'
-- </pre>
function _.strLeft(str,pattern) end

--- Returns the substring before the last given pattern match occurence in a given string
-- @param str a string
-- @param pattern a pattern matching string to find
-- @return a string
-- @usage <pre class='example'> 
-- _.strLeftBack('hi dude','%s') --> 'hi' <br/>
-- _.strLeftBack('how are you doing','%s') --> 'how are you'
-- </pre>
function _.strLeftBack(str,pattern) end

--- Converts an array of strings into a human-readable string
-- @param array an array
-- @param delimiter a character used for separating each strings in the given array when concatenating them together. Defaults to ',' if not given.
-- @param lastDelimiter another character used for separating the last string in the given array from the previous ones. Defaults to ' and ' if not given.
-- @return a string
-- @usage <pre class='example'> 
-- local arrayOfWords = {'banana','apple','mango','tomato','lemon'} <br/>
-- _.toSentence(arrayOfWords) --> 'Banana, apple, mango, tomato and lemon.' <br/>
-- _.toSentence(arrayOfWords,'.') --> 'Banana. apple. mango. tomato and lemon.' <br/>
-- _.toSentence(arrayOfWords,'.','. ') --> 'Banana. apple. mango. tomato. lemon.'
-- </pre>
function _.toSentence(array,delimiter, lastDelimiter) end

--- Repeats a given string concatenated with a given separator <tt>count</tt> times
-- @param str a string
-- @param count a number. Defaults to 2 if not given.
-- @param sep a string used as separator. Defaults to space character if not given.
-- @return a string
-- @usage <pre class='example'> 
-- _.rep('Charlie',3) --> 'Charlie Charlie Charlie ' <br/>
-- _.rep('Tango',4,',') --> 'Tango,Tango,Tango,Tango,' 
-- </pre>
function _.rep(str,count,sep) end

--- Wraps a given string
-- @param str a string
-- @param wrap a string used as wrapper.
-- @return a string
-- @usage <pre class='example'> 
-- _.surround('......','@') --> '@......@'
-- </pre>
function _.surround(str,wrap) end

--- Returns a quoted string
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- print('- I am Billy.') --> '- I am Billy.' <br/>
-- print('- Billy '.._.quote('The Kid')..' ?') '- Billy "The Kid" ?'
-- </pre>
function _.quote(str) end

--- Returns an array of Ascii codes of a character or a set of characters
-- @param str a string
-- @return an array
-- @usage <pre class='example'> 
-- _.bytes('a') --> {a = 97} <br/>
-- _.bytes('hello') --> {h = 104, e = 101, l = 108, o = 111}
-- </pre>
function _.bytes(str) end

--- Imports library functions inside string library
-- @return nothing
-- @usage <pre class='example'> 
-- _.import()
-- string.capitalize('hello') --> 'HELLO' <br/>
-- ('Hello'):splice(2,2,'r') --> 'Hero'
-- </pre>
function _.import() end