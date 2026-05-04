using System;



namespace PolymorphismAssignment

{

    // This class inherits from Person and uses the IQuittable interface

    public class Employee : Person, IQuittable

    {

        // This stores the employee ID number

        public int Id { get; set; }



        // This overrides the SayName method from Person

        public override void SayName()

        {

            Console.WriteLine("Name: " + firstName + " " + lastName);

        }



        // This is the Quit method from the interface

        public void Quit()

        {

            // This prints a message when the employee quits

            Console.WriteLine(firstName + " has quit the job.");

        }

    }

} 
