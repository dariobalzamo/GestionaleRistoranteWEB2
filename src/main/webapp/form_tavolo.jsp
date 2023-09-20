<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inserimento Tavolo</title>
</head>
<body>
	<a href="homepage.jsp"><button>INDIETRO</button></a>
	<form action="RunTavolo" method="post">
		<input type="hidden" name="scelta" value="1" >
        <label>Numero coperto</label>
        <input type="text" name="numeroPosti" placeholder="max disponibilità tavolo">
        <br>
        <br>
        <label>Occupato</label>
        <input type="text" name="occupato" placeholder="">
        <br>
        <button type="submit">Aggiungi tavolo</button>
        <button type="reset">Reset</button>
    </form>
</body>
</html>