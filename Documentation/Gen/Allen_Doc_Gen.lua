--------------------------------------------------------------------------
-- Set of utility functions for strings
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
-- Library functions
------------------------------------------------------------------

--- Capitalizes the first character of a given string
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.capitalizeFirst('uncapitalized') --> 'Uncapitalized' <br/>
-- _.capitalizeFirst('Capitalized') -->  'Capitalized'
-- </pre>
-- @see _.capFirst
function _.capitalizeFirst(str) end

--- Capitalizes the first character of a given string. Alias for <tt>_.capitalizeFirst</tt>
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.capFirst('uncapitalized') --> 'Uncapitalized' <br/>
-- _.capFirst('Capitalized') -->  'Capitalized'
-- </pre>
-- @see _.capitalizeFirst
function _.capFirst(str) end

--- Capitalizes substring i to j in a given string
-- @param str a string
-- @param i a string. Defaults to 1 if not given. Can be negative (counting from right to left)
-- @param j a string. Default to string length if not given. (counting from right to left)
-- @return a string
-- @usage <pre class='example'> 
-- _.capitalize('capitalized') --> 'CAPITALIZED' <br/>
-- _.capitalize('capitalized',5,9) --> 'capiTALIZed' <br/>
-- _.capitalize('capitalized',-8) --> 'capITALIZED'
-- </pre>
-- @see _.cap
function _.capitalize(str,i,j) end

--- Capitalizes substring i to j in a given string. Alias for <tt>_.capitalize</tt>
-- @param str a string
-- @param i a string. Defaults to 1 if not given. Can be negative (counting from right to left)
-- @param j a string. Default to string length if not given. (counting from right to left)
-- @return a string
-- @usage <pre class='example'> 
-- _.cap('capitalized') --> 'CAPITALIZED' <br/>
-- _.cap('capitalized',5,9) --> 'capiTALIZed' <br/>
-- _.cap('capitalized',-8) --> 'capITALIZED'
-- </pre>
-- @see _.capitalize
function _.cap(str,i,j) end

--- Capitalizes each word in a given string.
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.capitalizesEach('my tailor is rich') --> 'My Tailor Is Rich'
-- </pre>
-- @see _.capEach
-- @see _.caps
function _.capitalizesEach(str) end

--- Capitalizes each word in a given string. Alias for <tt>_.capitalizesEach</tt>
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.capEach('my tailor is rich') --> 'My Tailor Is Rich'
-- </pre>
-- @see _.capitalizesEach
-- @see _.caps
function _.capEach(str) end

--- Capitalizes each word in a given string. Alias for <tt>_.capitalizesEach</tt>
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.caps('my tailor is rich') --> 'My Tailor Is Rich'
-- </pre>
-- @see _.capitalizesEach
-- @see _.capEach
function _.caps(str) end

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

--- Tests if a given string contains only upper-case characters
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.isLower('String') --> false <br/>
-- _.isLower('strinG') --> false <br/>
-- _.isLower('string') --> true
-- </pre>
-- @see _.isLowerCase
function _.isLower(str) end

--- Tests if a given string contains only upper-case characters. Alias for <tt>_.isLower</tt>
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.isLowerCase('String') --> false <br/>
-- _.isLowerCase('strinG') --> false <br/>
-- _.isLowerCase('string') --> true
-- </pre>
-- @see _.isLower
function _.isLowerCase(str) end

--- Tests if a given string contains only lower-case characters
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.isUpper('String') --> false <br/>
-- _.isUpper('sTRinG') --> false <br/>
-- _.isUpper('STRING') --> true
-- </pre>
-- @see _.isUpperCase
function _.isUpper(str) end

--- Tests if a given string contains only lower-case characters. Alias for <tt>_.isUpper</tt>
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.isUpperCase('String') --> false <br/>
-- _.isUpperCase('sTRinG') --> false <br/>
-- _.isUpperCase('STRING') --> true
-- </pre>
-- @see _.isUpper
function _.isUpperCase(str) end

--- Tests if a given string starts with a lower-case character
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.startsLower('String') --> false <br/>
-- _.startsLower('sTRinG') --> true
-- </pre>
-- @see _.startsLowerCase
function _.startsLower(str) end

