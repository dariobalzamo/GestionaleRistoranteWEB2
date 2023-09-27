<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ValidazioneTavolo</title>

    <!-- Link al CSS di Bootstrap 5 (assicurati di includere il file CSS corretto) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <a href="homepage.jsp" class="btn btn-primary">INDIETRO</a>
        <br><br>
        <form action="RunOrdinazione" method="GET">
            <c:choose>
                <c:when test="${flag == true}">
                    <input type="hidden" name="scelta" value="3">
                </c:when>
                <c:otherwise>
                    <input type="hidden" name="scelta" value="2">
                </c:otherwise>
            </c:choose>	
            <div class="mb-3">
                <label for="IdTavolo" class="form-label">SELEZIONA IL TUO TAVOLO</label>
                <select class="form-select" id="IdTavolo" name="IdTavolo">
                    <option disabled selected>Seleziona il tuo tavolo</option>
                    <c:forEach var="t" items="${tavoli}">
                        <c:if test="${t.occupato == true}">
                            <option value="${t.id}">Tavolo n.${t.id} - posti:${t.numeroPosti}</option>
                        </c:if>
                    </c:forEach>
                </select>
            </div>
            <c:choose>
                <c:when test="${flag == true}">
                    <button type="submit" class="btn btn-success">VAI AL CONTO</button>
                </c:when>
                <c:otherwise>
                    <button type="submit" class="btn btn-success">VAI AL TAVOLO</button>
                </c:otherwise>
            </c:choose>	
        </form>
    </div>

    <!-- Link agli script di Bootstrap (assicurati di includere i file JavaScript corretti) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
