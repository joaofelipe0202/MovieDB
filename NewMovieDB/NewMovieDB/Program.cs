using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NewMovieDB
{
    class Program
    {
        private static string ConnectionString = @"Data Source=.\SQLEXPRESS;Initial Catalog=WorkTaskMovieDB;Integrated Security=True";
        private static string Path = @"C:\Users\Windows 10\Data";
        private static string MoviePath = Path + @"\Movies.txt";
        private static string UsersPath =  Path + @"\Users.txt";
        private static string RatingsPath = Path + @"\Ratings.txt";

        static void Main(string[] args)
        {
            //Movies
            //Console.WriteLine("Inserting Movies in the database...");
            //InsertMovies(ConnectionString, MoviePath);
            //Console.WriteLine("End of process. Press any key to exit");
            //Console.ReadKey();

            //Users
            //Console.WriteLine("Inserting Users in the database...");
            //InsertUsers(ConnectionString, UsersPath);
            //Console.WriteLine("End of process. Press any key to exit");
            //Console.ReadKey();

            //Ratings
            //Console.WriteLine("Inserting Ratings in the database...");
            //InsertRatings(ConnectionString, RatingsPath);
            //Console.WriteLine("End of process. Press any key to exit");
            //Console.ReadKey();

            //Update Movies
            Console.WriteLine("Updating Movies table...");
            UpdateDate(ConnectionString, MoviePath);
            Console.WriteLine("End of process. Press any key to exit");
            Console.ReadKey();
        }
        static void InsertMovies(string connectionString, string path)
        {
            using(StreamReader sr = File.OpenText(path))
            {
                string line = "";
                while((line = sr.ReadLine()) != null)
                {
                    var row = line.Split('|');

                    SqlConnection con = null;
                    SqlDataReader reader = null;

                    try
                    {
                        con = new SqlConnection(connectionString);
                        con.Open();
                        SqlCommand cmd = new SqlCommand("dbo.InsertMoviesData", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id", row[0]);
                        cmd.Parameters.AddWithValue("@movie_name", row[1]);
                        reader = cmd.ExecuteReader();
                    }
                    catch(Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                    finally
                    {
                        if(con != null)
                        {
                            con.Close();
                        }
                        if(reader != null)
                        {
                            reader.Close();
                        }
                    }
                }
                sr.Close();
            }
            
        }
        static void InsertUsers(string connectionString, string path)
        {
            using (StreamReader sr = File.OpenText(path))
            {
                string line = "";
                while ((line = sr.ReadLine()) != null)
                {
                    var row = line.Split('|');

                    SqlConnection con = null;
                    SqlDataReader reader = null;

                    try
                    {
                        con = new SqlConnection(connectionString);
                        con.Open();
                        SqlCommand cmd = new SqlCommand("dbo.InsertAuthorData", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id", row[0]);
                        cmd.Parameters.AddWithValue("@author_age", row[1]);
                        cmd.Parameters.AddWithValue("@author_gender", row[2]);
                        cmd.Parameters.AddWithValue("@author_occupation", row[3]);
                        reader = cmd.ExecuteReader();
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                    finally
                    {
                        if (con != null)
                        {
                            con.Close();
                        }
                        if (reader != null)
                        {
                            reader.Close();
                        }
                    }
                }
                sr.Close();
            }
        }
        static void InsertRatings(string connectionString, string path)
        {
            using (StreamReader sr = File.OpenText(path))
            {
                string line = "";
                while ((line = sr.ReadLine()) != null)
                {
                    var row = line.Split('\t');

                    SqlConnection con = null;
                    SqlDataReader reader = null;

                    try
                    {
                        con = new SqlConnection(connectionString);
                        con.Open();
                        SqlCommand cmd = new SqlCommand("dbo.InsertRatingData", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@author_id", int.Parse(row[0]));
                        cmd.Parameters.AddWithValue("@movie_id", int.Parse(row[1]));
                        cmd.Parameters.AddWithValue("@rating_value", int.Parse(row[2]));
                        reader = cmd.ExecuteReader();
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                    finally
                    {
                        if (con != null)
                        {
                            con.Close();
                        }
                        if (reader != null)
                        {
                            reader.Close();
                        }
                    }
                }
                sr.Close();
            }
        }
        static void UpdateDate(string connectionString, string path)
        {
            using (StreamReader sr = File.OpenText(path))
            {
                string line = "";
                while ((line = sr.ReadLine()) != null)
                {
                    var row = line.Split('|');

                    SqlConnection con = null;
                    SqlDataReader reader = null;

                    try
                    {
                        con = new SqlConnection(connectionString);
                        con.Open();
                        SqlCommand cmd = new SqlCommand("dbo.UpdateWithDate", con);
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Parameters.AddWithValue("@id", int.Parse(row[0]));
                        cmd.Parameters.AddWithValue("@released_date", row[2]);
                        reader = cmd.ExecuteReader();
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message);
                    }
                    finally
                    {
                        if (con != null)
                        {
                            con.Close();
                        }
                        if (reader != null)
                        {
                            reader.Close();
                        }
                    }
                }
                sr.Close();
            }
        }
    }
}
