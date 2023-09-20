<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modifica Tavolo</title>
</head>
<body>
	<a href="RunTavolo?scelta=1"><button>INDIETRO</button></a>
	<form action="RunTavolo" method="post">
		<input type="hidden" name="scelta" value="2" >
		
		<input type="hidden" name="id" value="${tavolo.id}">
        <label>Numero coperto</label>
        <input type="text" name="numeroPosti" value="${tavolo.numeroPosti}">
        <br>
        <br>
        <label>Occupato</label>
        <input type="text" name="occupato" value="${tavolo.occupato}">
        <br>
        <button type="submit">Applica modifiche</button>
        <button type="reset">Reset</button>
    </form>
</body>
</html>