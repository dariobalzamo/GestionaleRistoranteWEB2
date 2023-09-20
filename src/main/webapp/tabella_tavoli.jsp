<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!-- SI UTILIZZA UNA JSP PER INTEGRARE SCRIPT IN JAVA: JSTL è una libreria di Tag che mi permettono di utilizzare java su una pagina html -->

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Lista tavoli locale</title>
</head>
<body>
	<a href="homepage.jsp"><button>Torna alla home</button></a>
	<br><br>
	<h3>Lista tavoli presenti nel locale</h3>
	<table style="margin-top: 2%; border: 1px solid">
		<tr style="color: red">
			<th scope="col" style="border: 1px solid">Numero tavolo</th>
			<th scope="col" style="border: 1px solid">Coperto</th>
			<th scope="col" style="border: 1px solid">Occupato</th>
			<th scope="col" style="border: 1px solid">Modifica</th>
			<th scope="col" style="border: 1px solid">Elimina</th>
		</tr>
		<c:forEach var="t" items="${tavoli}">
			<tr>
				<td style="border: 1px solid">${t.id}</td>
				<td style="border: 1px solid">${t.numeroPosti}</td>
				<td style="border: 1px solid">${t.occupato}</td>
				<td><a href="RunTavolo?scelta=3&id=${t.id}"><button>MODIFICA</button></a></td>
				<td><a href="RunTavolo?scelta=2&id=${t.id}"><button>ELIMINA</button></a></td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>