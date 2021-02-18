# Homework 1 - Linux Refresh

In this homework we will review the basic principles of python programming. You will work through a few questions and build some scripts. You will need the Bloom et al Dataset found in this repository. 


## General concepts to refresh and lessons to review if you need them:

[Python_Refresh](https://pythonforbiologists.com/introduction)

Remember these Primers from Last Semester
[Python_Primer1](https://github.com/tparchman/BIOL792_course_site/blob/master/week6_pythonI/python_1_primer.md) from last semester.
[Lists_for_loops](https://github.com/tparchman/BIOL792_course_site/blob/master/week7_pythonII/python_2_primer.md)
[Input_Output](https://github.com/tparchman/BIOL792_course_site/blob/master/week8_python3/python_3_primer.md)
[Dictionaries](https://github.com/tparchman/BIOL792_course_site/blob/master/week11_python6/primer_python6.md)


## Remember these Common commands as you work through this exercise
	data types
	lists and dictionaries 
	if while and for loops
	reading files

## Part I: Questions

1.	Name one of the basic building blocks of programming and a small definition.


2.	Match the data type to the appropriate data
		string				True
		integer				123
		boolean				‘I am a programmer’
		floating point			34.63221

3.	What would I get if I did tried to add these to numbers together 123 and 5.
		a) if the numbers were formatted as strings
		b) if they were formatted as integers

4.	Lists are one dimensional arrays and are a series of items also called vectors. From the following list what would the question apple_list[3] return?  Remember we refer to items in a list by their position. Hint – remember how computers count.
	apple_list=[‘banana’,’pear’,’kumquat’,’pomegranate’,’passion fruit’]

5.	Name a difference between lists and dictionaries?


6.	What would you get from this question from the following dictionary:  ```apple_dict[‘pear’]```
		fruit_dict = {}
		fruit_dict[‘apple’]=10
		fruit_dict[‘pear’] = 3
		fruit_dict[‘walnut’]=216

7.	In python what does the function ```.replace()``` do?


8.	How do you print something in python?  For example write a print statement to print “hello world!”


9.	Name one place you can go to get help with python?


10.	What is an ```if``` statement and when would you use one?


11.	From this list:  ```container_list = [‘can’,’jar’,’hat’]``` What would be returned from this: ```container_list[0:2]```.  Hint: Remember one number is inclusive and one exclusive.


12.	What is the difference between an ```if``` statement and a ```while``` loop?


13.	What would you get with the command ```fruit_dict.keys()```  after entering this dictionary:  
		fruit_dict = {}
		fruit_dict[‘apple’]=10
		fruit_dict[‘pear’] = 3
		fruit_dict[‘walnut’]=216

14.	In this statement: ```InFileName = open(InFileName, ‘r’)``` what does the ‘r’ indicate ?


15.	What does this command do? ```Line.strip(‘\n’)``` why would you use it when printing out lines to the screen?


16.	How would you split a line from a csv file into a list


##Part II:  Practice Scripts
Add your scripts from this section as separate documents into your github repository. Below each question write the name of the script so I can find them. All scripts should be documented with in-line documentation.

1.	Create a documented python script that would 
		a.take this number 112345678911234566 and count the number of 2s in the string and print out the number. 
		b.take a sentence from user input, turn it all to lowercase letters and remove the spaces and count the length and print out the length.  You choose the sentence. 

2.	Create a documented python script that will do the following two things. For each task, first write the pseudocode, comment out the pseudocode and beneath the pseudocode write the script.
		a.Create a list of numbers (any numbers you like). Then loop through the items in the list adding 1 to every number and print those numbers.
		b.Create a dictionary of animals and their sizes (make up whatever you want). Print out the keys of the dictionary. Make a list of all the animals and then write an if else statement to print out the animal name and the word “big” if the weight is over 20 grams and the word “small” if the weight is less than 20 grams. 

3.	Create a documented python script that will open up the file “Bloom_etal_2018_Reduced_Dataset”.  Read through the file and print out the taxon name and their diadromous status. Add up all of the log body sizes and print out the total log body size for all the individuals in the file.  



