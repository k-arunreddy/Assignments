using System;

class ReportCard
{
    static void Main()
    {
        Console.Write("Enter your name: ");
        string name = Console.ReadLine();

        Console.Write("Std: ");
        string std = Console.ReadLine();

        Console.Write("Div: ");
        string div = Console.ReadLine();

        Console.Write("Number of Subjects; ");
        int subjects = Convert.ToInt32(Console.ReadLine());

        double total = 0;
        for (int i = 1; i <= subjects; i++)
        {
            Console.Write("Enter marks for Subject " + i + ": ");
            double marks = Convert.ToDouble(Console.ReadLine());
            total += marks;
        }

        double average = total / subjects;

        Console.WriteLine("\n\t Report Card ");
        Console.WriteLine(" Name:- " + name);
        Console.WriteLine(" Std:- " + std);
        Console.WriteLine(" Div:- " + div);
        Console.WriteLine(" Avg Score:- " + average.ToString("F2"));
        
    }
}