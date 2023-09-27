<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inserimento Piatto</title>

    <!-- Link al CSS di Bootstrap 5 (assicurati di includere il file CSS corretto) -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <a href="homepage.jsp" class="btn btn-primary">INDIETRO</a>
        <h3 class="mt-4">Inserimento Piatto</h3>
        <form action="RunPiatto" method="post">
            <input type="hidden" name="scelta" value="1">
            <div class="mb-3">
                <label for="nomePiatto" class="form-label">Nome piatto</label>
                <input type="text" class="form-control" id="nomePiatto" name="nome" placeholder="Nome piatto">
            </div>
            <div class="mb-3">
                <label for="prezzoPiatto" class="form-label">Prezzo</label>
                <input type="text" class="form-control" id="prezzoPiatto" name="prezzo" placeholder="Prezzo in decimale">
            </div>
            <button type="submit" class="btn btn-success">Aggiungi piatto</button>
            <button type="reset" class="btn btn-secondary">Reset</button>
        </form>
    </div>

    <!-- Link agli script di Bootstrap (assicurati di includere i file JavaScript corretti) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
    