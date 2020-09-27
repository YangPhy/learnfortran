## Worksheet 6 Subroutines and Functions

- Aims
  By the end of this worksheet, you will be able to:
  - Understand the use of subroutines and functions to make your code more efficient and easier to read.

- [Subroutines, basics](6.1.f95)
- [Arguments to subroutines](6.2.f95), [exercise, calculate the area of triangles](6.3.f95)
  - You may have several subroutines in your program. Ideally, a subroutine should do a specific task – reflected by its name.
  - All the variables in subroutines, apart from the ones passed as arguments, are 'hidden' from the main program. That means that you can use the same names in your subroutine as in the main program and the values stored in each will be unaffected – unless the variable is passed as an argument to the subroutine.
  - It is very easy to forget to declare variables in subroutines. Always use implicit none in your subroutines to guard against this.
  - All the variables in the subroutine must be declared.
  - The positioning of the arguments (in this case, rad and vol) is important. The subroutine has no knowledge of what the variables are called in the main program. It is vital that the arguments agree both in position and type. So, if an argument to the subroutine is real  in the main program, it must also be real  in the subroutine.
  - If an argument to the subroutine is an array, it must also be declared as an array in the subroutine.
- [functions](6.4.f95)
  - Notice that we must declare the data type of the function both in the main program, and in the function itself as if it were a variable.
  - Functions return one value. This value, when calculated, is assigned to the name of the function as if it were a variable
- [exercise](6.5.f95)
  Write a program that includes a function called real function average(n,list) where n is integer and is the number of items in the list, and list is a real array. Write suitable code for reading the numbers from a file (or keyboard), and output the average of the numbers.

