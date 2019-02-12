## Worksheet 1: The Basics

### Aims
  By the end of this worksheet, you will be able to:
  - Create and run a Fortran 95 program
  - Understand basic program structure
  - Unserstand real, integer and character variable types

- [Hello world !](1.1.f95)
- [Sum of two numbers](1.2.f95)
- [Input 3 numbers and output the sum](1.3.f95)
- [More Data types – integer and character](1.4.f95)
  - Decare character variables

     When the character variable is declared, we show the maximum length that the string can occupy by following the name by a * then its maximum length. The example below has a maximum length of 10 characters allowed for a person's name – this might not always be enough! You have to make a judgement here.

  
  - implicit none

     By including it in your program, FORTRAN will check that you have properly declared all your variable types. In the bad old days of programming, declaration of variables was thought to be unnecessary and the old FORTRAN compilers used an implicit convention that integers have names starting with the letters in the range i – n, all the others being real. FORTRAN still allows you to do this if we don't include the line, implicit none. Time has shown that one of the commonest reasons for error in a program is the incorrect use of variables.