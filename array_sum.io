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


arraySum := method(a, 
	if(a size == 0, 0, a flatten sum)
)

"\nArray sum tests\n===" println
assertEqual("Sum of an empty array should be zero", arraySum(list()), 0)
assertEqual("Sum of a one dimensional array (1, 2, 3) should be six", arraySum(list(1, 2, 3)), 6)
assertEqual("Sum of a two-dimensional array ((1,2),(3,4)) should be ten", arraySum(list(list(1,2),list(3,4))), 10)
assertEqual("Sum of a mixed-dimensional array (1, (2,3)) should be six", arraySum(list(1, list(2, 3))), 6)
