__Allen__ is a Lua library which provides a set of utilities and helpers for strings operations.
In a nutshell, __Allen__ is to strings what [Moses][] is to tables.
__Allen__ can be considered as an extension of the built-in Lua string library.<br/>
__Allen__'s API was heavily inspired by the Javascript library [Underscore.string][].

##Installation##
Put the file [Allen.lua][] inside your project folder and call it using *require* command.
It will return a table containing a set of functions.

##Usage example##

```lua
local lyrics = 'hey I just met you\nand this is crazy\nbut here is my number\nso call me maybe'
lyrics = _.lines(lyrics)
for i,line in ipairs(lyrics) do 
  line = _.capitalizeFirst(line) 
end
-- => { 'Hey I just met you',
--      'And this is crazy',
--      'But here is my number',
--      'So call me maybe'}
```

##Allen and the built-in string library##
__Allen__ provides a very handy function named *_.import*, which links Lua's native string library with __Allen__'s functions.

```lua
_.import()
print(string.capitalize('hello'))
print(('Hello'):splice(2,2,'r'))
```

##About Lua Operators##
Once __Allen__ is called inside your projet,it enables the use of arithmetic operators on strings by default.<br/>
Compatible operators are : __+,*,/,%,^,-.__

* Addition operator (+) : concatenates two strings
* Unary operator (-) : reverses a string
* Multiplication operator (*) : repeats a string
* Power operator (^) : also repeats a string
* Division operator (/) : used for chopping strings (dividing it in subsets strings)
* Modulo operator (%) : returns the remainder subset string after a chopping process.

##Strings Indexing##
Using __Allen__, strings can be indexed, like regular Lua tables.

```lua
for i = 1,5 do 
  print(('Accessing %s[%d] :'):format('Hello',i),('Hello')[i]) 
end
-- => Accessing Hello[1] :	H
-- => Accessing Hello[2] :	e
-- => Accessing Hello[3] :	l
-- => Accessing Hello[4] :	l
-- => Accessing Hello[5] :	o
```

##Strings as functions##
Once __Allen__ is loaded inside a project, strings can be called as functions.

```lua 
local s = 'Hello'
print(s()) --> 'Hello'
```
	
Passing a positive number <tt>i</tt> as the first argument will return the character at the corresponding index

```lua
local s = 'Hello'
print(s(2)) --> 'e'
```
	
Passing a number <tt>j</tt> as a second argument will return the substring between <tt>i</tt> and <tt>j</tt>

```lua
local s = 'Hello'
print(s(2,4)) --> 'ell'
```
	
Passing a character as a second argument will replace the character at index <tt>i</tt>

```lua
local s = 'Helo'
print(s(3,'r')) --> 'Hero'
```

See [Allen_StringOp_Snippets.lua][] for more details.
	
##API Overview##
__Allen__ offers a lot of functions, iterators to operate on strings.<br/>
A fully complete documentation, with usage examples can be found here : [Documentation][]<br/>
Some usage examples can be found here : [Allen_Lib_Snippets.lua][] and [Allen_StringOp_Snippets.lua][]

##Credits and Thanks##
[Esa-Matti Suuronen][] and [Edward Tsech][], for the amazing [Underscore.string][]

##License##
This work is under [MIT-LICENSE][]<br/>
Copyright (c) 2012 Roland Yonaba

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

[Underscore.string]: https://github.com/epeli/underscore.string
[Moses]: https://github.com/Yonaba/Moses
[Allen.lua]: https://github.com/Yonaba/Allen/blob/master/Lib/Allen.lua
[Documentation]: https://github.com/Yonaba/Allen/blob/master/Documentation
[Allen_Lib_Snippets.lua]: https://github.com/Yonaba/Allen/blob/master/Allen_Lib_Snippets.lua
[Allen_StringOp_Snippets.lua]: https://github.com/Yonaba/Allen/blob/master/Allen_StringOp_Snippets.lua
[Esa-Matti Suuronen]: https://github.com/epeli
[Edward Tsech]: https://github.com/edtsech
[MIT-LICENSE]: http://www.opensource.org/licenses/mit-license.php

[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/Yonaba/allen/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

