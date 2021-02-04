# Homework 1 - Linux Refresh

In this homework I will be asking you to review the purpose of the shell and how it works, common shell commands and demonstrate scripting skills. 

You will need this file [Hutia_DNA.fasta](https://www.dropbox.com/s/h52y375q8sxcpj0/Hutia_DNA.fasta?dl=0)


## General concepts to refresh and lessons to review if you need them:

[Shell Commands](http://swcarpentry.github.io/shell-novice/01-intro/index.html)

[Working with Files and Directories](http://swcarpentry.github.io/shell-novice/03-create/index.html)

[Pipes and Filters](http://swcarpentry.github.io/shell-novice/04-pipefilter/index.html)

[Loops](http://swcarpentry.github.io/shell-novice/05-loop/index.html)

[Shell Scripts](http://swcarpentry.github.io/shell-novice/06-script/index.html)

[Documentation](https://blog.submain.com/code-documentation-the-complete-beginners-guide/) -specifically in-line-comments

## Remember these Common commands as you work through this exercise

    ls          mkdir           cd          pwd
    cp          mv              rm          rmdir 		
    cat         less            head        tail
    grep        wc              uniq        top
    man         sort            wc          * 
     |          .               ..          /


## Part I: Questions

1. 	What is a Graphical User Interface (GUI) and how does that differ from the Command Line Interface (CLI)?

2.	What does the shell do?

3.	What is the command used for listing things in a directory?

4.	What is the command used for changing directories?

5.	What command would you use to get your current working directory?

6.	How do you get the manual for these commands?

7.	What does the shell prompt look like?

8.	How would you list things in a directory in chronological order?

9.	Name two ways to get to the ‘home’ or ‘root’ directory.

10.	What is the difference between an absolute path and a relative path?

11.	What are the two relative path directories we talked about and what do they mean?

12.	Why shouldn’t you put spaces in filenames?

13.	Name a way to have multiple readable words in a filename without spaces?

14.	What is the program nano, what does it do? Do you use nano? If not what do you use?

15.	``*`` is a form of a wildcard. What does it mean?

16.	The following code would match what? 
		```ls *.txt``` 

17.	Why do we need to be careful with the ```mv``` command?

18.	Why do we need to be careful with the ```rm``` command?

19.	What is the difference between ```>``` and ```>>```?

20.	What does ```head``` do? 

21.	What is the purpose of ```|``` (pipe)?

22.	Interpret the following command:

	```cat huge_file.fasta | uniq | head -n 5 >proteins.fasta```

23.	What is a loop and when would you use it?

24.	In a directory with the following files. What would the following loop do?
         ```apple.txt, banana.txt, orange.txt 
		$ for  filename in  *.txt; do
		> cat  ${filename}  >>fruits.txt
		> done
		```
25.	What is a shell script?

26.	What are the benefits of writing and running a script over typing the code in?

27.	When looking at a script what does ```#``` mean? Why would you use one?

28.	What does ```grep``` stand for and what does it do?

29.	What does ```find``` do?



## Part II - Writing Code

As part of this exercise please open the shell and practice moving around into different files.  Best practice is to try a little bit every day. Try to challenge yourself by not using the mouse. For each of the questions below type your code and the result from the shell prompt.

1.	Open the shell and change directories to the desktop and list the contents, paste your code here.

2.	Draw the file structure from the root directory into one of the folders on the desktop.  You can submit a pdf with a drawing. Select three locations and type the commands for changing directories to those locations use a combination of absolute and relative paths. 

3.	On your computer create a directory on your desktop.  Create two files without opening them that have file extensions ```.txt```. Then use wildcards to list the files in that directory.  Paste you code here.

4.	Download the file Hutia_DNA.fasta from the Github repo. Make a new directory on the desktop. Move the file into that directory. List the contents of the directory.  How many lines are in this file? Fasta files are a type of data file that holds DNA sequences. They are all formatted the same. The first line starts with a > and a name followed by a line break, and then DNA sequence followed by a line break. The next line starts with an > and another name followed by a line break and the DNA sequence. With that in mind, how could you use linux commands to determine how many sequences are in this file? How many sequences are in this file?

5.	Build a single line of code that would take the first 100 sequences of this file and put them in a new file called ‘MyOutputFile.fasta’. Use a combination of wc, sort and uniq in a single line of code to tell me how many unique lines are in this file.  Paste your commands and the answer here.

6.	Write code that would create a loop to copy all the files in one directory ending in ```.txt``` to another directory. Paste the code here.  


7.	Write a script with in-line documentation (hint #) that would run a program called find_taxa.py on a set of files ending in ‘.fasta’. What is the name of your script? Type the script here.

 
8.	From the Hutia_DNA.fasta file tell me how on how many lines do we find the pattern ‘GAGA’. What was the code used to find this?


