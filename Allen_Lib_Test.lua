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

addSnippet('_.capitalize(str,i,j)',
[[print(_.capitalize('capitalized'))
print(_.capitalize('capitalized',5,9))
print(_.capitalize('capitalized',-8))
]])

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

addSnippet('_.isUpper(str)',
[[print(_.isUpper('String'))
print(_.isUpper('sTRinG'))
print(_.isUpper('STRING'))
]])

addSnippet('_.startsLower(str)',
[[print(_.startsLower('String'))
print(_.startsLower('sTRinG'))
]])

addSnippet('_.startsUpper(str)',
[[print(_.startsUpper('sTRinG'))
print(_.startsUpper('StiNG'))
]])

addSnippet('_.swapCase(str)',
[[print(_.swapCase('AlTeRnAtE'))
print(_.swapCase('AlTeRnAtE',3,7))
print(_.swapCase('AlTeRnAtE',-4))
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

addSnippet('_.includes(str,sub)',
[[print(_.includes('Programming','mmi'))
]])

addSnippet('_.chars(str)',
[[local t = _.chars('array')
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

addSnippet('_.import()',
[[_.import()
print(string.capitalize('hello'))
print(('Hello'):splice(2,2,'r'))
]])


run()
reset()

print(' ==== End of tests ==== \n')
