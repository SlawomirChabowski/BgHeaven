﻿using System;
using System.Data.SqlClient;

public partial class MainLayout : System.Web.UI.MasterPage
{
    // control variables
    Boolean registerBox_pwdsNotMatch;
    Boolean loginBox_wrongData;

    protected void Page_Load(object sender, EventArgs e)
    {
        registerBox_pwdsNotMatch = false;
        loginBox_wrongData = false;

        if (Session["login"] == null)
        {
            UserStatusMultiView.SetActiveView(NotLoggedInView);
        }
        else
        {
            UserStatusMultiView.SetActiveView(LoggedInView);
            UserNameLabel.Text = Session["login"].ToString();
        }

        if (Convert.ToInt32(Session["rank"]) == 1)
            AdminPanelButton.Visible = true;
        else
            AdminPanelButton.Visible = false;
    }

    protected void CreateAccountButton_Click(object sender, EventArgs e)
    {
        // getting values from site
        string login = r_LoginTextBox.Text;
        string password = r_PasswordTextBox.Text;
        string rep_password = r_RepeatPasswordTextBox.Text;
        string email = r_EmailTextBox.Text;
        string about = r_AboutTextBox.Text;

        if (password != rep_password)
        {
            registerBox_pwdsNotMatch = true;
        }
        else
        {
            r_PasswordTextBox.Text = PasswordHash.Create(password);

            // insert values
            CreateUserDataSource.Insert();
        }
    }

    protected void LoginButton_click(object sender, EventArgs e)
    {
        // connect to database and select the user
        SqlConnection conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["ProkektConnectionString"].ConnectionString);
        // select rank to recognize administrators
        SqlCommand command = new SqlCommand("SELECT id, name, rank FROM t_user WHERE name = @name AND password = @password;", conn);
        // hash the password
        string pwd_hash = PasswordHash.Create(l_PasswordTextBox.Text);

        // insert the parameters
        command.Parameters.AddWithValue("@name", l_LoginTextBox.Text);
        command.Parameters.AddWithValue("@password", pwd_hash);

        try
        {
            conn.Open();

            // if found an user
            if (command.ExecuteScalar() != null)
            {
                using (var reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        // change value of logged in user id
                        Session["id"] = reader[0];
                        // change value of login property
                        Session["login"] = reader[1];
                        // add rank as a session value
                        Session["rank"] = reader[2];
                    }
                }

                // make being logged in visible for user
                UserStatusMultiView.SetActiveView(LoggedInView);
                UserNameLabel.Text = Session["login"].ToString();

                if (Convert.ToInt32(Session["rank"]) == 1)
                    AdminPanelButton.Visible = true;
                else
                    AdminPanelButton.Visible = false;

            }
            else
            {
                loginBox_wrongData = true;
            }

            conn.Close();
        }
        catch (Exception ex)
        {
            Console.WriteLine("An error occured while trying to login: " + ex.Message);
            conn.Close();
        }
    }

    // logout
    protected void logout_Click(object sender, EventArgs e)
    {
        Session["id"] = null;
        Session["login"] = null;
        Session["rank"] = null;
        UserStatusMultiView.SetActiveView(NotLoggedInView);
    }

    protected void AdminPanelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("panel");
    }


    protected void SearchButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Search.aspx?q=" + SearchTextBox.Text);
    }
}