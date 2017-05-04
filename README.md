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
Navigation of folders is completed by using the ls command to list the folders and files in your directory, and navigating down to the next level by using the command 

cd %foldername%

If you navigate to an incorrect folder, you can return up to the level above using the commmand 

cd..

To find out the name of the folder you are currently in, use pwd

Once you have navigated to the folder you have stored the project in, ensure that the program has been correctly compiled by running the stack build command

Once complete, execute stack exec HaskellLab to intialise the Yesod Framework web server. The server will now be accessible using the link http://localhost:3000

HTTP is not considered a safe web protocol. This web server should not be deployed on a public facing server for any reason. It is simply to satisfy the requirements of the CI285 Coursework on a local machine.

# Design of Calculator API

# Design

Representational State Transfer(REST) is a method of providing resources to a client via HTTP. Different resource types can be delivered depending on the type of device or access that is required. To successfully implement REST into my API, my calculator must be able to deliver both HTML and JSON representations of any function that I decide to implement.
Calculator Features

1.	Add: Addition is one of the core functions of a calculator. I will provide a function that adds values X and Y. Both with be captured using HTML Forms and Input elements. My basic addition function will only add whole numbers. This means the type of my function will be:

Add:: Int -> Int -> Int
Add(X,Y) = X + Y

By using Int as a data type, I ensure the operation of my API will offer equal functionality across all machines. If I had opted to use Integer as a type instead, Haskell allows the maximum and minimum values to be the limits of an individual machines memory. While this would create a more flexible API that makes maximum use of the server’s resources, there is a chance that the number delivered would be larger than could be handled by the client. This would also mean in a situation where my server API was hosted on a scaled web server, the maximum number that the API could handle would fluctuate. This would complicate testing the API. The brief also states that the function of a calculator is the target, and most calculators also limit themselves to a 32-bit integer, allowing for maximum and minimum values of (22) -1 and -229 respectively.

2.	Sub: Subtraction is the logical following addition to the API, after addition. In the same vein, I will allow for two values to be captured from an HTML form. A consideration when implementing subtraction is the possibility of a result returning a negative value. My use of the Int data type will allow for negative values to be handled with the bounds of the Int type, being a number no lower than -229.

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

I have chosen to use Double type at the advice of the Haskell Wiki (https://wiki.haskell.org/Performance/Floating_point) [accessed 1st May 2017]. (This source cannot be considered as a totally reliable source, however. The Haskell wiki is not strongly moderated and contains very low levels of detail in places.) This will allow me to return a precise decimal answer to the division of two Integers. 


# Implementation of API

The top section of the page is devoted to the basic function of my API.

To use the API, select either the HTML or JSON implementation of a function. A placeholder set of data will be input for you.
To change the value of the numbers used in the calculation, change the URL in the address bar of your browser as the below example:

http://localhost:3000/%operator%/%value%/%value%

Where %value% is any whole number (Integer) less than (2^29)-1 and (-2^29) and %operator is any of the standard four operators (add, sub, mul, div)

During the implementation of my design, I have decided the keep Int only input across all of my functions. Therefore, the design for divide has changed. Instead of returning a result of type double, the divide functions type will change to

Div:: Int -> Int -> Int

The return type for all functions in my Yesod implementation return type Handler. This is because the API takes the input from the webpage and returns the result embedded in Html or JSON


# Reflection on Code and Project

I have struggled with this project. The concepts of the Yesod Web Framework are easy to get started with, but extremely difficult to add to. A large proportion of the problem with this has been in my areas of research, as I have mentioned above. In other languages that I have studied during the course, many examples of output from code exist. I have found this not to be the case with Haskell and Yesod. I have struggled to add to the project due to several technical as well as research difficulties. At the beginning of the assignment period, there was an issue with the university environment that ultimately meant that there was not enough space in our user areas to run a Yesod Web Server. This issue is, to date, unresolved.

Despite the limitation of resources in areas I tend to lean on in other languages, I have found the Yesod book (http://www.yesodweb.com/book) to be particularly useful. Attempts at this coursework have been a useful reminder to not rely on the same locations for information. As a result of these challenges I feel I have a different perspective, becoming a better programmer as a result.

I do still feel, however, that this project does not reflect my best work. I am not satisfied with the result, which does not completely match my design. Values for X and Y can be adjusted by modifying the link at the top of the webpage in the basic arithmetic functions, and the API provides a RESTful implementation by serving the result both in JSON and HTML. I have managed to create a form, with help from the Yesod Book Forms article. Although the form works successfully for HTML, I have not been able to provide a JSON implementation for the API. I have been unable to implement a data storage method.

During the implementation process, I struggled with many areas. One was implementing divide. The issue with Divide was in my choice of operator. The GHC parser initially gave me an error saying there was implementation for Fractional. My study eventually found a diagram that shows the tree of types that can be used for families of numbers. As a Fractional only uses Float and Double types, I updated all the references to divide beyond the scope of my original function to include doubles in place of ints. Further research revealed that I had simply used an incorrect operator. I replaced / which depends on the fractional int type to div which is capable of handling Integral numbers, therefore matching my design document.

Because I chose Int as the basic data type for all my calculations, my Div function lacks precision. The resulting answer is rounded to an Int, meaning a divide of 7 by 6 returns 0. The basic functions are also unable to accept anything other than whole numbers as input. I deliberately limited the first functions I created, so that I could focus on the function of the API.

If I were to extend the functions of my basic functions, handling numbers that contain floating points would be an excellent expansion of the function.


# Reflection on Persistent Storage Techniques used

I have not managed to implement a storage method in my API. If I had more time to implement the Persistent module in Yesod (allows the use of SQL Lite as a database engine, as well as use of a YAML file to store data), I would have used the data storage to store the result of data entered into the addition form, with each calculation stored as an individual row in the database. The Database structure would behave as such:

Relation name: AddHistory
Attributes: AddID (Primary Key), AddX, Operand, AddY

I would add a page that returns the complete history for the calculator. Doing so would allow me to implement a function that passes the values back to the form, like the history feature on a scientific calculator.

Further extension would include the addition of relations that stored user details. This would allow me to add a login/user credential screen. Implementing this would allow me to extend the history feature further by presenting a user’s individual history.
