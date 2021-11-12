package business.entities;

public class User
{

    public User(String email, String password, String role, float accountBalance, String firstname, String lastname, String streetname, String houseNr, String zipcode, String city, String phoneNr)
    {
        this.email = email;
        this.password = password;
        this.role = role;
        this.accountbalance = accountBalance;
        this.firstname = firstname;
        this.lastname = lastname;
        this.streename = streetname;
        this.houseNr = houseNr;
        this.zipcode = zipcode;
        this.city = city;
        this.phoneNr = phoneNr;

    }



    private int id; // just used to demo retrieval of autogen keys in UserMapper
    private String email;
    private String password; // Should be hashed and secured
    private String role;
    private float accountbalance;
    private String firstname;
    private String lastname;
    private String streename;
    private String houseNr;
    private String zipcode;
    private String city;
    private String phoneNr;


    public User(String email, String password, String role, String firstname)
    {
        this.email = email;
        this.password = password;
        this.role = role;
        this.firstname = firstname;
    }

    public User(int id, String email, String password, String role, float acBalance, String firstname, String lastname, String phoneNr, String streetName, String houseNr, String zipcode)
    {
        this.id = id;
        this.email = email;
        this.password = password;
        this.role = role;
        this.accountbalance = acBalance;
        this.firstname = firstname;
        this.lastname = lastname;
        this.streename = streetName;
        this.houseNr = houseNr;
        this.zipcode = zipcode;
        this.phoneNr = phoneNr;

    }


    public float getAccountbalance()
    {
        return accountbalance;
    }

    public void setAccountbalance(float accountbalance)
    {
        this.accountbalance = accountbalance;
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

    public String getStreename()
    {
        return streename;
    }

    public void setStreename(String streename)
    {
        this.streename = streename;
    }

    public String getHouseNr()
    {
        return houseNr;
    }

    public void setHouseNr(String houseNr)
    {
        this.houseNr = houseNr;
    }

    public String getZipcode()
    {
        return zipcode;
    }

    public void setZipcode(String zipcode)
    {
        this.zipcode = zipcode;
    }

    public String getCity()
    {
        return city;
    }

    public void setCity(String city)
    {
        this.city = city;
    }

    public String getPhoneNr()
    {
        return phoneNr;
    }

    public void setPhoneNr(String phoneNr)
    {
        this.phoneNr = phoneNr;
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

    public int getId()
    {
        return id;
    }

    public void setId(int id)
    {
        this.id = id;
    }

}
