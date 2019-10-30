<%-- Created by Shanice Talan October 15, 2019 PROJ207 OOSD Spring 2019
Travel Website where customers can register, login, book packages, update and delete their account,
and where agents can login, add, update and delete bookings and packages, and update customers--%>

<%-- Customer main page --%>

<%@ include file="head.jsp"%>
<title>Travel Experts - Welcome</title>
</head>
<body>
<%@ include file="nav.jsp"%>
<% if(session.getAttribute("customerId")==null){
out.print("<h1>Please login</h1>");
response.sendRedirect("customerlogin.jsp");
}else{
%>
	<div class="contain">
		<div id="entry">
			<h1>Welcome, <%=session.getAttribute("custFirstName") %>!</h1>
			<a href="customerbookings.jsp"><button>Your Bookings</button></a>
			<a href="customerinfo.jsp"><button>Your Account</button></a>
			<a href="accountdeleted.jsp"><button onclick="deleteAccount(<%=session.getAttribute("customerId")%>)">Delete Your Account</button></a>
			</br>
			<a href="logout.jsp"><button>Logout</button></a>
<% } %> <%--else--%>
		</div>
	</div>
</body>
</html>