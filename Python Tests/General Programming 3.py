def positiveOnly(number): #Function takes number
	if number<0:
		return False
	for n in str(number): #Iterates through number in string format
		if int(n)%2 !=0: #Takes integer value of digit and checks if not even
			return False #returns false if not even

	return True; #if false not returned, true returned at the end 

print(positiveOnly(23)) #Test Case 1
print(positiveOnly(24468)) #Test Case 2