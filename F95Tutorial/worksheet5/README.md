## Worksheet 5 Arrays and Formatted I/O

- Aims
  By the end of this worksheet, you will be able to:
  - Understand the use of  arrays
  - Improve the appearance of your output

- [Arrary,basics](5.1.f95), [Arrary of unknown size](5.2.f95), [exercise](5.3.f95)
- [Array magic](5.4.f95),[Array magic 2](5.5.f95)
  One of the benefits of arrays is that you can easily do operations on every element by using simple arithmetic operators.
- [Multi dimensional arrys](5.6.f95), [Multi dimensional arrys, exercise](5.7.f95)
  FORTRAN actually allows the use of arrays of up to 7 dimensions, a feature which is rarely needed. To specify a extended precision 3 dimensional array b with subscripts ranging from 1 to 10, 1 to 20 and 1 to 30 we would write:
     real  (kind=ikind),dimension(10,20,30) :: b 
- [Formatting your output](5.8.f95),[output to file](5.9.f95)
  The format statement can actually go anywhere in the program, but by convention we usually place them just after the associated write or all together at the end of the program. It's just a matter of taste. The tricky part here is the specification. There are different specifications for integer, real, and character variables.
- Integer Specification
  - General form :   nim
  - Right justified
  - m is the number of character spaces reserved for printing (including the sign if there is one)
  - If the actual width is less than m, blanks are printed
  - n is the number of  integers to output per line. If omitted, one number is output per line.
- Floating point Specification
  - General form : nfm.d
  - Right justified
  - m is the number of character spaces reserved for printing (including the sign if there is one), and the decimal point.
  - If the actual width is less than m, blanks are printed
  - n is the number of  real numbers to output per line. If omitted, one number is output per line.
  - d is the number of spaces reserved for the fractional part of the number – filled with 0's if fewer spaces are needed. If the fractional part is too wide it is rounded.
  - If the total width for output (m) is too small, FORTRAN will just output *'s.
- Exponential Specification
  - General form nEm.d
  - Alternative specification for outputting real
  - d is the number of decimal places
  - m  is the total width of the field including the sign (if any), the character E and its sign, the decimal point and the number of places of decimals. Again make m nice and wide to ensure the field is properly printed out.
  - n is the number of  exponential numbers to output per line. If omitted, one number is output per line.
- Character Specification
  - General form  nAm
  - n is the number of strings to print
  - m is the maximum number of characters to output
- [Implied do loop to write arrays](5.10.f95), [exercise, output a matrix on screen](5.11.95)