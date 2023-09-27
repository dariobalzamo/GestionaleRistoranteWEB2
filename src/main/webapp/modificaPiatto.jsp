<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modifica Piatto</title>

    <!-- Link al CSS di Bootstrap 5 (assicurati di includere il file CSS corretto) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <a href="RunPiatto?scelta=1" class="btn btn-primary">INDIETRO</a>
        <h3 class="mt-4">Modifica Piatto</h3>
        <form action="RunPiatto" method="post">
            <input type="hidden" name="scelta" value="2">
            <input type="hidden" name="id" value="${piatto.id}">
            <div class="mb-3">
                <label for="nomePiatto" class="form-label">Piatto</label>
                <input type="text" class="form-control" id="nomePiatto" name="piatto" value="${piatto.nome}">
            </div>
            <div class="mb-3">
                <label for="prezzoPiatto" class="form-label">Prezzo</label>
                <input type="text" class="form-control" id="prezzoPiatto" name="prezzo" value="${piatto.prezzo}">
            </div>
            <button type="submit" class="btn btn-success">Applica modifiche</button>
            <button type="reset" class="btn btn-secondary">Reset</button>
        </form>
    </div>

    <!-- Link agli script di Bootstrap (assicurati di includere i file JavaScript corretti) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
