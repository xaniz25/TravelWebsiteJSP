<%@ include file="head.jsp" %>
<title>Travel Experts Agents - Bookings</title>
</head>
<body>
<%@ include file="nav.jsp"%>
	<div class="contain">
		<div id="agttables">
			</br>
			<h3>Bookings</h3>
			</br>
<% /* if(session.getAttribute("agentId")==null){
out.print("<h1>Please login</h1>");
response.sendRedirect("agentlogin.jsp");
}else{ */
	
	try{
	    Class.forName("org.mariadb.jdbc.Driver");
	    Connection con = (Connection) DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts","root","");
	    Statement st = con.createStatement();
	    ResultSet rs = st.executeQuery("select * from Bookings;");
%>
	<a href="addbooking.jsp"><button>Add New Booking</button></a></br>
	<table>
      <thead>
          <tr>
             <th>Booking ID</th>
             <th>Booking Date</th>
             <th>Customer ID</th>
             <th>Traveler Count</th>
             <th>Trip Type</th>
             <th>Package Id</th>
          </tr>
      </thead>
      <tbody>
        <% while(rs.next()){ %>
            <tr>
                <td><%=rs.getInt("BookingId") %></td>
                <td><%=rs.getDate("BookingDate") %></td>
                <td><%=rs.getInt("CustomerId") %></td>
                <td><%=rs.getInt("TravelerCount") %></td>
                <td><%=rs.getString("TripType") %></td>
                <td><%=rs.getInt("PackageId") %></td>
                <td><button id="<%=rs.getInt("BookingId") %>" onClick="modifyBooking(this.id)">Modify</button>
            </tr>
         <%}%>
           </tbody>
        </table><br>
    <%
    st.close();
    con.close();
    }
    catch(Exception e){
        out.print(e.getMessage());%><br><%
    }

%>
		</div>
	</div>
</body>
</html>