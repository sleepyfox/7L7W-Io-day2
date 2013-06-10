Test := Object clone
Test numberOfTestsRun := 0
Test numberOfTestsPassed := 0
Test numberOfTestsFailed := method(
	return self numberOfTestsRun - self numberOfTestsPassed
)

Test assertTrue := method(test_name, condition, 
	self numberOfTestsRun = self numberOfTestsRun + 1

	if(condition == true) then(
		self numberOfTestsPassed = self numberOfTestsPassed + 1
		writeln(test_name .. " passed")
		return true
	) else(
		writeln(test_name .. " failed")
		return false
	)
)

"Assert tests\n===" println
Test assertTrue("true should pass a test of assertTrue", true)
Test assertTrue("false should fail a test of assertTrue", false)
Test assertTrue("number of tests run should be two", Test numberOfTestsRun == 2)
Test assertTrue("number of tests failed should be one", Test numberOfTestsFailed == 1)

Test assertEqual := method(test_name, condition, value, 
	self numberOfTestsRun = self numberOfTestsRun + 1

	if(condition == value) then(
		self numberOfTestsPassed = self numberOfTestsPassed + 1
		writeln(test_name .. " passed")
		return true
	) else(
		writeln(test_name .. " should have been " .. value .. " but returned " .. condition) 
		return false
	)
)

"\nassertEqual tests\n===" println
Test assertEqual("1 should be equal to 1", 1, 1)
Test assertEqual("1+1 should be equal to 2", 1+1, 2)
Test assertEqual("number of tests run should be six", Test numberOfTestsRun, 6)
Test assertEqual("number of tests passed should be six", Test numberOfTestsPassed, 6)
Test assertEqual("number of tests failed should be one", Test numberOfTestsFailed, 1)

Test results := method(
	writeln("\nTest results\n===")
	writeln(Test numberOfTestsPassed .. "/" .. Test numberOfTestsRun .. " test(s) passed")
	writeln(Test numberOfTestsFailed .. " test(s) failed")
)

Test results
