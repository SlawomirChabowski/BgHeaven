using System.Security.Cryptography;
using System.Text;

/// <summary>
/// Hashing a string
/// </summary>
public class PasswordHash
{
    public static string Create(string password)
    {
        byte[] pwdBytes = Encoding.Default.GetBytes(password);
        byte[] pwdHash = SHA384Managed.Create().ComputeHash(pwdBytes);


        StringBuilder sb = new StringBuilder();
        for (int i = 0; pwdHash != null && i < pwdHash.Length; i++)
        {
            sb.AppendFormat("{0:x2}", pwdHash[i]);
        }

        return sb.ToString();
    }
}