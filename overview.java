package libdatabase;
import java.sql.*;
import java.io.*;

public class overview {
	public static void main (String args [])
		throws SQLException, IOException {
	    
		try {
	        Class.forName ("oracle.jdbc.driver.OracleDriver");
	      } catch (ClassNotFoundException e) {
	          System.out.println ("Could not load the driver");
	      }
	    String user, pass;
	    user = readEntry("userid  : ");
	    pass = readEntry("password: ");
	    Connection conn = DriverManager.getConnection
	        ("jdbc:oracle:thin:@acadoradbprd01.dpu.depaul.edu:1521:ACADPRD0",user,pass);
	
	    String query = "select MEM_NAME,PHONE,DOB from LIB_MEMBERS where card = ?";
	    PreparedStatement p = conn.prepareStatement (query);
	    String card = readEntry("Enter a Card Number: ");
	    p.clearParameters();
	    p.setString(1,card);
	    ResultSet r = p.executeQuery();
	    while (r.next ()) {
	    	String mem_name = r.getString(1);
	    	double phone = r.getDouble(2);
	    	double DOB = r.getDouble(3);
	    	System.out.println(mem_name + "  " + phone + "  " + DOB);
	    }
	    conn.close();
	  }
//readEntry function -- to read input string -Enter a Card Number:
static String readEntry(String prompt) {	    
	try {
	       StringBuffer buffer = new StringBuffer();
	       System.out.print(prompt);
	       System.out.flush();
	       int c = System.in.read();
	       while(c != '\n' && c != -1) {
	         buffer.append((char)c);
	         c = System.in.read();
	       }
	       return buffer.toString().trim();
	     } catch (IOException e) {
	       return "";
	       }
	   }
	}
