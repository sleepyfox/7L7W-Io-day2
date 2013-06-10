// Create the list of numbers
numbers := List clone
for(i, 1, 15, numbers push(i))

// Define the speaker
fizzbuzz := method(m,
	say := ""
	if(m % 3 == 0, say = say .. "Fizz")
	if(m % 5 == 0, say = say .. "Buzz")
	if(say == "", m, say)
)	

// print the Fizz and Buzz
numbers map(m, fizzbuzz(m) println)

