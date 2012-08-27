--------------------------------------------------------------------------
-- @author Roland Yonaba
-- @release $Id: Allen.lua,v1.1 08/05/2012 Roland_Yonaba$
--------------------------------------------------------------------------

-- Copyright (c) 2012 Roland Yonaba

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

-- Load dependancies in the global environnement,
-- To be accessed by variables created with loadstring
_ = require 'Lib.Allen'

-- Internalization
local t_insert = table.insert
local loadstring = loadstring

-------------------------------------------------
-- Helpers for tests runnings

local snippets = {}
local topics = {}

-- Adds a new snippet
local function addSnippet(topic,snippet)
  t_insert(topics,topic)
  t_insert(snippets,snippet)
end

-- Resets snippets list
local function reset()
  snippets = {}
  topics = {}
end

-- Run all tests
local function run()
  for i,snippet in ipairs(snippets) do
    print(i..'. Function name : '..topics[i])
    print('\nExample : \n\n'..snippet)
    print('\n--- Output : --- \n')
    loadstring(snippet)()
    print('\n')
  end
end


-------------------------------------------------
-- Library defined-functions

print(' ==== Library Functions ==== \n')


addSnippet('_.capitalizeFirst(str)',
[[print(_.capitalizeFirst('uncapitalized'))
print(_.capitalizeFirst('Capitalized'))
]])

addSnippet('_.capFirst(str)',
[[print(_.capFirst('uncapitalized'))
print(_.capFirst('Capitalized'))
]])

addSnippet('_.capitalize(str,i,j)',
[[print(_.capitalize('capitalized'))
print(_.capitalize('capitalized',5,9))
print(_.capitalize('capitalized',-8))
]])

addSnippet('_.cap(str,i,j)',
[[print(_.cap('capitalized'))
print(_.cap('capitalized',5,9))
print(_.cap('capitalized',-8))
]])

addSnippet('_.capitalizesEach(str)',
[[print(_.capitalizesEach('my tailor is rich'))]])

addSnippet('_.capEach(str)',
[[print(_.capEach('my tailor is rich'))]])

addSnippet('_.caps(str)',
[[print(_.caps('my tailor is rich'))]])


addSnippet('_.lowerFirst(str)',
[[print(_.lowerFirst('HIGH'))
]])


addSnippet('_.lower(str,i,j)',
[[print(_.lower('HIGHER'))
print(_.lower('HIGHER',2,4))
print(_.lower('HIGHER',-3))
]])

addSnippet('_.isLower(str)',
[[print(_.isLower('String'))
print(_.isLower('strinG'))
print(_.isLower('string'))
]])

addSnippet('_.isLowerCase(str)',
[[print(_.isLowerCase('String'))
print(_.isLowerCase('strinG'))
print(_.isLowerCase('string'))
]])

addSnippet('_.isUpper(str)',
[[print(_.isUpper('String'))
print(_.isUpper('sTRinG'))
print(_.isUpper('STRING'))
]])

addSnippet('_.isUpperCase(str)',
[[print(_.isUpperCase('String'))
print(_.isUpperCase('sTRinG'))
print(_.isUpperCase('STRING'))
]])


addSnippet('_.startsLower(str)',
[[print(_.startsLower('String'))
print(_.startsLower('sTRinG'))
]])

addSnippet('_.startsLowerCase(str)',
[[print(_.startsLowerCase('String'))
print(_.startsLowerCase('sTRinG'))
]])

addSnippet('_.startsUpper(str)',
[[print(_.startsUpper('sTRinG'))
print(_.startsUpper('StiNG'))
]])

addSnippet('_.startsUpperCase(str)',
[[print(_.startsUpperCase('sTRinG'))
print(_.startsUpperCase('StiNG'))
]])

addSnippet('_.swapCase(str)',
[[print(_.swapCase('AlTeRnAtE'))
print(_.swapCase('AlTeRnAtE',3,7))
print(_.swapCase('AlTeRnAtE',-4))
]])

addSnippet('_.isAlpha(str)',
[[print(_.isAlpha('text'))
print(_.isAlpha('text1'))
print(_.isAlpha('te xt~'))
]])

addSnippet('_.isNumeric(str)',
[[print(_.isNumeric('1e20'))
print(_.isNumeric('-33.2a'))
]])

addSnippet('_.isAlphaNumeric(str)',
[[print(_.isAlphaNumeric('-33.2a'))]])

addSnippet('_.isHex(str)',
[[print(_.isHex('-33.2'))
print(_.isHex('FDA'))
]])

