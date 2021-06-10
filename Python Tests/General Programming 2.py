def simplify(list1, list2):

	list1_counter,list2_counter = 0,0 #This represents the integer in each array that the loop below is currently on
	list3 = [] #Initialise the list
	list1_length, list2_length = len(list1), len(list2) #Gets the length of both lists and stores them as varibales so they don't have to be called again and again
	both_lists_checked = False #Used for While Loop, False until all integers in both arrays checked

	while both_lists_checked == False: 

		if list1_counter <= list1_length-1: #checks if counter still in range 
			list1_number = list1[list1_counter]	#sets current integer in each array (so that it doesn't have to be called again and again)

		if list2_counter <= list2_length-1:
			list2_number = list2[list2_counter]
		
		if list1_counter>=list1_length and list2_counter>=list2_length: #Checks both lists have been fully iterated through
			both_lists_checked=True #Exits loop

		elif list1_counter>=list1_length: # this and the next elif checks if either list has been fully chekced
			for i in range(list2_counter,list2_length): #if yes, it adds all the remaining items in the other list to the final list (but not repeats)
				if not list2[i] in list3:
					list3.append(list2[i])
					both_lists_checked = True;

		elif list2_counter>=list2_length:
			for i in range(list1_counter,list1_length):
				if not list1[i] in list3:
					list3.append(list1[i])
					both_lists_checked = True;

		if list1_number==list2_number and not (list1_number in list3): #Checks if two numbers are the same and not in final list
			list3.append(list1[list1_counter]) #If yes, adds it to the final list and increments the counter for both
			list1_counter+=1
			list2_counter+=1

		elif list1_number>list2_number and not (list2_number in list3): # The next two elifs Checks if number in one list is greater than the  element being analysed in the next list
			list3.append(list2[list2_counter]) #if yes, adds the lesser number to the final list and increments the list where the number was found's counter
			list2_counter+=1


		elif list2_number>list1_number and not (list1_number in list3):
			list3.append(list1[list1_counter])
			list1_counter+=1


	return list3

list2 = [1,2,3]
list1 = [0,1,3,4] #Simple test case, returns correct answer

final_list = simplify(list1,list2)
print(final_list)