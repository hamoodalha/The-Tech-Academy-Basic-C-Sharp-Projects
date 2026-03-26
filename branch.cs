using System; // lets us use Console stuff

class Program // this is the program
{
    static void Main() // this is where the program starts
    {
        // say hello and explain what the program does
        Console.WriteLine("Welcome to Package Express.");
        Console.WriteLine("We will calculate the cost to ship your package.");
        Console.WriteLine("Please follow the instructions below.");
        Console.WriteLine(); // makes a blank line for neatness

        // ask for the weight
        Console.WriteLine("Please enter the package weight:");
        double weight = Convert.ToDouble(Console.ReadLine()); // get number from user

        // check if it's too heavy
        if (weight > 50)
        {
            Console.WriteLine("Package too heavy to be shipped via Package Express. Have a good day.");
            return; // stop program
        }

        // ask for width
        Console.WriteLine("Please enter the package width:");
        double width = Convert.ToDouble(Console.ReadLine());

        // ask for height
        Console.WriteLine("Please enter the package height:");
        double height = Convert.ToDouble(Console.ReadLine());

        // ask for length
        Console.WriteLine("Please enter the package length:");
        double length = Convert.ToDouble(Console.ReadLine());

        // add all dimensions together
        double totalDimensions = width + height + length;

        // check if it's too big
        if (totalDimensions > 50)
        {
            Console.WriteLine("Package too big to be shipped via Package Express.");
            return; // stop program
        }

        // calculate the shipping price
        double quote = (width * height * length * weight) / 100;

        // show the result with 2 decimal places
        Console.WriteLine("Your estimated total for shipping this package is: $" + quote.ToString("F2"));

        // say thank you
        Console.WriteLine("Thank you!");
    }
}