using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.IO;

namespace Problem9
{
    class Program
    {
        static void Main(string[] args)
        {
            FileStream fs1 = new FileStream(@"Text.txt", FileMode.Open);
            StreamReader sr1 = new StreamReader(fs1);
            int n = 0;
            List<string> Input = new List<string>();
            while (!sr1.EndOfStream)
            {
                Input.Add(sr1.ReadLine().ToString());
            }
            sr1.Close();
            fs1.Close();

            n = Convert.ToInt32(Input[0]);

            List<int> Sum = new List<int>();
            for (int i = 1; i < n + 1; i++)
            {
                List<int> element = new List<int>();
                string input = Input[i] + " ";

                string space = Convert.ToString(" ");
                int pos = 0;
                string word = "";

                while (pos < input.Length)
                {
                    if (input[pos].ToString() == space)
                    {
                        element.Add(Convert.ToInt32(word));
                        word = "";
                        pos++;
                    }
                    else
                    {
                        word = word + input[pos];
                        pos++;
                    }
                }

                int a = element[0];
                int b = element[1];
                int c = element[2];

                int triangle = 0;
                if (a + b > c) 
                {
                    if (a + c > b) 
                    {
                        if (b + c > a) 
                        {
                            triangle = 1;
                        }
                    }
                }


               Sum.Add(Convert.ToInt32(triangle));

            }


            FileStream fs2 = new FileStream(@"Answer.txt", FileMode.Create);
            StreamWriter wr1 = new StreamWriter(fs2);
            for (int i = 0; i < n; i++)
            {
                wr1.Write(Sum[i] + " ");
            }

            wr1.Close();
            fs2.Close();
            Console.WriteLine("Mission completed");
            Console.ReadKey();

        

        }
    }
}
