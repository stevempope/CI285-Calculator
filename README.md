# CI285-Calculator
Implementation of a RESTful API for Assignment 2 - CI285 Introduction to Functional Programming

# Building the Environment
To run this Haskell application, you need to have installed the Haskell Platform  (https://www.haskell.org/platform/)
This includes:

GHC (Glasgow Haskell Compiler)

The Cabal Tool

The Stack Tool

You will also need to install the Yesod Web Framework
Instructions for installing the framework can be found at http://www.yesodweb.com/page/quickstart

Once the build environment is installed, you need to download this master branch and navigate to the folder in the GHC window.
Navigation of folders is completed by using the ls command to list the folders and files in your directory, and navigating down to the next level by using the command cd %foldername%
If you navigate to an incorrect folder, you can return up to the level above using the commmand cd..
To find out the name of the folder you are currently in, use pwd

Once you have navigated to the folder you have stored the project in, ensure that the program has been correctly compiled by running the stack build command

Once complete, execute stack exec %foldername% to intialise the Yesod Framework web server. The server will now be accessible using the link http://localhost:3000

HTTP is not considered a safe web protocol. This web server should not be deployed on a public facing server for any reason. It is simply to satisfy the requirements of the CI285 Coursework on a local machine.

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

4.	Div: Divide is a more complex operation to handle compared to the other three “basic” functions of the calculator. Dividing by zero cannot be allowed, also the use of Int as a data type can lead to loss of precision. Dividing two Integers often leads to a number that is not whole. I have decided to restrict the data type of the input values, but to maintain precision of the result.

Div: Int -> Int -> Double
Div (X,0) = Nothing
Div (X,Y) = X / Y

I have chosen to use Double type at the advice of the Haskell Wiki (https://wiki.haskell.org/Performance/Floating_point). This will allow me to return a precise decimal answer to the division of two Integers.


# Implementation of API
Using the Calculator:

Basic Functions:

The top section of the page is devoted to the basic function of my API. To use the API, select either the HTML or JSON implementation of a function. A placeholder set of data will be input for you.

To change the value of the numbers used in the calculation, change the URL in the address bar of your browser as the below example:

http://localhost:3000/%operator%/%value%/%value%

Where %value% is any whole number (Integer) less than (2^29)-1 and (-2^29) and %operator is any of the standard four operators (add, sub, mul, div)

# Reflection on Code and Project
I have struggled with this project. The concepts of the Yesod Web Framework are easy to get started with, but extremely difficult to add to. A large proportion of the problem with this has been in my areas of research, as I have mentioned above. Documentation that is clear and easy to understand is sparse in this context. I have struggled to add to the project due to several technical as well as research difficulties. At the beginning of the assignment period, there was an issue with the university environment that ultimately meant that there was not enough space in our user areas to run a Yesod Web Server. This issue is, to date, unresolved. This has meant that I have had to explore methods of editing Haskell files on a laptop. Although this is the advised method, I struggled to get the Haskell Platform working in a way that satisfied my needs. I dual booted the recommended Fedora OS and found that it's incompatibility with the modern UEFI standard meant that I had twice had to reinstall Fedora in order to update it. I resolved to install Fedora in a virtual machine to mitigate the frequent issues I had, but in taking the time to solve these issues, much time was wasted fighting the technical problems over expanding my understanding of the problem.

As a result of the limited media and technical issues, I do not feel that this project reflects my best work. I am not satisfied with the end result, which is a very basic implementation of the calculator. Values for X and Y can be adjusted by modifying the link at the top of the webpage, but my ultimate goal in my design was to use an HTML form to capture the values of X and Y and pass them to my modules. I have been unable to implement a data storage method, and despite my efforts in the test branch, I struggled to make Divide work.
The issue with Divide was in my choice of operator. The GHC parser initially gave me an error saying there was implementation for Fractional. My study eventually found a diagram that shows the tree of types that can be used for families of numbers. As a Fractional only uses Float and Double types, I updated all the references to divide beyond the scope of my original function to include doubles in place of ints. Further research revealed that I had simply used an incorrect operator. I replaced / which depends on the fractional int type to `div` which is capable of handling Integral numbers.

Because I chose Int as the basic data type for all my calculations, my Div function lacks precision. The resulting answer is rounded to an Int, meaning a divide of 7 by 6 returns 0. The basic functions are also unable to accept anything other than whole numbers as input. I deliberately limited the first functions I created, so that I could focus on the function of the API.

If I were to extend the functions of my basic functions, handling numbers that contain floating points would be an excellent expansion of the function.

# Reflection on Persistent Storage Techniques used
