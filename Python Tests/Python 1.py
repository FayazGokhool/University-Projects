def multipleGenerator(value, divisor): #Takes a positive value and divisor as specified. Maybe useful to take the absolute value

	sum = 0;

	for i in range(0,value+1,divisor): #counts from 0 to value by divisor amount (multiples)
		if sum+i>102030: #Does not continue adding if it will go past 102030
			return sum;
		if i%3==0: 
			sum+=i; #adds to sum if i is a multiple of 3 as specified
	return sum; #returns sum

print(multipleGenerator(100,3)) #test case 1