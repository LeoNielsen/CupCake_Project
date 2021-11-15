package business.entities;

public class Admin
{
    private int id;
    private String email;
    private String password;
    private String role;
    private String phoneNr;
    private String firstname;
    private String lastname;

    public Admin(int id, String email, String password, String role, String phoneNr, String firstname, String lastname)
    {
        this.id = id;
        this.email = email;
        this.password = password;
        this.role = role;
        this.phoneNr = phoneNr;
        this.firstname = firstname;
        this.lastname = lastname;
    }

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

    public String getEmail()
    {
        return email;
    }

    public void setEmail(String email)
    {
        this.email = email;
    }

    public String getPassword()
    {
        return password;
    }

    public void setPassword(String password)
    {
        this.password = password;
    }

    public String getRole()
    {
        return role;
    }

    public void setRole(String role)
    {
        this.role = role;
    }

    public String getPhoneNr()
    {
        return phoneNr;
    }

    public void setPhoneNr(String phoneNr)
    {
        this.phoneNr = phoneNr;
    }

    public String getFirstname()
    {
        return firstname;
    }

    public void setFirstname(String firstname)
    {
        this.firstname = firstname;
    }

    public String getLastname()
    {
        return lastname;
    }

    public void setLastname(String lastname)
    {
        this.lastname = lastname;
    }
}
