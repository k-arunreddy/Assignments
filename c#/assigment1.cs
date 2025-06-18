using System;

class SimpleCalculator
{
    static void Main()
    {
        while (true)
        {
            Console.Write("Enter first number: ");
            int first = Convert.ToInt32(Console.ReadLine());

            Console.Write("Enter second number: ");
            int second = Convert.ToInt32(Console.ReadLine());

            Console.WriteLine("Choose an operation:");
            Console.WriteLine("1. Add");
            Console.WriteLine("2. Subtract");
            Console.WriteLine("3. Multiply");
            Console.WriteLine("4. Divide");

            Console.Write("Enter your choice (1-4): ");
            int option = Convert.ToInt32(Console.ReadLine());

            int answer = 0;

            if (option == 1)
                answer = first + second;
            else if (option == 2)
                answer = first - second;
            else if (option == 3)
                answer = first * second;
            else if (option == 4)
                answer = first / second; // no divide-by-zero check
            else
                Console.WriteLine("Invalid option");

            Console.WriteLine("Answer: " + answer);

            Console.Write("Do you want to continue? (y/n): ");
            string again = Console.ReadLine().ToLower();
            if (again != "y")
                break;
        }
    }
}