--- Tests if a given string starts with a lower-case character. Alias for <tt>_.startsLower</tt>
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.startsLowerCase('String') --> false <br/>
-- _.startsLowerCase('sTRinG') --> true
-- </pre>
-- @see _.startsLower
function _.startsLowerCase(str) end

--- Tests if a given string starts with an upper-case character
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.startsUpper('String') --> true <br/>
-- _.startsUpper('sTRinG') --> false
-- </pre>
-- @see _.startsUpperCase
function _.startsUpper(str) end

--- Tests if a given string starts with an upper-case character. Alias for <tt>_.startsUpper</tt>
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.startsUpperCase('String') --> true <br/>
-- _.startsUpperCase('sTRinG') --> false
-- </pre>
-- @see _.startsUpper
function _.startsUpperCase(str) end

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

--- Checks if a given string contains only alphabetic characters
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'> 
-- _.isAlpha('text') --> true <br/>
-- _.isAlpha('text1')  --> false <br/>
-- _.isAlpha('te xt~')  --> false
-- </pre>
function _.isAlpha(str) end

--- Checks if a given string contains only alphabetic characters
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'> 
-- _.isNumeric('1e20')--> true <br/>
-- _.isNumeric('-33.2a') --> false
-- </pre>
-- @see _.isNum
function _.isNumeric(str) end

--- Checks if a given string contains only alphabetic characters. Alias for <tt>_.isNumeric</tt>
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'> 
-- _.isNum('1e20')--> true <br/>
-- _.isNum('-33.2a') --> false
-- </pre>
-- @see _.isNumeric
function _.isNum(str) end

--- Checks if a given string contains only alphabetic and digits
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'> 
-- _.isAlphaNumeric('-33.2a') --> false <br/>
-- _.isAlphaNumeric('33.2') --> true
-- </pre>
-- @see _.isANum
function _.isAlphaNumeric(str) end

--- Checks if a given string contains only alphabetic and digits. Alias for <tt>_.isAlphaNumeric</tt>
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'> 
-- _.isANum('-33.2a') --> false <br/>
-- _.isANum('33.2') --> true
-- </pre>
-- @see _.isAlphaNumeric
function _.isANum(str) end

--- Checks if a given string can be converted to hex
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'> 
-- _.isHexadecimal('-33.2') --> false <br/>
-- _.isHexadecimal('FDA') --> true
-- </pre>
-- @see _.isHex
function _.isHexadecimal(str) end

--- Checks if a given string can be converted to hex. Alias for <tt>_.isHexadecimal</tt>
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'> 
-- _.isHex('-33.2') --> false <br/>
-- _.isHex('FDA') --> true
-- </pre>
-- @see _.isHexadecimal
function _.isHex(str) end

--- Checks if a given string matches a valid email address syntax. See <a href="http://en.wikipedia.org/wiki/Email_address" id="Email Addresses on Wikipedia">Email Addresses on Wikipedia</a>
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'> 
-- _.isEmail('@') --> false <br/>
-- _.isEmail('.com') --> false <br/>
-- _.isEmail('a@com') --> false <br/>
-- _.isEmail('~user..nm.@web.co.uk') --> false <br/>
-- _.isEmail('user.nm@web.co.uk') --> true 
-- </pre>
function _.isEmail(str) end

--- Indexes a string like a table, returning a character. 
-- @param str a string
-- @return i an index
-- @usage <pre class='example'> 
-- _.index('Hello',2) --> 'e'  <br/>
-- _.index('Hello',10) --> nil
-- </pre>
-- @see _.charAt
function _.index(str) end

--- Indexes a string like a table, returning a character. Alias for <tt>_.index</tt>
-- @param str a string
-- @return i an index
-- @usage <pre class='example'> 
-- _.charAt('Hello',2) --> 'e'  <br/>
-- _.charAt('Hello',10) --> nil
-- </pre>
-- @see _.index
function _.charAt(str) end

--- Returns the Levenshtein distance between stringA to stringB. See <a href="http://en.wikipedia.org/wiki/Levenshtein_distance" id="Levenshtein Distance on Wikipedia">Levenshtein Distance on Wikipedia</a>
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
-- @see _.trim
function _.clean(str,pat) end

