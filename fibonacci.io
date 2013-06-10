assertTrue := method(test_name, condition, 
	if(condition == true) then(
		writeln(test_name .. " passed")
	) else(
		writeln(test_name .. " failed")
	)
)

assertTrue("true should pass a test of assertTrue", true)
assertTrue("false should fail a test of assertTrue", false)

Fibonacci := method(number,
	1
)

assertTrue("The first Fibonacci number should be 1", (Fibonacci(1) == 1))
