<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Paga Conto</title>

    <!-- Link al CSS di Bootstrap 5 (assicurati di includere il file CSS corretto) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <a href="homepage.jsp" class="btn btn-primary">Torna alla home</a>
        <br><br>
        <h3 class="mt-4">SCONTRINO</h3>
        <p class="lead">Numero Ordine: ${conto.numero_prenotazione} - Numero Tavolo: ${conto.numero_tavolo}</p>

        <table class="table table-bordered mt-4">
            <thead class="table-danger">
                <tr>
                    <th scope="col">Piatti</th>
                    <th scope="col">Quantità</th>
                    <th scope="col">Prezzo</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="i" begin="0" end="${conto.piatti.size()-1}">
                    <tr>
                        <td>${conto.piatti[i]}</td>
                        <td>${conto.quantita[i]}</td>
                        <td>${conto.prezzi[i]} euro</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <p class="lead">Totale: ${conto.totale} euro</p>

        <form action="RunOrdinazione" method="post">
            <input type="hidden" name="scelta" value="3">
            <input type="hidden" name="idPrenotazione" value="${conto.numero_prenotazione}">
            <input type="hidden" name="idTavolo" value="${conto.numero_tavolo}">
            <button type="submit" class="btn btn-success">PAGA</button>
        </form>
    </div>

    <!-- Link agli script di Bootstrap (assicurati di includere i file JavaScript corretti) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
