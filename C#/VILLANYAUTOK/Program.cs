using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;


namespace NA_Villanyautok
{
    internal class Program
    {
        class Autok
        {
            public string model {  get; set; }
            public string gyarto { get; set; }
            public int megjelenes { get; set; }
            public int hatotav { get; set; }
            public double fogyasztas { get; set; }

            public Autok(string sor) 
            {
                string[] db = sor.Split('#');
                model = db[0];
                gyarto = db[1];
                megjelenes = int.Parse(db[2]);
                hatotav = int.Parse(db[3]);
                fogyasztas = double.Parse(db[4].Replace('.', ','));

            }

            public string Kiir()
            {
                return $"[ {gyarto, -7}] {model, 10} ({megjelenes}) - Hatótáv: {hatotav} km.";
            }
        }
        static void Main(string[] args)
        {
            string[] sorok = File.ReadAllLines("villanyautok.txt", Encoding.Default);
            List<Autok> kocsik = new List<Autok>();
            
            foreach (var sor in sorok)
            {
                kocsik.Add(new Autok(sor));
            }

            // 2. Feladat
            Console.WriteLine($"2. Feladat: {kocsik.Count} darab auto van az adatbazisban.\n");

            // 3. Feladat
            Console.Write("3. Feladat: Adjon meg egy modellt/modell részletet: ");
            string uip = Console.ReadLine();
            bool nincs = true;

            foreach (var auto in kocsik)
            {
                if (auto.model.ToLower().Contains(uip.ToLower()))
                {
                    Console.WriteLine(auto.Kiir()); 
                    nincs = false;
                }
            }

            if (nincs) Console.WriteLine("Nincs ilyen modell a rendszerben");

            // 4. Feladat
            Autok max_hatotav = new Autok("0#0#0#0#0");
            foreach (var auto in kocsik)
            {
                if (auto.hatotav > max_hatotav.hatotav)
                {
                    max_hatotav = auto;
                }
            }
            Console.WriteLine($"\n4. Feladat: a leghosszabb hatótávú autó: \n{max_hatotav.Kiir()}");

            Console.WriteLine("\n5. Feladat: Gyártói statisztika:");

            Console.WriteLine("\t" + new string('-', 60));

            var stat = kocsik.GroupBy(a => a.gyarto);

            foreach (var csoport in stat)
            {
                int osszes = csoport.Count();
                int ujGeneracios = 0;
                foreach (var kocsi in csoport)
                {
                    if (kocsi.megjelenes >= 2020) ujGeneracios++;
                }
                Console.WriteLine($"\t{csoport.Key,-20} | Összesen: {osszes,2} db | Új (2020+): {ujGeneracios,2} db");
            }

            using (StreamWriter sw = new StreamWriter("hatotekony.md", false, Encoding.UTF8))
            {
                sw.WriteLine("| Modell | Gyártó | Fogyasztás |");
                sw.WriteLine("| :--- | :---: | :---: |");

                var hatekonyak = kocsik.Where(a => a.fogyasztas < 15.0);
                foreach (var auto in hatekonyak)
                {
                    sw.WriteLine($"| {auto.model} | {auto.gyarto} | {auto.fogyasztas:0.1} |");
                }
            }
            
        }
    }
}
