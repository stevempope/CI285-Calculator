# CI285-Calculator
Implementation of a RESTful API for Assignment 2 - CI285 Introduction to Functional Programming

# Design of Calculator API

# Design
Representational State Transfer(REST) is a method of providing resources to a client via HTTP. Different resource types can be delivered depending on the type of device or access that is required. To successfully implement REST into my API, my calculator must be able to deliver both HTML and JSON representations of any function that I decide to implement.
Calculator Features
1.	Add: Addition is one of the core functions of a calculator. I will provide a function that adds values X and Y. Both with be captured using HTML Forms and Input elements. My basic addition function will only add whole numbers. This means the type of my function will be:

Add:: Int -> Int -> Int

Add(X,Y) = X + Y

By using Int as a data type, I ensure the operation of my API will offer equal functionality across all machines. If I had opted to use Integer as a type instead, Haskell allows the maximum and minimum values to be the limits of an individual machines memory. While this would create a more flexible API that makes maximum use of the server’s resources, there is a chance that the number delivered would be larger than could be handled by the client. This would also mean in a situation where my server API was hosted on a scaled web server, the maximum number that the API could handle would fluctuate. This would complicate testing the API. The brief also states that the function of a calculator is the target, and most calculators also limit themselves to a 32-bit integer, allowing for maximum and minimum values of (22) -1 and -229 respectively.

2.	Sub: Subraction is the logical following addition to the API, after addition. In the same vein, I will allow for two values to be captured from an HTML form. A consideration when implementing subtraction is the possibility of a result returning a negative value. My use of the Int data type will allow for negative values to be handled with the bounds of the Int type, being a number no lower than -229.

Sub:: Int -> Int -> Int

Sub(X,Y) = X - Y

Because I have chosen a bounded data type, the natural restrictions of the type will prevent insertion of any unusual or invalid data. The input for values X and Y must be whole numbers within the bounds of the type Int.


3.	Mul: Multiplication is the next function I have chosen to implement in my calendar API. As in the previous two functions, this will be a basic function, where two values X and Y are submitted via a form and the result is delivered in either HTML or JSON. A consideration with these functions is possibility of entering a negative value in the form. As the values must be of type Int, there will not need to be any extra lines of code to handle such conditions.

Mul:: Int -> Int -> Int
Mul (X,Y) =  X*Y

# Implementation of API

# Reflection on Code

# Reflection on Persistent Storage Techniques used
