doFile("test_framework.io")

List myAverage := method(
	if(self size == 0, 0, self average)
)

"Average tests\n===" println
Test assertEqual("The average of an empty list is zero", list() myAverage, 0)
Test assertEqual("The average of a list with one item in it should be that number", list(2) myAverage, 2)

result := try(list(2, "i") myAverage) type
Test assertEqual("If there is a non-numeric in the list it will raise an exception", result, "Exception")

Test results
