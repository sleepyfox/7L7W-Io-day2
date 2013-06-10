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

Test results := method(
	writeln("\nTest results\n===")
	writeln(self numberOfTestsPassed .. "/" .. self numberOfTestsRun .. " test(s) passed")
	if(self numberOfTestsFailed > 0) then(
		writeln(self numberOfTestsFailed .. " test(s) failed")
	)
)

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
