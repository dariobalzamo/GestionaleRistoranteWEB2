<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ordinazione</title>

    <!-- Link al CSS di Bootstrap 5 (assicurati di includere il file CSS corretto) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h5>${risposta}</h5>
        <h3>MENU PIATTI</h3>
        <form action="RunOrdinazione" method="post">
            <input type="hidden" name="scelta" value="1">
            <input type="hidden" name="idPrenotazione" value="${idPrenotazione}">
            
            <table class="table table-bordered mt-4">
                <thead class="table-danger">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">PIATTO</th>
                        <th scope="col">PREZZO</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="p" items="${piatti}">
                        <tr>
                            <td>${p.id}</td>
                            <td>${p.nome}</td>
                            <td>${p.prezzo}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br><br>
            <div class="mb-3">
                <label for="idPiatto" class="form-label">ORDINAZIONE PIATTO</label>
                <input type="text" class="form-control" id="idPiatto" name="id_piatto" placeholder="Ordina un piatto">
            </div>
            <button type="submit" class="btn btn-success">ORDINA</button>
        </form>
    </div>

    <!-- Link agli script di Bootstrap (assicurati di includere i file JavaScript corretti) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
