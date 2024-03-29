<%-- Created by Shanice Talan October 15, 2019 PROJ207 OOSD Spring 2019
Travel Website where customers can register, login, book packages, update and delete their account,
and where agents can login, add, update and delete bookings and packages, and update customers--%>

<%@ include file="head.jsp"%>
<title>Travel Experts - Agent Login</title>
</head>
<body>
<%@ include file="nav.jsp"%>

<%-- if already logged in, continue to welcome page --%>
<% if(session.getAttribute("agentId")!=null){
	response.sendRedirect("agentwelcome.jsp");
}else{
%>
	<div class="contain">
	    <div id="login">
			<form onSubmit="return checkLogin()" action="AgentLogin" method="post">
				<p>Agent Login</p>
				<% if(request.getParameter("login")=="invalid"){
				out.println("<p id='error'>Invalid UserID or Password!"); } %>
				<p id="loginError" style="font-size: 18px; visibility: hidden; color: red">Invalid UserID or Password!</p>
				<table>
					<tr><td>UserID:</td>
						<td><input type="text" name="agtUserId" id="uid"/></td>
					</tr>
					<tr><td>Password:</td>
						<td><input type="password" name="agtUserPwd" id="pwd"/></td>
					</tr>
				</table>
				<button>Login</button>
			</form>
<% } %> <%--else--%>
		</div>
	</div>
</body>
</html>