--- Clears all special characters or characters matching a given pattern inside a given string. Alias for <tt>_.clean</tt>
-- @param str a string
-- @param pat a pattern matching string to be cleaned from the original string. If not given, will clean non-alphanumeric characters.
-- @return a string
-- @usage <pre class='example'> 
-- _.trim('H_; e\nl\rl^o') --> 'Hello' <br/>
-- _.trim('Lua','%u') --> 'ua'
-- </pre>
-- @see _.clean
function _.trim(str,pat) end

--- Returns a table listing counts for each matching to a given pattern
-- @param str a string
-- @param pat a pattern matching string
-- @return an array
-- @usage <pre class='example'>
-- _.statistics('Hello') <br/>
-- => e	1 <br/>
-- => H	1 <br/>
-- => o	1 <br/>
-- => l	2 <br/>
-- _.statistics('my tailor is rich','%w+') <br/>
-- => my	1 <br/>
-- => rich	1 <br/>
-- => is	1 <br/>
-- => tailor	1
-- </pre> 
-- @see _.stats
function _.statistics(str,pat) end

--- Returns a table listing counts for each matching to a given pattern. Alias for <tt>_.statistics</tt>
-- @param str a string
-- @param pat a pattern matching string
-- @return an array
-- @usage <pre class='example'>
-- _.stats('Hello') <br/>
-- => e	1 <br/>
-- => H	1 <br/>
-- => o	1 <br/>
-- => l	2 <br/>
-- _.stats('my tailor is rich','%w+') <br/>
-- => my	1 <br/>
-- => rich	1 <br/>
-- => is	1 <br/>
-- => tailor	1
-- </pre> 
-- @see _.statistics
function _.stats(str,pat) end

-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.escape('Hel%-l^(o)') --> 'Hel%%%-l%^%(o%)'
-- </pre>
-- @see _.esc
function _.escape(str) end


--- Escapes any of the magic characters (^$()%.[]*+-?) in the given string
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.escape('Hel%-l^(o)') --> 'Hel%%%-l%^%(o%)'
-- </pre>
-- @see _.esc
function _.escape(str) end

--- Escapes any of the magic characters (^$()%.[]*+-?) in the given string. Alias for <tt>_.esc</tt>
-- @param str a string
-- @return a string
-- @usage <pre class='example'> 
-- _.esc('Hel%-l^(o)') --> 'Hel%%%-l%^%(o%)'
-- </pre>
-- @see _.escape
function _.esc(str) end

--- Substitutes any sequence matching ${var} or $var pattern-like with a given value
-- @param str a string
-- @param var a variable
-- @return a string
-- @usage <pre class='example'>
-- local x,y = 0,0 <br/>
-- _.substitute("x = ${x}",x) --> x = 0 <br/>
-- _.substitute("y = $y",y) --> y = 0
-- </pre>
-- @see _.subst
-- @see _.interpolate
function _.substitute(str, var) end

--- Substitutes any sequence matching ${var} or $var pattern-like with a given value. Alias for <tt>_.subst</tt>
-- @param str a string
-- @param var a variable
-- @return a string
-- @usage <pre class='example'>
-- local x,y = 0,0 <br/>
-- _.subst("x = ${x}",x) --> x = 0 <br/>
-- _.subst("y = $y",y) --> y = 0
-- </pre>
-- @see _.substitute
-- @see _.interpolate
function _.subst(str, var) end

--- Substitutes any sequence matching ${var} or $var pattern-like with a given value. Alias for <tt>_.subst</tt>
-- @param str a string
-- @param var a variable
-- @return a string
-- @usage <pre class='example'>
-- local x,y = 0,0 <br/>
-- _.interpolate("x = ${x}",x) --> x = 0 <br/>
-- _.interpolate("y = $y",y) --> y = 0
-- </pre>
-- @see _.substitute
-- @see _.subst
function _.interpolate(str, var) end

--- Checks if the given string is a Lua reserved keyword
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'>
-- _.isLuaKeyword("false") --> true <br/>
-- _.isLuaKeyword("do") --> true
-- </pre>
-- @see _.isLuaKword
-- @see _.isReserved
function _.isLuaKeyword(str) end

--- Checks if the given string is a Lua reserved keyword. Alias for <tt>_.isLuaKeyword</tt>
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'>
-- _.isLuaKword("and") --> true <br/>
-- _.isLuaKword("then") --> true
-- </pre>
-- @see _.isLuaKeyword
-- @see _.isReserved
function _.isLuaKword(str) end

