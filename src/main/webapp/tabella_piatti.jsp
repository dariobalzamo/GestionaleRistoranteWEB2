<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MENU</title>

    <!-- Link al CSS di Bootstrap 5 (assicurati di includere il file CSS corretto) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <a href="homepage.jsp" class="btn btn-primary">Torna alla home</a>
        <br><br>
        <h3>MENU PIATTI</h3>
        <table class="table table-bordered mt-4">
            <thead class="table-danger">
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">PIATTO</th>
                    <th scope="col">PREZZO</th>
                    <th scope="col">MODIFICA</th>
                    <th scope="col">ELIMINA</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${piatti}">
                    <tr>
                        <td>${p.id}</td>
                        <td>${p.nome}</td>
                        <td>${p.prezzo} euro</td>
                        <td><a href="RunPiatto?scelta=3&id=${p.id}" class="btn btn-warning">MODIFICA</a></td>
                        <td><a href="RunPiatto?scelta=2&id=${p.id}" class="btn btn-danger">ELIMINA</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Link agli script di Bootstrap (assicurati di includere i file JavaScript corretti) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
