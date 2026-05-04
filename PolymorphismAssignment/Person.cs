using System;



namespace PolymorphismAssignment

{

    // This is an abstract class called Person

    // It cannot be used by itself, only inherited

    public abstract class Person

    {

        // These store the person's first and last name

        public string firstName { get; set; }

        public string lastName { get; set; }



        // This method must be used in any class that inherits Person

        public abstract void SayName();

    }

}

