doFile("test_framework.io")

"Assert tests\n===" println
Test assertTrue("true should pass a test of assertTrue", true)
Test assertTrue("false should fail a test of assertTrue", false)
Test assertTrue("number of tests run should be two", Test numberOfTestsRun == 2)
Test assertTrue("number of tests failed should be one", Test numberOfTestsFailed == 1)


"\nassertEqual tests\n===" println
Test assertEqual("1 should be equal to 1", 1, 1)
Test assertEqual("1+1 should be equal to 2", 1+1, 2)
Test assertEqual("number of tests run should be six", Test numberOfTestsRun, 6)
Test assertEqual("number of tests passed should be six", Test numberOfTestsPassed, 6)
Test assertEqual("number of tests failed should be one", Test numberOfTestsFailed, 1)

Test results
