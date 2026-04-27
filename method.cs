using System;

// This is my class for math stuff
class MathOperations
{
    // This method uses 2 whole numbers
    public void DoMath(int firstNumber, int secondNumber)
    {
        // Multiply the first number by 2
        int result = firstNumber * 2;

        // Show the new answer on the screen
        Console.WriteLine("First number multiplied by 2 = " + result);

        // Show the second number too
        Console.WriteLine("Second number = " + secondNumber);
    }
}

class Program
{
    static void Main(string[] args)
    {
        // Make a new math object
        MathOperations math = new MathOperations();

        // Use the method with normal numbers
        math.DoMath(5, 10);

        // Use the method with names for each number
        math.DoMath(firstNumber: 7, secondNumber: 20);

        // Wait so the screen does not close fast
        Console.ReadLine();
    }
}