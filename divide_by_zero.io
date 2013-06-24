assertTrue := method(test_name, condition, 
	if(condition == true) then(
		writeln(test_name .. " passed")
	) else(
		writeln(test_name .. " failed")
	)
)

"Assert tests\n===" println
assertTrue("true should pass a test of assertTrue", true)
assertTrue("false should fail a test of assertTrue", false)

assertEqual := method(test_name, condition, value, 
	if(condition == value) then(
		writeln(test_name .. " passed")
	) else(
		writeln(test_name .. " should have been " .. value .. " but returned " .. condition) 
	)
)

"\nassertEqual tests\n===" println
assertEqual("1 should be equal to 1", 1, 1)
assertEqual("1+1 should be equal to 2", 1+1, 2)

# Need to save original divide operator
Number setSlot("divide", Number getSlot("/"))

Number setSlot("/", method(d, 
	if(d == 0, 0, self divide(d))
))

"\nDivide by zero tests\n===" println
assertEqual("Three divided by one should be three", 3 / 1, 3)
assertEqual("Four divided by minus two should be minus two", 4 / -2, -2)
assertEqual("Two divided by zero should be zero", 4 / 0, 0)

