<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prenotazione</title>

    <!-- Link al CSS di Bootstrap 5 (assicurati di includere il file CSS corretto) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <a href="homepage.jsp" class="btn btn-primary">INDIETRO</a>
        <br>
        <br>
        <form action="RunPrenotazione" method="post">
            <input type="hidden" name="scelta" value="1">
            <div class="mb-3">
                <label for="numeroPersone" class="form-label">Numero di persone da prenotare</label>
                <select class="form-select" id="IdTavolo" name="IdTavolo">
                    <option disabled selected>Seleziona il tavolo</option>
                    <c:forEach var="t" items="${tavoli}">
                        <c:if test="${t.occupato == false}">
                            <option value="${t.id}">Tavolo n.${t.id} - posti:${t.numeroPosti}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-success">Prenota</button>
            <button type="reset" class="btn btn-secondary">Reset</button>
        </form>
    </div>

    <!-- Link agli script di Bootstrap (assicurati di includere i file JavaScript corretti) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
