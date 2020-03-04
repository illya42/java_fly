
<%@ include file="header.jsp" %>
<%
uneSession.invalidate();
response.sendRedirect("index.jsp");
%>