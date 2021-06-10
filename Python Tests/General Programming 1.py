def fibonacci(range=100): #Function created to do this as it would, can also add easy improvements, e.g: parse even, odd or false to calculate sum of even, odd or all numbers in range

	counter = 0; #Used as a counter for number of numbers into the sequence
	sum_evens_range = 0; #Variable to store total of all even numbers in Fibonachi Sequence to 100
	n0,n1 = 0,1; #Initialise the first and second values in sequence with their respective values 
	
	while counter<range: #loop until range
		
		if n0%2==0: #Checks if the current number in the sequence is even by using remainder division (if 0 then even)
			#print(n0,n1,n_next) #Used this to Verify that I'm getting the right result
			sum_evens_range += n0 #adds current number in sequence to sum
			
		counter+=1; #Outside of the for loop, counter is incremented regardless of if last number in sequence is added to the sum
		n_next = n0 + n1; #adds last two numbers in the sequence to get the next value
		#print(counter, n0) Used to check sequence is being calculated correctly
		n0 = n1; 
		n1 = n_next; #n0 is replaced by n1 which is replaced by n_next (the current number in the sequence)
		
	return sum_evens_range #Returns sum

sum_of_evens_to_range = fibonacci(100)  #Calls function to calculate first 100 values 

print("Sum:", sum_of_evens_to_range) #Prints result