--- Checks if the given string is a Lua reserved keyword. Alias for <tt>_.isLuaKeyword</tt>
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'>
-- _.isReserved("if") --> true <br/>
-- _.isReserved("end") --> true
-- </pre>
-- @see _.isLuaKeyword
-- @see _.isLuaKword
function _.isReserved(str) end

--- Tests if a given substring is included in a given string
-- @param str a string
-- @param sub a substring
-- @return a boolean
-- @usage <pre class='example'> 
-- _.includes('Programming','mmi') --> true
-- </pre>
function _.includes(str,sub) end

--- Tests if a given substring is a Lua token (operator)
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'> 
-- _.isToken("%") --> true <br/>
-- _.isToken(">=") --> true <br/>
-- _.isToken("..") --> true
-- </pre>
-- @see _.isOperator
-- @see _.isOp
function _.isToken(str) end

--- Tests if a given substring is a Lua token (operator). Alias for <tt>_.isToken</tt>
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'> 
-- _.isOperator("%") --> true <br/>
-- _.isOperator(">=") --> true <br/>
-- _.isOperator("..") --> true
-- </pre>
-- @see _.isToken
-- @see _.isOp
function _.isOperator(str) end

--- Tests if a given substring is a Lua token (operator). Alias for <tt>_.isToken</tt>
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'> 
-- _.isOp("%") --> true <br/>
-- _.isOp(">=") --> true <br/>
-- _.isOp("..") --> true
-- </pre>
-- @see _.isToken
-- @see _.isOperator
function _.isOp(str) end

--- Tests if a given substring can be an valid Lua identifier
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'> 
-- _.isIdentifier("1x") --> false <br/>
-- _.isIdentifier("x_1") --> true <br/>
-- _.isIdentifier("_") --> true
-- </pre>
-- @see _.isIden
-- @see _.isName
function _.isIdentifier(str) end

--- Tests if a given substring can be an valid Lua identifier. Alias for <tt>_.isIdentifier</tt>
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'> 
-- _.isIden("var") --> true <br/>
-- _.isIden("else") --> false <br/>
-- _.isIden("Else") --> true
-- </pre>
-- @see _.isIdentifier
-- @see _.isName
function _.isIden(str) end

--- Tests if a given substring can be an valid Lua identifier. Alias for <tt>_.isIdentifier</tt>
-- @param str a string
-- @return a boolean
-- @usage <pre class='example'> 
-- _.isName("then") --> false <br/>
-- _.isName("_my_") --> true
-- </pre>
-- @see _.isIdentifier
-- @see _.isIden
function _.isName(str) end

--- Returns the Ascii code of the i-th character in the given string
-- @param str a string
-- @param i an index
-- @return a number
-- @usage <pre class='example'> 
-- local str = 'Hello' <br/>
-- for i = 1,#str do <br/>
--    print(_.byteAt(str,i)) <br/>
-- end <br/>
-- => 72 <br/>
-- => 101 <br/>
-- => 108 <br/>
-- => 108 <br/>
-- => 111
-- </pre>
function _.byteAt(str,i) end

--- Converts a given string to an array of chars
-- @param str a string
-- @return an array
-- @usage <pre class='example'> 
-- _.chars('array') --> {'a','r','r','a','y'}
-- </pre>
-- @see _.explode
-- @see _.chop
function _.chars(str) end

--- Converts a given string to an array of chars. Alias for <tt>_.chars</tt>
-- @param str a string
-- @return an array
-- @usage <pre class='example'> 
-- _.explode('array') --> {'a','r','r','a','y'}
-- </pre>
-- @see _.chars
function _.explode(str) end

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
-- @see _.next
function _.succ(str,step) end

--- Returns the successor of a given character or set of characters. Alias for <tt>_.succ</tt>
-- @param str a string
-- @param step If given, returns the step-th successor of the given string. Defaults to 1 if not given.
-- @return a string
-- @usage <pre class='example'> 
-- _.next('a') --> 'b' <br/>
-- _.next('wxy') --> 'xyz' <br/>
-- _.next('D',3) --> 'G'
-- </pre>
-- @see _.succ
function _.next(str,step) end

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