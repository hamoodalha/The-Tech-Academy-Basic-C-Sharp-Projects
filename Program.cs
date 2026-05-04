using System;



namespace PolymorphismAssignment

{

    class Program

    {

        static void Main(string[] args)

        {

            // Here we create a new Employee object and give it values

            Employee emp = new Employee()

            {

                firstName = "John",

                lastName = "Smith",

                Id = 1

            };



            // This calls the SayName method and prints the name

            emp.SayName();



            // This shows polymorphism by using the interface type

            IQuittable quittableEmp = emp;



            // This calls the Quit method using the interface

            quittableEmp.Quit();



            // This keeps the console open

            Console.ReadLine();

        }

    }

}