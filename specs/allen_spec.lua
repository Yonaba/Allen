local _ = require 'allen'

context('The module', function()
  local array_equal
  
  before(function()
    array_equal = function(t1, t2)
      for i,v in ipairs(t1) do
        if v ~= t2[i] then return false end
      end
      return true
    end
  end)

  context('capitalizeFirst', function()
  
    test('caps the first character in a given string', function()
      assert_equal(_.capitalizeFirst('hello'),'Hello')
      assert_equal(_.capitalizeFirst('heLLo'),'HeLLo')
      assert_equal(_.capitalizeFirst('fOO'),'FOO')
    end)
    
    test('accepts empty strings', function()
      assert_equal(_.capitalizeFirst(''),'')
    end)
    
  end)
  
  context('capitalize', function()
  
    test('caps substring i to j in a given string', function()
      assert_equal(_.capitalize('hello',2,4),'hELLo')
    end)

    test('when not given, j defaults to the string length', function()
      assert_equal(_.capitalize('hello',2),'hELLO')
    end)    
    
    test('when not given, i defaults to 1', function()
      assert_equal(_.capitalize('hello'),'HELLO')
    end) 
    
    test('accepts negative indices that be counted from the right', function()
      assert_equal(_.capitalize('hello',-3),'heLLO')
    end)
    
    test('accepts empty strings', function()
      assert_equal(_.capitalize(''),'')
    end) 
    
  end)  

  context('capitalizesEach', function()
  
    test('caps the first char in each words', function()
      assert_equal(_.capitalizesEach('hello foo bar'),'Hello Foo Bar')
    end)

    test('words delimiters are non alphanumeric chars', function()
      assert_equal(_.capitalizesEach('hello,foo.bar-foo foo'),'Hello,Foo.Bar-Foo Foo')
    end)   
    
  end)  

  context('lowerFirst', function()
  
    test('lowers first char case in a given string', function()
      assert_equal(_.lowerFirst('Foo'),'foo')
      assert_equal(_.lowerFirst('HELLO'),'hELLO')
      assert_equal(_.lowerFirst('HeLlO'),'heLlO')
    end)
    
    test('accepts empty strings', function()
      assert_equal(_.lowerFirst(''),'')
    end)     
    
  end)  
  
  context('lower', function()
  
    test('lowers substring i to j in a given string', function()
      assert_equal(_.lower('HELLO',2,4),'HellO')
    end)

    test('when not given, j defaults to the string length', function()
      assert_equal(_.lower('HELLO',2),'Hello')
    end)    
    
    test('when not given, i defaults to 1', function()
      assert_equal(_.lower('HELLO'),'hello')
    end) 
    
    test('accepts negative indices (counting right-to-left)', function()
      assert_equal(_.lower('HELLO',-2),'HELlo')
    end)
    
    test('accepts empty strings', function()
      assert_equal(_.lower(''),'')
    end)  
    
  end)

  context('isLower', function()
  
    test('checks if the given string is lowercase', function()
      assert_true(_.isLower('hello'))
      assert_false(_.isLower('HELLO'))
    end)
    
    test('Returns false when any uppercase char is found', function()
      assert_false(_.isLower('heLlo'))
    end)
    
    test('Returns true with empty strings', function()
      assert_true(_.isLower(''))
    end)    

    test('Accepts sentences with delimiters aswell', function()
      assert_true(_.isLower('hello.foo/bar,foo-bar'))
    end)
    
  end)

  context('isUpper', function()
  
    test('checks if the given string is uppercase', function()
      assert_false(_.isUpper('hello'))
      assert_true(_.isUpper('HELLO'))
    end)
    
    test('Returns false when any lowercase char is found', function()
      assert_false(_.isUpper('heLlo'))
    end)
    
    test('Returns true with empty strings', function()
      assert_true(_.isUpper(''))
    end)    

    test('Accepts sentences with delimiters aswell', function()
      assert_true(_.isUpper('HELLO.FOO/BAR,FOO-BAR'))
    end) 
    
  end)

  context('startsLower', function()
  
    test('checks if the given string is starts with a lowercase char', function()
      assert_true(_.startsLower('hello'))
      assert_false(_.startsLower('Hello'))
      assert_false(_.startsLower('HELLO'))
    end)
    
    test('Returns true with empty strings', function()
      assert_true(_.startsLower(''))
    end)
   
  end)
  
  context('startsUpper', function()
  
    test('checks if the given string is starts with an uppercase char', function()
      assert_false(_.startsUpper('hello'))
      assert_false(_.startsUpper('hELLO'))
      assert_true(_.startsUpper('HELLO'))
      assert_true(_.startsUpper('Hello'))
    end)
    
    test('Returns true with empty strings', function()
      assert_true(_.startsUpper(''))
    end)
    
  end)

  context('swapCase', function()
  
    test('Swaps each char case in substring i-j', function()
      assert_equal(_.swapCase('hello',2,4),'hELLo')
      assert_equal(_.swapCase('AlTeRnAtE',3,7),'AltErNatE')
    end)
    
    test('"j" defaults to the string length when not given', function()
      assert_equal(_.swapCase('hello',2),'hELLO')
    end)

    test('"i" defaults to 1 when not given', function()
      assert_equal(_.swapCase('hello'),'HELLO')
    end)
    
    test('accepts negative indices (counting right-to-left)', function()
      assert_equal(_.swapCase('hello', -3),'heLLO')
    end)    
       
    test('accepts empty strings', function()
      assert_equal(_.swapCase(''),'')
    end)
    
  end)  
   
  context('isAlpha', function()
  
    test('Checks if the given string contains only alphabetic letters', function()
      assert_true(_.isAlpha('hello'))
      assert_true(_.isAlpha('foo'))
      assert_true(_.isAlpha('bar'))
    end)
    
    test('Returns false if any non-alphabetic letter was found', function()
      assert_false(_.isAlpha('hel lo'))
      assert_false(_.isAlpha('foo.bar'))
      assert_false(_.isAlpha('foo1'))
    end)    
    
  end)

  context('index', function()
  
    test('Indexes in a given string', function()
      assert_equal(_.index('foo',2),'o')
      assert_equal(_.index('hello',1),'h')
      assert_equal(_.index('bar',3),'r')
    end)
    
    test('Accepts negative indices (counting left-to-right)', function()
      assert_equal(_.index('foo',-3),'f')
      assert_equal(_.index('bar',-1),'r')
    end)    
    
    test('Indexing out-of-range returns nil', function()
      assert_nil(_.index('foo',10))
      assert_nil(_.index('bar',-10))
    end)    
    
  end)  

  context('levenshtein', function()
  
    test('Evaluates levenshtein distance between two strings', function()
      assert_equal(_.levenshtein('Godfather', 'Godfather'), 0)
      assert_equal(_.levenshtein('Godfather', 'Godfathe'), 1)
      assert_equal(_.levenshtein('Godfather', 'odfather'), 1)
      assert_equal(_.levenshtein('Godfather', 'Gdfthr'), 3)
      assert_equal(_.levenshtein('seven', 'eight'), 5)
    end)
    
    test('Accepts empty strings', function()
      assert_equal(_.levenshtein('', ''), 0)
    end)        
  end)  

  context('chop', function()
    
    test('split a string into an array of substrings', function()
      assert_true(array_equal(_.chop('aString',2),{'aS','tr','in','g'}))
      assert_true(array_equal(_.chop('aLongerString',3),{'aLo','nge','rSt','rin','g'}))
    end)
    
    test('Arg "step" defaults to 1 when not given', function()
      assert_true(array_equal(_.chop('lua'),{'l','u','a'}))
    end)
           
  end)

  context('clean', function()
    
    test('Cleans occurences matching a pattern in a given string', function()
      assert_equal(_.clean('Lua','%u'),'ua')
      assert_equal(_.clean('Foobar','oo+'),'Fbar')
    end)
    
    test('When arg "pat" is undefined, removes all non alphanumeric chars', function()
      assert_equal(_.clean('Lua'),'Lua')
      assert_equal(_.clean('H_ e\nl\rl^o 007'),'Hello007')
    end)   
           
  end)

  context('escape', function()
    
    test('Escapes any magic char found (^$()%.[]*+-?) in a given string', function()
      assert_equal(_.escape('Hel%-l^(o)'),'Hel%%%-l%^%(o%)')
    end)
           
  end)

  context('substitute', function()
    
    test('Performs string interpolation', function()
      local name = 'John'
      assert_equal(_.substitute("My name is ${name}",name),"My name is John")
      assert_equal(_.substitute("My name is $var",name),"My name is John")
    end)
           
  end)

  context('includes', function()
    
    test('Checks if a given string includes a substring', function()
      assert_true(_.includes('String','in'))
      assert_true(_.includes('Foo','oo'))
    end)
    
    test('Accepts pattern matching strings', function()
      assert_true(_.includes('String','^%u'))
      assert_true(_.includes('String','%l$'))
    end)
    
    test('Any string contains the empty char', function()
      assert_true(_.includes('String',''))
    end)    
           
  end)

  context('chars', function()
    
    test('Converts a given string to an array of chars', function()
      assert_true(array_equal(_.chars('foo'),{'f','o','o'}))
    end)
    
    test('Returns nil when given an empty string', function()
      assert_nil(_.chars(''))
    end)

  end)
	
	context('isEmail', function()
	
		test('Tests if the input matches a valid email address', function()
			assert_true(_.isEmail('a.b@c.de'))
			assert_true(_.isEmail('a_b@c.de'))
			assert_true(_.isEmail('_@_.aa'))
			assert_false(_.isEmail('@'))
			assert_false(_.isEmail('.@.'))
			assert_false(_.isEmail('.@.dd'))
			assert_false(_.isEmail('@.dd'))
			assert_false(_.isEmail('a.com'))
		end)
	
	end)
  
  context('count', function()
    
    test('Counts occurences of substring in a given string', function()
      assert_equal(_.count('Betty Butter bought a bit of butter.','t'),8)
      assert_equal(_.count('Betty Butter bought a bit of butter.','b'),3)
    end)
    
    test('Accepts pattern matching strings', function()
      assert_equal(_.count('A bubbling bubble.','[bB]%w+'),2)
    end)

  end)   

  context('insert', function()
    
    test('inserts a substring at a given position', function()
      assert_equal(_.insert('BB','o',2),'BoB')
      assert_equal(_.insert('Am Gram','Stram ',4),'Am Stram Gram')
    end)
    
    test('index is capped between 1 and the string length when out-of-range', function()
      assert_equal(_.insert('BB','o',0),'oBB')
      assert_equal(_.insert('BB','o',-5),'oBB')
      assert_equal(_.insert('BB','o',4),'BBo')
      assert_equal(_.insert('BB','o',10),'BBo')
    end)    

  end)
  
  context('isBlank', function()
    
    test('Returns true when given a string with non alphanumeric chars', function()
      assert_true(_.isBlank('_- :\/#`|~&'))
      assert_false(_.isBlank('_a'))
    end)

  end)
  
  context('join', function()
    
    test('Concatenates args with a given separator', function()
      assert_equal(_.join(', ','a','b','c'),'a, b, c')
      assert_equal(_.join(' ','d','e','f'),'d e f')
    end)

    test('Accepts numbers aswell', function()
      assert_equal(_.join(', ','a',1,2),'a, 1, 2')
      assert_equal(_.join(' ',3,4,'f'),'3 4 f')
    end)
    
  end)

  context('lines', function()
    
    test('splits a given string into lines (using EOL chars as delimiters)', function()
      assert_true(array_equal(_.lines('a\nb\nc'),{'a','b','c'}))
      assert_true(array_equal(_.lines('a\rb\rc'),{'a','b','c'}))
      assert_true(array_equal(_.lines('a\rb\n\rc'),{'a','b','c'}))
    end)
    
    test('returns nil when given empty strings',function()
      assert_nil(_.lines(''))
    end)

    test('returns nil when given only EOL chars',function()
      assert_nil(_.lines('\n'))
      assert_nil(_.lines('\r'))
      assert_nil(_.lines('\r\n'))
      assert_nil(_.lines('\n\r'))
    end)
    
    test('returns the given string when no EOL chars was found',function()
      assert_equal(_.lines('FooBar'),'FooBar')
      assert_equal(_.lines('Foo\\nBar'),'Foo\\nBar')
      assert_equal(_.lines('Foo\\n\\rBar'),'Foo\\n\\rBar')
    end)    
    
  end)   

  context('splice', function()
    
    test('replaces chars in a given string', function()
      local url = 'http://root@admin.com'      
      assert_equal(_.splice(url,12,5,'localhost'),'http://root@localhost.com')
    end)
    
  end)

  context('startsWith', function()
    
    test('Checks if a string starts with a given substring', function()
      assert_true(_.startsWith('Hello','Hel'))
      assert_true(_.startsWith('Foo','F'))
      assert_true(_.startsWith('Bar','Bar'))
      assert_false(_.startsWith('Hello','hel'))
    end)
    
    test('Accepts pattern matching strings', function()
      assert_true(_.startsWith('Hello','%u'))
      assert_true(_.startsWith('foo','%l'))
      assert_false(_.startsWith('2bar','%a'))
    end)    
    
  end)   

  context('endsWith', function()
    
    test('Checks if a string ends with a given substring', function()
      assert_true(_.endsWith('Hello','llo'))
      assert_true(_.endsWith('Foo','o'))
      assert_true(_.endsWith('Bar','ar'))
      assert_false(_.endsWith('Bar','rr'))
    end)
    
    test('Accepts pattern matching strings', function()
      assert_true(_.endsWith('Hello','%l'))
      assert_true(_.endsWith('foo','[o]+'))
      assert_true(_.endsWith('bar2','%d'))
      assert_false(_.endsWith('bar2','%a'))
    end)    
    
  end) 

  context('succ', function()
    
    test('Returns the successor of a given char according to its ASCII code', function()
       assert_equal(_.succ('a'),'b')
       assert_equal(_.succ('A'),'B')
       assert_equal(_.succ('8'),'9')
       assert_equal(_.succ('.'),'/')
    end)

    test('When given a string, returns a concatenation of each char successor', function()
       assert_equal(_.succ('abc'),'bcd')
       assert_equal(_.succ('01234'),'12345')
       assert_equal(_.succ('.+-_/'),'/,.`0')
    end)    

    test('When given arg "n", returns the n-th successor', function()
       assert_equal(_.succ('a',2),'c')
       assert_equal(_.succ('01234',3),'34567')
    end)
    
    test('Casting a successor out of ASCII range yields an error', function()
      assert_error(pcall(_.succ,'a',159))
    end)
    
  end)
  
  context('pre', function()
    
    test('Returns the predecessor of a given char according to its ASCII code', function()
       assert_equal(_.pre('b'),'a')
       assert_equal(_.pre('B'),'A')
       assert_equal(_.pre('8'),'7')
       assert_equal(_.pre('/'),'.')
    end)

    test('When given a string, returns a concatenation of each char predecessor', function()
      assert_equal(_.pre('def'),'cde')
      assert_equal(_.pre('12345'),'01234')
      assert_equal(_.pre('/,.`0'),'.+-_/') 
    end)    

    test('When given arg "n", returns the n-th successor', function()
      assert_equal(_.pre('a',2),'_')
      assert_equal(_.pre('01234',3),'-./01')
    end)
    
    test('Casting a predecessor out of ASCII range yields an error', function()
      assert_error(pcall(_.pre,'a',98))
    end)
    
  end)   

  context('titleize', function()
    
    test('Title-izes a string, using space char to delimit words', function()
       assert_equal(_.titleize('hello foo bar'),'Hello Foo Bar')
       assert_equal(_.titleize('hello foo, bar'),'Hello Foo, Bar')
    end)
    
  end)

  context('underscored', function()
    
    test('converts a string to underscored-style', function()
      assert_equal(_.underscored('the-underscored-string-method'), 'the_underscored_string_method')
      assert_equal(_.underscored('theUnderscoredStringMethod'), 'the_underscored_string_method')
      assert_equal(_.underscored('TheUnderscoredStringMethod'), 'the_underscored_string_method')
      assert_equal(_.underscored(' the underscored  string method'), 'the_underscored_string_method')
    end)
    
  end)
  
  context('dasherized', function()
    
    test('converts a string to dasherized-style', function()
      assert_equal(_.dasherize('the_dasherize_string_method'), 'the-dasherize-string-method')
      assert_equal(_.dasherize('TheDasherizeStringMethod'), '-the-dasherize-string-method')
      assert_equal(_.dasherize('thisIsATest'), 'this-is-a-test')
      assert_equal(_.dasherize('this Is A Test'), 'this-is-a-test')
      assert_equal(_.dasherize('thisIsATest123'), 'this-is-a-test123')
      assert_equal(_.dasherize('123thisIsATest'), '123this-is-a-test')
      assert_equal(_.dasherize('the dasherize string method'), 'the-dasherize-string-method')
      assert_equal(_.dasherize('the  dasherize string method  '), 'the-dasherize-string-method')
      assert_equal(_.dasherize('téléphone'), 'téléphone')
      assert_equal(_.dasherize('foo$bar'), 'foo$bar')
    end)
    
  end)
	--[[
  context('humanized', function()
    
    test('converts a string to humanized-style', function()
      assert_equal(_.humanize('the_humanize_string_method'), 'The humanize string method')
      assert_equal(_.humanize('ThehumanizeStringMethod'), 'Thehumanize string method')
      assert_equal(_.humanize('the humanize string method'), 'The humanize string method')
      assert_equal(_.humanize('the humanize_id string method_id'), 'The humanize id string method')
      assert_equal(_.humanize('the  humanize string method  '), 'The humanize string method')
      assert_equal(_.humanize('   capitalize dash-CamelCase_underscore trim  '), 'Capitalize dash camel case underscore trim')
    end)
    
  end)   
   --]]
	 
	context('numberFormat', function()
		
			test('formats a number to a string', function()
				assert_equal(_.numberFormat(25),'25')
				assert_equal(_.numberFormat(-5),'-5')
			end)
			
			test('Can convert to a string with a specific number of decimals with rounding', function()
				assert_equal(_.numberFormat(25,2),'25.00')
				assert_equal(_.numberFormat(-100,5),'-100.00000')
				assert_equal(_.numberFormat(18.5789,4),'18.5789')
				assert_equal(_.numberFormat(18.5789,5),'18.57890')
				assert_equal(_.numberFormat(18.5769,3),'18.577')
				assert_equal(_.numberFormat(18.5759,3),'18.576')
				assert_equal(_.numberFormat(18.5749,3),'18.575')
				assert_equal(_.numberFormat(18.5749,2),'18.57')
			end)			
			
			test('supports custom thousand separator', function()
				assert_equal(_.numberFormat(2500,0,' '),'2 500')
				assert_equal(_.numberFormat(-2500, 2,' ',','),'-2 500,00')
			end)

			test('Minus sign can be customized for negative numbers', function()
				assert_equal(_.numberFormat(-8546.254, 4,',','.','NEG '),'NEG 8,546.2540')
			end)				
	
	end)
end)