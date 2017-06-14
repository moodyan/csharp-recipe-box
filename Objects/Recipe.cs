using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace RecipeBox.Objects
{
  public class Recipe
  {
    private string _recipeName;
    private int _rating;
    private string _instructions;
    private int _id;

    public Recipe(string RecipeName, int Rating, string Instructions, int Id = 0)
    {
      _recipeName = RecipeName;
      _rating = Rating;
      _instructions = Instructions;
      _id = Id;
    }

    public int GetId()
    {
      return _id;
    }
    public string GetRecipeName()
    {
      return _recipeName;
    }
    public int GetRating()
    {
      return _rating;
    }
    public string GetInstructions()
    {
      return _instructions;
    }

    public override bool Equals(System.Object otherRecipe)
    {
      if (!(otherRecipe is Recipe))
      {
        return false;
      }
      else
      {
        Recipe newRecipe = (Recipe) otherRecipe;
        bool idEquality = (this.GetId() == newRecipe.GetId());
        bool recipeNameEquality = (this.GetRecipeName() == newRecipe.GetRecipeName());
        bool ratingEquality = (this.GetRating() == newRecipe.GetRating());
        bool instructionsEquality = (this.GetInstructions() == newRecipe.GetInstructions());
        return (idEquality && recipeNameEquality && ratingEquality && instructionsEquality);
      }
    }

    public static void DeleteAll()
   {
     SqlConnection conn = DB.Connection();
     conn.Open();
     SqlCommand cmd = new SqlCommand("DELETE FROM recipes;", conn);
     cmd.ExecuteNonQuery();
     conn.Close();
   }

   public static List<Recipe> GetAll()
    {
      List<Recipe> allRecipes = new List<Recipe>{};

      SqlConnection conn = DB.Connection();
      conn.Open();

      SqlCommand cmd = new SqlCommand("SELECT * FROM recipes;", conn);
      SqlDataReader rdr = cmd.ExecuteReader();

      while(rdr.Read())
      {
        int recipeId = rdr.GetInt32(0);
        string recipeName = rdr.GetString(1);
        int recipeRating = rdr.GetInt32(2);
        string recipeInstructions = rdr.GetString(3);
        Recipe newRecipe = new Recipe(recipeName, recipeRating, recipeInstructions, recipeId);
        allRecipes.Add(newRecipe);
      }
      if (rdr != null)
      {
        rdr.Close();
      }
      if (conn != null)
      {
        conn.Close();
      }
      return allRecipes;
    }

    public void Save()
    {
      SqlConnection conn = DB.Connection();
      conn.Open();

      SqlCommand cmd = new SqlCommand("INSERT INTO recipes (recipe_name, rating, instructions) OUTPUT INSERTED.id VALUES (@RecipeName, @RecipeRating, @RecipeInstructions)", conn);

      SqlParameter recipeNameParameter = new SqlParameter();
      recipeNameParameter.ParameterName = "@RecipeName";
      recipeNameParameter.Value = this.GetRecipeName();

      SqlParameter recipeRatingParameter = new SqlParameter();
      recipeRatingParameter.ParameterName = "@RecipeRating";
      recipeRatingParameter.Value = this.GetRating();

      SqlParameter recipeInstructionsParameter = new SqlParameter();
      recipeInstructionsParameter.ParameterName = "@RecipeInstructions";
      recipeInstructionsParameter.Value = this.GetInstructions();

      cmd.Parameters.Add(recipeNameParameter);
      cmd.Parameters.Add(recipeRatingParameter);
      cmd.Parameters.Add(recipeInstructionsParameter);
      SqlDataReader rdr = cmd.ExecuteReader();

      while(rdr.Read())
      {
        this._id = rdr.GetInt32(0);
      }
      if (rdr != null)
      {
        rdr.Close();
      }
      if(conn != null)
      {
        conn.Close();
      }
    }

    public static Recipe Find(int id)
    {
      SqlConnection conn = DB.Connection();
      conn.Open();

      SqlCommand cmd = new SqlCommand("SELECT * FROM recipes WHERE id = @RecipeId", conn);
      SqlParameter recipeIdParameter = new SqlParameter();
      recipeIdParameter.ParameterName = "@RecipeId";
      recipeIdParameter.Value = id.ToString();
      cmd.Parameters.Add(recipeIdParameter);
      SqlDataReader rdr = cmd.ExecuteReader();

      int foundRecipeId = 0;
      string foundRecipeName = null;
      int foundRecipeRating = 0;
      string foundRecipeInstructions = null;

      while(rdr.Read())
      {
        foundRecipeId = rdr.GetInt32(0);
        foundRecipeName = rdr.GetString(1);
        foundRecipeRating = rdr.GetInt32(2);
        foundRecipeInstructions = rdr.GetString(3);
      }
      Recipe foundRecipe = new Recipe(foundRecipeName, foundRecipeRating, foundRecipeInstructions, foundRecipeId);

      if (rdr != null)
     {
       rdr.Close();
     }
     if (conn != null)
     {
       conn.Close();
     }

     return foundRecipe;
    }
  }
}