addSnippet('_.isHexadecimal(str)',
[[print(_.isHex('-33.2'))
print(_.isHex('FDA'))
]])

addSnippet('_.index(str,i)',
[[print(_.index('Hello',2))
print(('Hello')[2])
print(_.index('Hello',10))
]])

addSnippet('_.charAt(str,i)',
[[print(_.charAt('Hello',2))
print(_.charAt('Hello',10))
]])

addSnippet('_.isEmail(str)',
[[print(_.isEmail('@'))
print(_.isEmail('.com'))
print(_.isEmail('a@com'))
print(_.isEmail('~user..nm.@web.co.uk'))
print(_.isEmail('user.nm@web.co.uk'))
]])


addSnippet('_.levenshtein(strA,strB)',
[[print(_.levenshtein('test','text'))
print(_.levenshtein('rich','chinese'))
]])

addSnippet('_.chop(str,step)',
[[table.foreach(_.chop('test',2),print)
table.foreach(_.chop('aLongerString',3),print)
]])

addSnippet('_.clean(str,pat)',
[[print(_.clean('H_; e\nl\rl^o'))
]])

addSnippet('_.trim(str,pat)',
[[print(_.trim('H_; e\nl\rl^o'))
]])

addSnippet('_.escape(str)',
[[print(_.escape('Hel%-l^(o)'))
]])

addSnippet('_.esc(str)',
[[print(_.esc('Hel%-l^(o)'))
]])

addSnippet('_.substitute(str,value)',
[[local x,y = 0,0
print(_.substitute("x = ${x}",x))
print(_.substitute("y = $y",y))
]])

addSnippet('_.subst(str,value)',
[[local x,y = 0,0
print(_.subst("x = ${x}",x))
print(_.subst("y = $y",y))
]])

addSnippet('_.includes(str,sub)',
[[print(_.includes('Programming','mmi'))
]])

addSnippet('_.chars(str)',
[[local t = _.chars('array')
table.foreach(t,print)
]])

addSnippet('_.explode(str)',
[[local t = _.explode('array')
table.foreach(t,print)
]])

addSnippet('_.count(str,sub)',
[[print(_.count('Betty Butter bought a bit of butter.','tt'))
]])


addSnippet('_.insert(str,index,substring)',
[[print(_.insert('Am Gram',3,'Stram '))
]])

addSnippet('_.isBlank(str)',
[[print(_.isBlank('_a;'))
print(_.isBlank('_- :\/#`|~&'))
]])

addSnippet('_.join(sep,...)',
[[print(_.join(' ','a','b','c','d','e','f','g','h'))
print(_.join(',','a','b','c','d','e'))
]])

addSnippet('_.lines(str)',
[[local text = 'FirstLine\nSecondLine\rThirdLine'
local lines = _.lines(text)
table.foreach(lines,print)
]])

addSnippet('_.splice(str,index,howMany,substring)',
[[local url = 'http://root@admin.com'
print(_.splice(url,12,5,'localhost'))
]])

addSnippet('_.startsWith(str,starts)',
[[local url = 'http://local@localhost.com'
print(_.startsWith(url,'http'))
print(_.startsWith(url,'http*'))
print(_.startsWith(url,'%l'))
]])

addSnippet('_.endsWith(str,ends)',
[[local email = 'local@localhost.com'
print(_.endsWith(email,'com'))
print(_.endsWith(email,'.%w+'))
]])

addSnippet('_.succ(str)',
[[print(_.succ('a'))
print(_.succ('wxy'))
print(_.succ('D',3))
]])

addSnippet('_.next(str)',
[[print(_.next('a'))
print(_.next('wxy'))
print(_.next('D',3))
]])

addSnippet('_.pre(str)',
[[print(_.pre('Z',4))
print(_.pre('defijk'))
]])

addSnippet('_.titleize(str)',
[[print(_.titleize('my tailor is rich'))
]])

addSnippet('_.camelize(str)',
[[print(_.camelize('a_class'))
print(_.camelize('the-object'))
print(_.camelize('one-level_up'))
]])

addSnippet('_.underscored(str)',
[[print(_.underscored('a_class'))
print(_.underscored('The---Whole----Object'))
print(_.underscored('One-LevelUp'))
]])

addSnippet('_.dasherized(str)',
[[print(_.dasherized('a_class'))
print(_.dasherized('The---Whole----Object'))
print(_.dasherized('One-LevelUp'))
]])

