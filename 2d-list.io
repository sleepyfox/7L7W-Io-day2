// Write a prototype for a two-dimensional list. 
// The dim(x,y) method should allocate a list of y lists that are x elements long. 
// set(x,y,value) should set a value. 
// get(x,y) should return that value.

doFile("test_framework.io")

Matrix := Object clone

Matrix init := method(
	self contents := List clone // default is empty list
)

Matrix dim := method(x, y, 
	self contents := List clone // reset needed as may not be clean
	if(x < 0 or y < 0, return nil)
	row := List clone
	y repeat(row push(0))
	x repeat(self contents push(row))
)

Matrix size := method(
	columns := contents size
	if(columns == 0, return 0) 
	rows := contents at(0) size
	return rows * columns	
)

Matrix set := method(x, y, value,
	if(y >= self contents size, Exception raise("Out of matrix bounds exception") )
	row := self contents at(y)
	if(x >= row size, Exception raise("Out of matrix bounds exception") )
	self contents at(y) atPut(x, value)
)

Matrix get := method(x, y, 
	if(y >= self contents size, Exception raise("Out of matrix bounds exception") )
	row := self contents at(y)
	if(x >= row size, Exception raise("Out of matrix bounds exception") )
	self contents at(y) at(x)	
)

"\nA two-dimensional array\n===" println
m := Matrix clone
Test assertEqual("an uninitialised matrix should have size zero", m size, 0)

Test assertEqual("trying to dim a matrix with a negative size should return nil", m dim(-1,0), nil)

m := Matrix clone
m dim(0,0)
Test assertEqual("dim(0,0) should have no elements", m size, 0)

m := Matrix clone
m dim(1,1)
Test assertEqual("dim(1,1) should have 1 element", m size, 1)

m dim(2,2)
Test assertEqual("dim(2,2) should have 4 elements", m size, 4)

m dim(3,2)
Test assertEqual("dim(3,2) should have 6 elements", m size, 6)

m set(0, 0, 5)	
result := (m contents at(0)) at(0)
Test assertEqual("set(0,0,5) should set the top left element to be 5", result, 5)

m set(1, 1, 3)	
result := (m contents at(1)) at(1)
Test assertEqual("set(1,1,3) should set the top left element to be 3", result, 3)


// This is one way of testing for exception conditions
e := try(
	m set(1, 7, 1)
)
Test assertEqual("trying to set an element out of bounds should raise an exception", e error, "Out of matrix bounds exception")

Test assertEqual("get(0,0) should return 5", m get(0,0), 5)
Test assertEqual("get(1,1) should return 3", m get(0,0), 5)

e := try(
	m get(7, 1)
)
Test assertEqual("trying to get an element out of bounds should raise an exception", e error, "Out of matrix bounds exception")

Test results