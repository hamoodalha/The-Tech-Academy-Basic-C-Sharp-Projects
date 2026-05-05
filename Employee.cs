using System;



namespace OperatorOverloadAssignment

{

    // This class represents an employee

    public class Employee

    {

        // Properties for the employee

        public int Id { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }



        // Overload the == operator to compare employees by Id

        public static bool operator ==(Employee emp1, Employee emp2)

        {

            // If both are null, return true

            if (ReferenceEquals(emp1, emp2))

                return true;



            // If one is null, return false

            if (emp1 is null || emp2 is null)

                return false;



            // Compare Ids

            return emp1.Id == emp2.Id;

        }



        // Must also overload !=

        public static bool operator !=(Employee emp1, Employee emp2)

        {

            return !(emp1 == emp2);

        }



        // Override Equals (good practice when overloading ==)

        public override bool Equals(object obj)

        {

            if (obj is Employee emp)

                return this.Id == emp.Id;



            return false;

        }



        // Override GetHashCode (required with Equals)

        public override int GetHashCode()

        {

            return Id.GetHashCode();

        }

    }

}