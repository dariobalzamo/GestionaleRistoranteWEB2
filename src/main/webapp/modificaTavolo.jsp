<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Modifica Tavolo</title>

<!-- Link al CSS di Bootstrap 5 (assicurati di includere il file CSS corretto) -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <a href="RunTavolo?scelta=1" class="btn btn-primary">INDIETRO</a>
        <h3 class="mt-4">Modifica Tavolo</h3>
        <form action="RunTavolo" method="post">
            <input type="hidden" name="scelta" value="2">
            <input type="hidden" name="id" value="${tavolo.id}">
            <div class="mb-3">
                <label for="numeroPosti" class="form-label">Numero coperto</label>
                <input type="text" class="form-control" id="numeroPosti" name="numeroPosti" value="${tavolo.numeroPosti}">
            </div>
            <br>
            <br>
            <!-- ESEMPIO DI IF-THEN-ELSE CON C:if-->
            <c:if test="${tavolo.occupato == true}">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="occupazione" id="occupato" value="true" checked>
                    <label class="form-check-label" for="occupato">Occupato</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="occupazione" id="nonOccupato" value="false">
                    <label class="form-check-label" for="nonOccupato">Non occupato</label>
                </div>
            </c:if>
            <c:if test="${tavolo.occupato == false}">
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="occupazione" id="occupato" value="true">
                    <label class="form-check-label" for="occupato">Occupato</label>
                </div>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="occupazione" id="nonOccupato" value="false" checked>
                    <label class="form-check-label" for="nonOccupato">Non occupato</label>
                </div>
            </c:if>
            <br>
            <button type="submit" class="btn btn-success">Applica modifiche</button>
            <button type="reset" class="btn btn-secondary">Reset</button>
        </form>
    </div>

    <!-- Link agli script di Bootstrap (assicurati di includere i file JavaScript corretti) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
