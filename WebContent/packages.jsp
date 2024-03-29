<%-- Created by Shanice Talan October 15, 2019 PROJ207 OOSD Spring 2019
Travel Website where customers can register, login, book packages, update and delete their account,
and where agents can login, add, update and delete bookings and packages, and update customers--%>

<%-- As agent, show list of all packages --%>
<%@ include file="head.jsp"%>
<title>Travel Experts Agents- Packages</title>
</head>
<body>
<%@ include file="nav.jsp"%>
	<div class="contain">
		<div id="agttables">
			</br>
			<h1>Packages</h1>
			</br>
			
<%--check if logged in --%>
<%  if(session.getAttribute("agentId")==null){
out.print("<h1>Please login</h1>");
response.sendRedirect("agentlogin.jsp");
}else{	 
		try{
		    Class.forName("org.mariadb.jdbc.Driver");
		    Connection con = (Connection) DriverManager.getConnection("jdbc:mariadb://localhost:3306/travelexperts","root","");
		    Statement st = con.createStatement();
	  		ResultSet rs = st.executeQuery("select * from Packages;");
	%>
	<a href="addpackage.jsp"><button>Add New Package</button></a>
	<a href="agentwelcome.jsp"><button>Home</button></a>

	<table>
      <thead>
          <tr>
             <th>Package ID</th>
             <th>Package Name</th>
             <th>Description</th>
             <th>Start Date</th>
             <th>End Date</th>
             <th>Base Price</th>
             <th>Commission</th>
          </tr>
      </thead>
      <tbody>
        <% while(rs.next()){ %>
            <tr>
                <td><%=rs.getInt("PackageId") %></td>
                <td><%=rs.getString("PkgName") %></td>
                <td><%=rs.getString("PkgDesc") %></td>
                <td><%=rs.getDate("PkgStartDate") %></td>
                <td><%=rs.getDate("PkgEndDate") %></td>
                <td><%=rs.getDouble("PkgBasePrice") %></td>
                <td><%=rs.getDouble("PkgAgencyCommission") %></td>
                <td><button id="<%=rs.getInt("PackageId") %>" onClick="modifyPackage(this.id)">Modify</button>
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
}
%>
		</div>
	</div>
</body>
</html>