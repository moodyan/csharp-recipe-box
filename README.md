# _Recipe Box_

#### _App created for two-day in-class project, C-Sharp - Week Four. Practice using SQL and Advanced Databases. June 15, 2017_

#### By _**Alyssa Moody and David Rolfs**_

## Description

_A simple program that allows users to keep track of their recipes._

## Program Specifications

1. The program allows users to add an ingredient to the database and delete ingredients. 
2. The program allows users to add a recipe to the database and update/delete recipes.
3. The program allows users to add categories to the database.
4. The program allows users to add recipes to the categories and view all recipes in that category.
5. The program allows users to add ingredients from the database to the recipes.  
6. The program allows users to view all recipes. 
7. The program allows users to click on recipes and view details.
8. The program allows users to search recipes by name.
9. The program allows users to sort recipes by ratings higher than 3.

## Setup/Installation Requirements

_Runs on the .Net Framework._

_Install Visual Studio 2015. https://go.microsoft.com/fwlink/?LinkId=532606 ._

_Install ASP.Net 5. This will give you access to the .NET Framework. https://go.microsoft.com/fwlink/?LinkId=627627 ._

_Restart PowerShell. While located in your machine's Home directory, enter the command > dnvm upgrade._

_Requires Nancy Web Framework located at: http://nancyfx.org/. You can also do this via Windows PowerShell with the command > **Install-Package Nancy**_

_**From GitHub: Download or clone project repository onto desktop from GitHub.**_

_In your preferred database management system (I use SSMS), open the recipe_box_scripts.sql file from the project folder. Run the execute command on the file. If this does not work, run the following command in SQLCMD:

CREATE DATABASE recipe_box; GO USE band_tracker; GO CREATE TABLE recipes (id INT IDENTITY(1,1), recipe_name VARCHAR(100), rating INT, instructions text); GO CREATE TABLE ingredients (id INT IDENTITY(1,1), ingredient_name VARCHAR(100); GO CREATE TABLE categories (id INT IDENTITY(1,1), category_name VARCHAR(50); GO CREATE TABLE recipes_categories (id INT IDENTITY(1,1), recipes_id INT, categories_id INT); GO CREATE TABLE recipes_ingredients (id INT IDENTITY(1,1), recipes_id INT, ingredients_id INT); GO_

_To create test database, in your preferred database management system (I use SSMS) open the recipe_box_test_scripts.sql file from the project folder. Run the execute command on the file. If this does not work, back up and restore the database as a test database in your preferred database management system.

_In PowerShell, cd into the project folder. Enter the command > **dnu restore**_

_Enter the command > **dnx kestrel**_

_In your preferred browser, navigate to http://localhost:5004/ and you should see the application._

## Known Bugs

_None._

## Support and contact details

_If you run into any issues or have questions, ideas or concerns, please contact Alyssa Moody at alyssanicholemoody@gmail.com_

## Technologies Used

_**Languages:** HTML, CSS, C#, SQL._

_**Frameworks:** Nancy, .Net._

_**Testing:** xUnit._

### License

*MIT license Agreement*

Copyright (c) 2017 **_Alyssa Moody and David Rolfs_**
