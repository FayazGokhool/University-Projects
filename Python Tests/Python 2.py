def list_lists(n): #Takes a number, n, as specified
	full_list = [] #Overall list of n lists to be returned

	for i in range(0,n): #iterate from 0 (included) to number (not included)
		temp_list = [] #Temporary list which will be added into list of lists
		for x in range(1,i+2): #only creates lists with numbers greater than 0
			temp_list.append(x) #adds that number to the temporary list
		full_list.append(temp_list) #adds resulting temporary list to list of lists
	return full_list

print(list_lists(0)) #Test case 1 from example: Pass
print(list_lists(1)) #Test case 2 from example: Pass
print(list_lists(2)) #Test case 3 from example: Pass
print(list_lists(3)) #Test case 4 from example: Pass