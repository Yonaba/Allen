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

-- Loading dependancy
local _ = require 'Lib.Allen'

print(' ==== Testing strings With Operators ==== \n')

print("'+' Operator concatenates strings. It is NOT commutative.")
print('Hi' + ' Johnny')

print("\n'*' Operator repeats a given string. It is commutative.")
print(('Go! ') * 3)
print(4 * ('Coming! '))

print("\n'^' Operator repeats a given string. It is NOT commutative.")
print('Go! ' ^3)

print("\n'/' Operator chops a given string. It is NOT commutative.")
table.foreach('Lua'/1,print)
table.foreach('Programming'/3,print)

print("\n'%' Operator returns the remaining letters after chopping a given string. It is NOT commutative.")
print('Programming'%3)

print("\n'-' Operator reverses a given string. It is NOT commutative.")
print(-'Lua')
