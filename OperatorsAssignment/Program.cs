using System;



namespace OperatorOverloadAssignment

{

    class Program

    {

        static void Main(string[] args)

        {

            // Create first employee

            Employee emp1 = new Employee()

            {

                Id = 1,

                FirstName = "John",

                LastName = "Smith"

            };



            // Create second employee

            Employee emp2 = new Employee()

            {

                Id = 1,

                FirstName = "Jane",

                LastName = "Doe"

            };



            // Compare the two employees using overloaded ==

            bool areEqual = emp1 == emp2;



            // Display the result

            Console.WriteLine("Are the employees equal? " + areEqual);



            Console.ReadLine();

        }

    }

}

