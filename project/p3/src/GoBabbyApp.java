import java.sql.*;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.LinkedList;
import java.util.Scanner;

class simpleJDBC
{
    // This is the url you must use for DB2.
    //Note: This url may not valid now ! Check for the correct year and semester and server name.
    private static  String url = "jdbc:db2://winter2022-comp421.cs.mcgill.ca:50000/cs421";

    //REMEMBER to remove your user id and password before submitting your code!!
    private static  String your_userid = "";
    private static  String your_password = "";

    private static Scanner sc = new Scanner(System.in);

    private static int sqlCode=0;      // Variable to hold SQLCODE
    private static String sqlState="00000";  // Variable to hold SQLSTATE

    private static boolean D = true;

    private static LinkedList<appointment> appointments=new LinkedList<appointment>();

    private static boolean notDone = true;



    public static void main ( String [ ] args ) throws SQLException
    {
        // Unique table names.  Either the user supplies a unique identifier as a command line argument, or the program makes one up.
        String tableName = "";
        int sqlCode=0;      // Variable to hold SQLCODE
        String sqlState="00000";  // Variable to hold SQLSTATE

        if ( args.length > 0 )
            tableName += args [ 0 ] ;
        else
            tableName += "exampletbl";
        //1. Register Driver
        //2. connection
        //3.stmt to retrieve
        //4.execute
        //5.
        //6.Release data

        //1. Register the driver.  You must register the driver before you can use it.
        try { DriverManager.registerDriver ( new com.ibm.db2.jcc.DB2Driver() ) ; }
        catch (Exception cnfe){ System.out.println("Class not found"); }


        //AS AN ALTERNATIVE, you can just set your password in the shell environment in the Unix (as shown below) and read it from there.
        //$  export SOCSPASSWD=yoursocspasswd
        if(your_userid == null && (your_userid = System.getenv("SOCSUSER")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        if(your_password == null && (your_password = System.getenv("SOCSPASSWD")) == null)
        {
            System.err.println("Error!! do not have a password to connect to the database!");
            System.exit(1);
        }
        //2
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        //3
        Statement statement = con.createStatement ( ) ;

        /*
        // Creating a table
        try
        {
            String createSQL = "CREATE TABLE " + tableName + " (id INTEGER, name VARCHAR (25)) ";
            System.out.println (createSQL ) ;
            statement.executeUpdate (createSQL ) ;
            System.out.println ("DONE");
        }
        catch (SQLException e)
        {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }

        // Inserting Data into the table
        try
        {
            String insertSQL = "INSERT INTO " + tableName + " VALUES ( 1 , \'Vicki\' ) " ;
            System.out.println ( insertSQL ) ;
            statement.executeUpdate ( insertSQL ) ;
            System.out.println ( "DONE" ) ;

            insertSQL = "INSERT INTO " + tableName + " VALUES ( 2 , \'Vera\' ) " ;
            System.out.println ( insertSQL ) ;
            statement.executeUpdate ( insertSQL ) ;
            System.out.println ( "DONE" ) ;
            insertSQL = "INSERT INTO " + tableName + " VALUES ( 3 , \'Franca\' ) " ;
            System.out.println ( insertSQL ) ;
            statement.executeUpdate ( insertSQL ) ;
            System.out.println ( "DONE" ) ;

        }
        catch (SQLException e)
        {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }

        // Querying a table
        try
        {
            String querySQL = "SELECT id, name from " + tableName + " WHERE NAME = \'Vicki\'";
            System.out.println (querySQL) ;
            java.sql.ResultSet rs = statement.executeQuery ( querySQL ) ;

            while ( rs.next ( ) )
            {
                int id = rs.getInt ( 1 ) ;
                String name = rs.getString (2);
                System.out.println ("id:  " + id);
                System.out.println ("name:  " + name);
            }
            System.out.println ("DONE");
        }
        catch (SQLException e)
        {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }

        //Updating a table
        try
        {
            String updateSQL = "UPDATE " + tableName + " SET NAME = \'Mimi\' WHERE id = 3";
            System.out.println(updateSQL);
            statement.executeUpdate(updateSQL);
            System.out.println("DONE");

            // Dropping a table
            String dropSQL = "DROP TABLE " + tableName;
            System.out.println ( dropSQL ) ;
            statement.executeUpdate ( dropSQL ) ;
            System.out.println ("DONE");
        }
        catch (SQLException e)
        {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }

         */
      //  System.out.println("start");
        //1. login ; if E:  exit ; check if pracid is valid, if so continue; if no, print error message
        Integer inputpracID=menu();
        boolean loginSuccess = false;
        loginSuccess = checkLogin (inputpracID);
        while(!loginSuccess){
            System.out.println("Not valid; please re-enter");
            inputpracID=menu();
            loginSuccess = checkLogin (inputpracID);
        }
        System.out.println("login successfully");
        int aNum = -999;
        String inputDate = inputDate();
        while(D) {

            listAppointments(inputpracID,inputDate);
            //2. list appointment
            System.out.println("Enter the appointment number that you would like to work on.");
            System.out.println("                 [E] to exit [D] to go back to another date :");
            sc = new Scanner(System.in);
            String a = sc.nextLine();
            if(a.equals("D")){
                D=true;

                appointments.clear();
                inputDate = inputDate();
                continue;
            }else if(a.equals("E")  ) {
                statement.close ( ) ;
                con.close ( ) ;
                System.exit(0);
            }else{
                aNum=Integer.parseInt(a);

                System.out.println("For "+appointments.get(aNum-1).getName()+" "+appointments.get(aNum-1).getHcardID());
                notDone = true;
                while(notDone) {
                    System.out.println("\n1. Review notes\n" +
                            "2. Review tests\n" +
                            "3. Add a note\n" +
                            "4. Prescribe a test\n" +
                            "5. Go back to the appointments.\n" +
                            "\nEnter your choice: \n");
                    int i = sc.nextInt();
                    switch (i) {
                        case 5:
                            notDone = false;
                            D = true;
                           // appointments.clear();
                            break;
                        case 1:
                            reviewNotes(appointments.get(aNum - 1));
                            break;
                        case 2:
                            reviewTests(appointments.get(aNum - 1));
                            break;
                        case 3:
                            addANote(appointments.get(aNum - 1));
                            break;
                        case 4:
                            prescirbeATest(appointments.get(aNum - 1),inputpracID);
                    }
                }

            }
        }



        // Finally but importantly close the statement and connection
        statement.close ( ) ;
        con.close ( ) ;
    }

    private static String inputDate() {
        System.out.println("Please enter the date of appointment list [E] to exit: ");
        sc=new Scanner(System.in);
        String input = sc.nextLine();
        if(input.equals("E")){
        System.exit(0);
        }
         return input;

    }

    private static void prescirbeATest(appointment appointment, Integer inputpracID) throws SQLException {
        appointment theAppointment = appointment;
        Integer inputpID = inputpracID;
        int testID = -1;
        //2
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        //3
        Statement statement = con.createStatement ( ) ;
        long millis=System.currentTimeMillis();
        java.sql.Date thisDate = new java.sql.Date(millis);
        // Querying the notesid
        try
        {
            String querySQL = " select MAX(TestID) from Tests";
        //    System.out.println (querySQL) ;
            java.sql.ResultSet rs = statement.executeQuery ( querySQL ) ;

            while ( rs.next ( ) )
            {
                testID = rs.getInt ( 1 ) ;

            //    System.out.println ("id:  " + testID);
                testID+=1;
              //  System.out.println ("new id:  " + testID);
            }
         //   System.out.println ("DONE");
        }
        catch (SQLException e)
        {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }

        if(testID>0) {
            System.out.println ( "Please enter the type of test" ) ;
            sc = new Scanner(System.in);
            String ttype = sc.nextLine();
            System.out.println("input: "+ttype);
            try {
                String insertSQL = "INSERT INTO Tests (testid,ttype,prescdate,sampdate,labdate,results,pracID,pregnum,coupleID,babyID,techID) VALUES ('"+testID+"','"+ttype+"','"+thisDate+"',null,null,null,'"+inputpID+"','"+theAppointment.getPregnum()+"','"+theAppointment.getCoupleID()+"',null,null);";
             //   System.out.println(insertSQL);
                statement.executeUpdate(insertSQL);
                System.out.println("DONE");


            } catch (SQLException e) {
                sqlCode = e.getErrorCode(); // Get SQLCODE
                sqlState = e.getSQLState(); // Get SQLSTATE

                // Your code to handle errors comes here;
                // something more meaningful than a print would be good
                System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                System.out.println(e);
            }
        }


    }

    private static void addANote(appointment appointment) throws SQLException {
        appointment theAppointment = appointment;
        //2
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        //3
        Statement statement = con.createStatement ( ) ;
        int thisPregnum = theAppointment.getPregnum();
        int thisCoupleID = theAppointment.getCoupleID();
        int thisAppointmentid =theAppointment.getAppointmentID();

        long millis=System.currentTimeMillis();
        java.sql.Date thisDate = new java.sql.Date(millis);
        LocalTime time = LocalTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
        java.sql.Time theTime = Time.valueOf(time.format(formatter));

        System.out.println ( "Please type your observation" ) ;
        sc = new Scanner(System.in);
        String theNotes = sc.nextLine();
        System.out.println("input: "+theNotes);
        int notesID = -1;


        // Querying the notesid
        try
        {
            String querySQL = "select MAX(NOTEID) from notes";
         //   System.out.println (querySQL) ;
            java.sql.ResultSet rs = statement.executeQuery ( querySQL ) ;

            while ( rs.next ( ) )
            {
                notesID = rs.getInt ( 1 ) ;

           //     System.out.println ("id:  " + notesID);
                notesID+=1;
             //   System.out.println ("new id:  " + notesID);
            }
        //    System.out.println ("DONE");
        }
        catch (SQLException e)
        {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }
        if(notesID>0) {
            try {
                String insertSQL = "Insert into notes (noteID,appointmentid,content,ndate,ntime)  VALUES ('" + notesID + "', '" + thisAppointmentid + "','" + theNotes + "','" + thisDate + "','" + theTime + "')";
            //    System.out.println(insertSQL);
                statement.executeUpdate(insertSQL);
                System.out.println("DONE");


            } catch (SQLException e) {
                sqlCode = e.getErrorCode(); // Get SQLCODE
                sqlState = e.getSQLState(); // Get SQLSTATE

                // Your code to handle errors comes here;
                // something more meaningful than a print would be good
                System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
                System.out.println(e);
            }
        }
    }

    private static void reviewTests(appointment appointment) throws SQLException {
        appointment theAppointment = appointment;
        //2
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        //3
        Statement statement = con.createStatement ( ) ;
        int thisPregnum = theAppointment.getPregnum();
        int thisCoupleID = theAppointment.getCoupleID();
        try
        {
           // String querySQL = "select prescdate, ttype, substring(results,1,50) as results from tests\n" +
             //       "where coupleid = "+thisCoupleID+" and pregnum ="+thisPregnum+" Order by prescdate DESC";
            String querySQL = "select prescdate, ttype, substring(result,1,50) from(\n" +
                    " select prescdate, ttype,case when results is null then 'Pending'\n" +
                    "     when results is not null then results\n" +
                    "     end as result\n" +
                    " from tests\n" +
                    " where coupleid = "+thisCoupleID+" and pregnum ="+thisPregnum+"\n" +
                    " Order by prescdate DESC)";
         //   System.out.println (querySQL) ;
            java.sql.ResultSet rs = statement.executeQuery ( querySQL ) ;
            while ( rs.next ( ) )
            {
                Date nDate = rs.getDate ( 1 ) ;
                String ttype = rs.getNString(2);
                String results = rs.getNString(3);
                System.out.print (nDate+" [");
                System.out.print (ttype+"] ");
                System.out.print (results+" \n");
            }
        //    System.out.println ("DONE");
        }
        catch (SQLException e)
        {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }
    }

    private static void reviewNotes(appointment appointment) throws SQLException {
        appointment theAppointment = appointment;
        //2
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        //3
        Statement statement = con.createStatement ( ) ;
        int thisAppointmentID = theAppointment.getAppointmentID();
        try
        {
            String querySQL = "select ndate, ntime, substring(content,1,50) as content from notes\n" +
                    "where appointmentid = "+thisAppointmentID+" Order by ndate DESC, Ntime   ";
          //  System.out.println (querySQL) ;
            java.sql.ResultSet rs = statement.executeQuery ( querySQL ) ;

            while ( rs.next ( ) )
            {
                Date nDate = rs.getDate ( 1 ) ;
                Time nTime = rs.getTime (2);
                String content = rs.getNString(3);
                System.out.print (nDate+" ");
                System.out.print (nTime+" ");
                System.out.print (content+" \n");
            }
        //    System.out.println ("DONE");
        }
        catch (SQLException e)
        {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }
    }

    private static void listAppointments(Integer inputpracID, String inputDate) throws SQLException {
        Integer inputID = inputpracID;
        //2
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        //3
        Statement statement = con.createStatement ( ) ;

      //  inputDate = inputDate;
        boolean dateIsValid = false;
        int appointNum = 0;
        // Querying a table
        try
        {
 /*           String querySQL = "  select Atime,isP,Name,HcardID from (\n" +
                    "    select ppracId, bpracid, Case when ppracid = "+inputID+" then 'P'\n" +
                    "    when bpracid = "+inputID+" then 'B' end as isP\n" +
                    "        , Atime, name, HcardID from\n" +
                    "    ( Select Atime, name, HcardID, A.coupleID, pregnum, adate from\n" +
                    "    appointment as A left join (\n" +
                    "    select name, c.hcardid, coupleid from\n" +
                    "    couple as c left join mother as m\n" +
                    "    on c.hcardid = m.hcardid\n" +
                    "    ) as C\n" +
                    "    on A.coupleID = C.coupleID) as Ap left join\n" +
                    "    ( select ppracID, bpracid, coupleid, num from pregnancy) as B\n" +
                    "    on Ap.coupleID = B.coupleID and Ap.pregnum = B.num\n" +
                    "    where (ppracid = "+inputID+" or bpracid = "+inputID+") and adate = '"+input+"')";
*/
            String querySQL = "  select Atime,isP,Name,HcardID,appointmentid,pregnum,coupleid from (\n" +
                    "    select ppracId, bpracid, Case when ppracid = "+inputID+" then 'P'\n" +
                    "    when bpracid = "+inputID+" then 'B' end as isP\n" +
                    "        , Atime, name, HcardID,appointmentid,pregnum,Ap.coupleid from\n" +
                    "    ( Select Atime, name, HcardID, A.coupleID, pregnum, adate,appointmentid from\n" +
                    "    appointment as A left join (\n" +
                    "    select name, c.hcardid, coupleid from\n" +
                    "    couple as c left join mother as m\n" +
                    "    on c.hcardid = m.hcardid\n" +
                    "    ) as C\n" +
                    "    on A.coupleID = C.coupleID) as Ap left join\n" +
                    "    ( select ppracID, bpracid, coupleid, num from pregnancy) as B\n" +
                    "    on Ap.coupleID = B.coupleID and Ap.pregnum = B.num\n" +
                    "    where (ppracid = "+inputID+" or bpracid = "+inputID+") and adate = '"+inputDate+"') Order by Atime";

    //        System.out.println (querySQL) ;
            java.sql.ResultSet rs = statement.executeQuery ( querySQL ) ;



                while(rs.next ( )) {
                    appointNum += 1;
                    System.out.print(appointNum+":");
                    Time atime = rs.getTime(1);
                    String isP = rs.getString(2);
                    String name = rs.getString(3);
                    int hcardID = rs.getInt(4);
                    int appointmentid = rs.getInt(5);
                    int pregnum = rs.getInt(6);
                    int coupleID = rs.getInt(7);
                    System.out.print("  " + atime);
                    System.out.print("  " + isP);
                    System.out.print("  " + name);
                    System.out.print("  " + hcardID + "\n");

                    appointments.add(new appointment(atime, isP, name, hcardID, appointmentid, pregnum, coupleID));
                }
                if(appointments.isEmpty()){
                System.out.print("There is no appointment in that date.");
            }
         //   System.out.println ("DONE");
        }
        catch (SQLException e)
        {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE

            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }

    }


    private static boolean checkLogin(Integer inputpracID) throws SQLException {

        boolean loginSuccess =false;
        Integer inputPracID = inputpracID;
        //2
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        //3
        Statement statement = con.createStatement ( ) ;
        // Querying a table
        try
        {
            String querySQL = "SELECT pracid from midwife WHERE pracID = " + inputPracID;
           // System.out.println (querySQL) ;
            java.sql.ResultSet rs = statement.executeQuery ( querySQL ) ;

            if ( rs.next ( ) )
            {
                loginSuccess = true;
            }
            else {
                loginSuccess = false;
            }
        }
        catch (SQLException e)
        {
            sqlCode = e.getErrorCode(); // Get SQLCODE
            sqlState = e.getSQLState(); // Get SQLSTATE
            // Your code to handle errors comes here;
            // something more meaningful than a print would be good
            System.out.println("Code: " + sqlCode + "  sqlState: " + sqlState);
            System.out.println(e);
        }
        return loginSuccess;
    }

    private static Integer menu() throws SQLException {
        //2
        Connection con = DriverManager.getConnection (url,your_userid,your_password) ;
        //3
        Statement statement = con.createStatement ( ) ;
        Integer inputPracID =initUI();
        if(inputPracID==null){
            statement.close ( ) ;
            con.close ( ) ;
            System.exit(0);
        }
        return inputPracID;
    }


    private static Integer initUI() {
        String intro ="Please enter your practitioner id [E] to exit: ";
        System.out.println(intro);

        String input = sc.nextLine();
        if(input.equals("E")){
            return null;
        }
        Integer ID = null;
        try {
            ID = Integer.parseInt(input);
        }
        catch(Exception e){
            System.out.println("Invalid Input");
            return initUI();
        }
        return ID;
    }
}
class appointment{

    private  Time aTime;
    private  String isP;
    private  String name;
    private  Integer HcardID;

    public int getAppointmentID() {
        return appointmentID;
    }

    private int appointmentID;

    public int getPregnum() {
        return pregnum;
    }

    private int pregnum;

    public int getCoupleID() {
        return coupleID;
    }

    private int coupleID;

    public static void main (String[] args){

    }
    public appointment(Time aTime,String isP,String name,Integer HcardID,int appointmentID, int pregnum,int coupleID){

        this.aTime=aTime;
        this.isP= isP;
        this.name =name;
        this.HcardID=HcardID;
        this.appointmentID=appointmentID;
        this.pregnum=pregnum;
        this.coupleID=coupleID;
    }
    public Time getaTime(){
        return this.aTime;
    }

    public String getIsP() {
        return isP;
    }

    public String getName() {
        return name;
    }

    public Integer getHcardID() {
        return HcardID;
    }

}
