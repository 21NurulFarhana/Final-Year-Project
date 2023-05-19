<%-- 
    Document   : custDeleteP
    Created on : 8 May 2023, 2:36:36 am
    Author     : user
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="org.json.JSONObject,java.util.*"%>

<%
    int result;
    if(request.getParameter("delete")!=null) //get "delete" variable from index.jsp file in ajax part this line "data:"delete="+fruitID,".
    {
        String getID=request.getParameter("delete"); //getable "delete" variable store in created new "getID" variable
        
        String dburl="jdbc:mysql://localhost:3306/mlm"; //database url string the "sweetalert_db" is database name
        String dbusername="root"; //database username   
        String dbpassword=""; //database password
        
        try
        {
        
            Class.forName("com.mysql.jdbc.Driver"); //load driver
            Connection con=DriverManager.getConnection(dburl,dbusername,dbpassword); //create connection
            
            PreparedStatement pstmt=null; //create statement
            
            pstmt=con.prepareStatement("DELETE FROM customer WHERE custID=?"); //sql delete query
            pstmt.setString(1,getID); //set "getID" variable 
            
            result=pstmt.executeUpdate(); //execute query and store in create new variable "i";
            
            JSONObject obj=new JSONObject();   //create globally JSONObject and name is "obj"
           
            if(result >0){   //check if condition variable "i" not equal to zero after continue
                
                obj.put("status", "success");
                obj.put("message", " Makanan Berjaya Dipadam!");    //create json object "status","message" and apply custome messages for "delete data"
            }
            else{
               
                obj.put("status", "error");
                obj.put("message", "Makanan Tidak Dapat Dipadam...");   //create json object "status","message" and apply custome messages for "unable to delete data"
            }
                
            out.print(obj); //finally print the "obj" object
            
            con.close(); //close the connection
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
    }
%>
