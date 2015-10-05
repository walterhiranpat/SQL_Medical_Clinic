import java.sql.*;  //Import the java SQL library
class MyProg     //Create a new class to encapsulate the program
{
 
 public static void SQLError (Exception e)   
 {
	System.out.println("ORACLE error detected:");
	e.printStackTrace();	
 }

public static void main (String args[])  
  {


    try {//Keep an eye open for errors 
      String driverName = "oracle.jdbc.driver.OracleDriver";
      Class.forName(driverName);
      System.out.println("Connecting   to Oracle...");  
      String url = "jdbc:oracle:thin:@apollo.ite.gmu.edu:1521:ite10g";
      Connection conn = DriverManager.getConnection(url,"whiranpa","ejinse");
      System.out.println("Connected!");
      
      /* PROBLEM 1: */
      Statement stmt1 = conn.createStatement();   // Staff Activity for the Quarter April 1 - June 30, 2015
      Statement stmt1a = conn.createStatement();
      Statement stmt1b = conn.createStatement(); 
      Statement stmt1c = conn.createStatement();     
      ResultSet query1 = stmt1.executeQuery(
      	"SELECT Staff.Emp, Ename, title" +
        " FROM staff join visit on staff.emp=visit.emp" +
        " where (vdate>=150401 and vdate<=150630)" +
        " group by Staff.Emp, Ename, Title"
        );  
      System.out.println("\nReport Title: Staff Activity for the Quarter April 1- June 30, 2015\n");
      while (query1.next()){ //Problem 1 part 1
        String tempEMP=query1.getString("Emp");
    	  System.out.println(
          "Employee Number: " + tempEMP + 
          ", Name: " + query1.getString("ename") + 
          ", Title: " + query1.getString("Title")
          );
    	  ResultSet query1a = stmt1a.executeQuery(
          "SELECT vdiagnoses.vdate, ssn, pname,sum(price) as totalcharges" +
          " FROM ((vdiagnoses join visit on vdiagnoses.vdate=visit.vdate and vdiagnoses.ssn=visit.ssn)" + 
          " join patient on vdiagnoses.ssn=patient.ssn)" +
          " join diagnose on vdiagnoses.dcode=diagnose.dcode" + 
          " where visit.emp= " + tempEMP +
          " group by (visit.emp, vdiagnoses.vdate, ssn, pname)" + 
          " having (vdiagnoses.vdate>=150401 and vdiagnoses.vdate<=150630)"
        );
    	  while(query1a.next()){ //Problem 1 part 2
    	    System.out.println(
           "\tDate Of Visit: " + query1a.getString("vdate") +
           ", Patient SSN: " + query1a.getString("ssn") +
           ", Patient name: " + query1a.getString("pname") +
           ", Total charges: " + query1a.getString("totalcharges")
           );
    	   }

    	  ResultSet query1f =stmt1b.executeQuery( //Problem 1 part 3
          "SELECT count(vdate) as numberofvisit, sum(price) as totalcharges, avg(price)as avgcharge"+
          " FROM staff join visit on staff.emp=visit.emp" + 
          " join vdiagnoses on visit.vdate=vdiagnoses.vdate and visit.ssn=vdiagnoses.ssn" + 
          " join diagnose on vdiagnoses.dcode=diagnose.dcode"+
          " where staff.emp= "+ tempEMP +
          " and (vdate>=150401 and vdate<=150630)"
          );
    	  while(query1f.next()){
    	  System.out.println(
          "\tTotal number of Visits: "+query1f.getString("numberofvisit") + 
          ", The Total Charges: "+query1f.getString("totalcharges")+ 
          ", The Average Charge per Visit: "+query1f.getString("avgcharge")+"\n"
          );
    	}
      }
      //Note
      System.out.println("The following staff members were not active in this period:");
      ResultSet query1ex = stmt1c.executeQuery(
        "SELECT Emp, Ename, title" +
        " From Staff " +
        " minus" +
        " SELECT staff.Emp, ename, title" +
        " FROM staff join visit on staff.emp=visit.emp" +
        " where (vdate>=150401 and vdate<=150630)"
        );
      while(query1ex.next()){
        System.out.println(
          "\tEmployee Number: " + query1ex.getString("Emp") +
          ", Employee Name: " + query1ex.getString("ename") + 
          ", Title: " + query1ex.getString("title")
        );
      }



      /* PROBLEM 2: */
      Statement stmt2 = conn.createStatement();   // Patient Activity in the Quarter April 1 - June 30, 2015
      Statement stmt2a = conn.createStatement();
      Statement stmt2b = conn.createStatement();
      Statement stmt2c = conn.createStatement();
      ResultSet query2 = stmt2.executeQuery( //Problem 2 part 1
        "SELECT visit.SSN, PNAME " +
        " FROM Visit join Patient on visit.ssn=Patient.ssn" +
        " where (vdate>=150401 and vdate<=150630)"
      );
      System.out.println("\nReport Title: Patient Activity in the Quarter April 1- June 30, 2015\n");
      while(query2.next()){
        String TEMPSSN=query2.getString("SSN");
        System.out.println("Patient SSN: "+ TEMPSSN +", Patient Name: "+ query2.getString("pname"));
        ResultSet query2a = stmt2a. executeQuery(
            "SELECT Visit.SSN, VISIT.VDATE, VISIT.EMP, VDIAGNOSES.DCODE, ENAME, PRICE, IPAID, PPAID, (PRICE-(IPAID+PPAID)) AS BALANCE"+
            " FROM VISIT JOIN VDIAGNOSES ON VISIT.SSN=VDIAGNOSES.SSN AND VISIT.VDATE=VDIAGNOSES.VDATE "+
            " JOIN STAFF ON VISIT.EMP=STAFF.EMP"+
            " JOIN DIAGNOSE ON VDIAGNOSES.DCODE=DIAGNOSE.DCODE" + 
            " WHERE visit.SSN = "+TEMPSSN+
            " AND (visit.vdate>=150401 and visit.vdate<=150630)"
          );
        while(query2a.next()){//Problem 2 Part 2
          System.out.println(
            "\tDate of Visit: "+ query2a.getString("VDATE") +
            ", Staff Member: " + query2a.getString("EMP") +" "+ query2a.getString("ENAME") +
            ", Total Charges: " + query2a.getString("PRICE") +
            ", Insurance Paid: " + query2a.getString("IPAID") +
            ", Patient Paid: " + query2a.getString("PPAID") +
            ", Balance: " + query2a.getString("BALANCE")
            );
        }
        ResultSet query2f =stmt2b.executeQuery(//Problem 2 part 3
          "SELECT COUNT(VISIT.VDATE) AS numberofvisit, VISIT.SSN, SUM(PRICE) AS SUMPRICE, SUM(IPAID) AS SUMIPAID, SUM(PPAID) AS SUMPPAID, SUM(PRICE)-(SUM(PPAID)+SUM(IPAID)) AS TOTALBALANCE" +
          " FROM VISIT JOIN VDIAGNOSES ON VISIT.SSN=VDIAGNOSES.SSN AND VISIT.VDATE=VDIAGNOSES.VDATE " +
          " JOIN DIAGNOSE ON VDIAGNOSES.DCODE=DIAGNOSE.DCODE" +  
          " WHERE VISIT.SSN =" + TEMPSSN + " AND (VISIT.vdate>=150401 and VISIT.vdate<=150630)" +
          " GROUP BY VISIT.SSN"
        );
        while(query2f.next()){
        System.out.println(
          "\tTotal number of Visits: "+query2f.getString("numberofvisit") + 
          ", Total Charges: " + query2f.getString("SUMPRICE") +
          ", Total paid by Insurance: "+query2f.getString("SUMIPAID") +
          ", Total paid by Patients: "+query2f.getString("SUMPPAID") + 
          ", Total Balance: "+query2f.getString("TOTALBALANCE")+"\n"
        );
    	}
      }
      //Note
      System.out.println("\nThe following patients were not active in this period:");
      ResultSet query2ex = stmt2c.executeQuery(
        "SELECT SSN, pname" +
        " FROM Patient" +
        " MINUS" +
        " SELECT VISIT.SSN, PNAME " +
        " FROM Visit join Patient on visit.ssn=Patient.ssn" +
        " where (vdate>=150401 and vdate<=150630)"
      );
      while(query2ex.next()){
        System.out.println(
          "\tPatient SSN: " + query2ex.getString("SSN") +
          ", Patient Name: " + query2ex.getString("pname")
        );
      }
      conn.close();  // Close our connection.
    }
       catch (Exception e) {SQLError(e);} //if any error occurred in the try..catch block, call the SQLError function
  }
}
