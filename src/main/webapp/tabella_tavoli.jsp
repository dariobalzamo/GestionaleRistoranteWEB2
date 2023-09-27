<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 

<!-- SI UTILIZZA UNA JSP PER INTEGRARE SCRIPT IN JAVA: JSTL è una libreria di Tag che mi permettono di utilizzare java su una pagina html -->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista tavoli locale</title>

    <!-- Link al CSS di Bootstrap 5 (assicurati di includere il file CSS corretto) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <a href="homepage.jsp" class="btn btn-primary">Home</a>
        <br><br>
        <h3>Lista tavoli presenti nel locale</h3>
        <table class="table table-bordered mt-4">
            <thead class="table-danger">
                <tr>
                    <th scope="col">Numero tavolo</th>
                    <th scope="col">Coperto</th>
                    <th scope="col">Occupato</th>
                    <th scope="col">Modifica</th>
                    <th scope="col">Elimina</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="t" items="${tavoli}">
                    <tr>
                        <td>${t.id}</td>
                        <td>${t.numeroPosti}</td>
                        <td>
                            <c:choose>
                                <c:when test="${t.occupato == true}">
                                    <span class="badge bg-danger">Occupato</span>
                                </c:when>  
                                <c:otherwise>
                                    <span class="badge bg-success">Libero</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td><a href="RunTavolo?scelta=3&id=${t.id}" class="btn btn-warning">MODIFICA</a></td>
                        <td><a href="RunTavolo?scelta=2&id=${t.id}" class="btn btn-danger">ELIMINA</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

    <!-- Link agli script di Bootstrap (assicurati di includere i file JavaScript corretti) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
