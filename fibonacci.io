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


# Recursive method for Fibonacci numbers
#
fibonacci := method(number,
	if(number <= 0, return 0)
	if(number == 1 or number == 2, return 1)
	return (fibonacci(number - 1) + fibonacci(number - 2))
)

"\nFibonacci numbers using the recursive method\n===" println
assertTrue("The first fibonacci number should be 1", (fibonacci(1) == 1))
assertTrue("The second fibonacci number should be 1", (fibonacci(2) == 1))
assertTrue("The third fibonacci number should be 2", (fibonacci(3) == 2))
assertTrue("The fourth fibonacci number should be 3", (fibonacci(4) == 3))
assertTrue("The fifth fibonacci number should be 5", (fibonacci(5) == 5))
assertTrue("The sixth fibonacci number should be 8", (fibonacci(6) == 8))
assertTrue("The seventh fibonacci number should be 13", (fibonacci(7) == 13))
assertTrue("The zeroth fibonacci number should be 0", (fibonacci(0) == 0))


# For method for Fibonacci numbers
#
fibonacci2 := method(number,
    if(number <= 0, return 0)
	if(number == 1 or number == 2, return 1) 
	last_fib := 1
	second_last_fib := 1
	for(i, 3, number, 1,
		running_total := last_fib + second_last_fib
		second_last_fib = last_fib
		last_fib = running_total
	)
	return running_total
)

"\nFibonacci numbers using the iterative method\n===" println
assertEqual("The zeroth fibonacci number should be 0", fibonacci2(0), 0)
assertEqual("The first fibonacci number should be 1", fibonacci2(1), 1)
assertEqual("The second fibonacci number should be 1", fibonacci2(2), 1)
assertEqual("The third fibonacci number should be 2", fibonacci2(3), 2)
assertEqual("The fourth fibonacci number should be 3", fibonacci2(4), 3)
assertEqual("The fifth fibonacci number should be 5", fibonacci2(5), 5)
assertEqual("The sixth fibonacci number should be 8", fibonacci2(6), 8)
assertEqual("The seventh fibonacci number should be 13", fibonacci2(7), 13)
assertEqual("Fibonacci number for a negative input should return zero", fibonacci2(-7), 0)