addSnippet('_.humanized(str)',
[[print(_.humanized('A__--Test'))
print(_.humanized('anotherTest'))
print(_.humanized('one-level_up'))
]])

addSnippet('_.words(str)',
[[print(_.words('my tailor is rich'))
]])

addSnippet('_.pad(str,length,padStr,side)',
[[print(_.pad('1',8,'0','both'))
print(_.pad('1',8,'0','left'))
print(_.pad('1',8,'0','right'))
]])

addSnippet('_.lpad(str,length,padStr)',
[[print(_.lpad('1',8,'0'))
]])

addSnippet('_.rpad(str,length,padStr)',
[[print(_.rpad('1',8,'0'))
]])

addSnippet('_.lrpad(str,length,padStr)',
[[print(_.lrpad('1',8,'0'))
]])

addSnippet('_.strRight(str,pattern)',
[[print(_.strRight('hi dude','%s'))
print(_.strRight('www.internet.com','%w+.'))
]])

addSnippet('_.strRightBack(str,length,padStr)',
[[print(_.strRightBack('how are you doing','%s'))
print(_.strRightBack('hello.com@internet.com.net','.com'))
]])

addSnippet('_.strLeft(str,length,padStr)',
[[print(_.strLeft('hi dude','%s'))
print(_.strLeft('how are you doing','%s'))
]])

addSnippet('_.strLeftBack(str,length,padStr)',
[[print(_.strLeftBack('hi dude','%s'))
print(_.strLeftBack('how are you doing','%s'))
]])

addSnippet('_.toSentence(array,delimiter, lastDelimiter)',
[[local arrayOfWords = {'banana','apple','mango','tomato','lemon'}
print(_.toSentence(arrayOfWords))
print(_.toSentence(arrayOfWords,'.'))
print(_.toSentence(arrayOfWords,'.','. '))
]])

addSnippet('_.rep(str,count,sep',
[[print(_.rep('Charlie',3))
print(_.rep('Tango',4,','))
]])

addSnippet('_.surround(str,wrap)',
[[print(_.surround('......','@'))
]])

addSnippet('_.quote(str)',
[[print('- I am Billy.')
print('- Billy '.._.quote('The Kid')..' ?')
]])

addSnippet('_.bytes(str)',
[[table.foreach(_.bytes('a'),print)
table.foreach(_.bytes('hello'),print)
]])

addSnippet('_.byteAt(str,i)',
[[local str = 'Hello'
for i = 1,#str do
  print(_.byteAt(str,i))
end
]])

addSnippet('_.isLuaKeyword(str)',
[[print(_.isLuaKeyword("and"))
print(_.isLuaKeyword("then"))
]])

addSnippet('_.isLuaKword(str)',
[[print(_.isLuaKword("false"))
print(_.isLuaKword("do"))
]])

addSnippet('_.isReserved(str)',
[[print(_.isReserved("if"))
print(_.isReserved("end"))
]])

addSnippet('_.isToken(str)',
[[print(_.isToken("%"))
print(_.isToken(">="))
print(_.isToken(".."))
]])

addSnippet('_.isOperator(str)',
[[print(_.isOperator("/"))
print(_.isOperator("<"))
print(_.isOperator("+"))
]])

addSnippet('_.isOp(str)',
[[print(_.isOp("-"))
print(_.isOp("{"))
print(_.isOp("]"))
]])

addSnippet('_.isIdentifier(str)',
[[print(_.isIdentifier("1x"))
print(_.isIdentifier("x_1"))
print(_.isIdentifier("_"))
]])

addSnippet('_.isIden(str)',
[[print(_.isIden("var"))
print(_.isIden("else"))
print(_.isIden("Else"))
]])

addSnippet('_.isName(str)',
[[print(_.isName("then"))
print(_.isName("_my_"))
]])

addSnippet('_.is(var,expectedType)',
[[print(_.is(nil,'nil'))
print(_.is({}))
print(_.is(false,'true'))
]])

addSnippet('_.statistics(str,pat)',
[[local t = _.statistics('Hello')
table.foreach(t,print)
t = _.statistics('my tailor is rich','%w+')
table.foreach(t,print)
]])

addSnippet('_.stats(str,pat)',
[[local t = _.stats('Hello')
table.foreach(t,print)
t = _.stats('my tailor is rich','%w+')
table.foreach(t,print)
]])

addSnippet('_.import()',
[[_.import()
print(string.capitalize('hello'))
print(('Hello'):splice(2,2,'r'))
]])


run()
reset()

print(' ==== End of tests ==== \n')
