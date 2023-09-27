<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Homepage ristorante</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="CSS/styles.css" rel="stylesheet" />
    </head>
    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <a class="navbar-brand" href="index.html">IMPERIAL Yu Shi</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="#index.html">Home</a></li>
                            <ul class="navbar-nav">
	            
                                <!-- Dropdown "CLIENTE" -->
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Cliente
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="RunPrenotazione?scelta=1">Tavolo</a>
                                        <a class="dropdown-item" href="RunOrdinazione?scelta=1">Ordinazione</a>
                                        <form class="form-inline ml-auto" action="RunOrdinazione" method="post">
                                            <input type="hidden" name="scelta" value="2">
                                            <a class="dropdown-item"><button class="btn btn-outline-warning" type="submit">Paga</button></a>
                                        </form>
                                    </div>
                                </li>
                                
                                <!-- Dropdown "Ristoratore" -->
                                <li class="nav-item dropdown">
                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                        data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Ristoratore
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="form_tavolo.jsp">Aggiungi tavolo</a>
                                        <a class="dropdown-item" href="RunTavolo?scelta=1">Visualizza tavoli</a>
                                        <a class="dropdown-item" href="form_piatto.jsp">Aggiungi piatto</a>
                                        <a class="dropdown-item" href="RunPiatto?scelta=1">Gestione menu</a>
                                    </div>
                                </li>
                            </ul>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Header-->
            <header class="bg-dark py-5">
                <div class="container px-5">
                    <div class="row gx-5 align-items-center justify-content-center">
                        <div class="col-lg-8 col-xl-7 col-xxl-6">
                            <div class="my-5 text-center text-xl-start">
                                <h1 class="display-5 fw-bolder text-white mb-2">All You Can Eat di qualita'</h1>
                                <p class="lead fw-normal text-white-50 mb-4">
                                    Il luogo dove la passione per il cibo si unisce all'arte della gastronomia. 
                                    <br>Situato nel cuore di Napoli.
                                    <br>siamo un'oasi culinaria che offre un'esperienza unica per il palato e i sensi. <br>
                                </p>
                                <div class="d-grid gap-3 d-sm-flex justify-content-sm-center justify-content-xl-start">
                                    <a class="btn btn-primary btn-lg px-4 me-sm-3" href="#features">Prezzi</a>
                                    <a class="btn btn-outline-light btn-lg px-4" href="#!">Login</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-xxl-6 d-none d-xl-block text-center"><img class="img-fluid rounded-3 my-5" src="assets/Piatto4.jpg" alt="..." /></div>
                    </div>
                </div>
            </header>
            <!-- Features section-->
            <section class="py-5" id="features">
                <div class="container px-5 my-5">
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">Sconto 20% su minimo d'ordine di 20.00 euro</h2></div>
                        <div class="col-lg-8">
                            <div class="row gx-5 row-cols-1 row-cols-md-2">
                                <div class="col mb-5 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-collection"></i></div>
                                    <h2 class="h5">Offerta a pranzo</h2>
                                    <p class="mb-0">Da lunedi a venerdi euro 13.00 <br>
                                            Sabato, domenica e festivi euro 15.00</p>
                                </div>
                                <div class="col mb-5 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-building"></i></div>
                                    <h2 class="h5">Offerta a cena</h2>
                                    <p class="mb-0">Dal lunedi alla domenica compresi euro 22.80</p>
                                </div>
                                <div class="col mb-5 mb-md-0 h-100">
                                    <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-toggles2"></i></div>
                                    <h2 class="h5">Offerta Bimbi under 120cm</h2>
                                    <p class="mb-0">Pranzo euro 9.00 <br>
                                        Cena euro 12.00</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Blog preview section-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder"></h2>
                                <p class="lead fw-normal text-muted mb-5">Recensioni dei nostri clienti</p>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">400 likes</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">INDIMENTICABILE</h5></a>
                                    <p class="card-text mb-0">Una serata indimenticabile! Il cibo era delizioso, il servizio impeccabile e l'atmosfera accogliente. Tornerò sicuramente!</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="assets/Simone.jpg" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Simone Loffredo</div>
                                                <div class="text-muted">March 12, 2023 &middot; 6 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">139 Likes</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">Accettabile</h5></a>
                                    <p class="card-text mb-0">La cucina al [Nome del tuo Ristorante] è davvero eccezionale, con piatti che esplodono di gusto. Tuttavia, ho notato che la pulizia del locale potrebbe essere migliorata. Spero che possano prestare maggiore attenzione a questo aspetto per una esperienza ancora più completa.</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="assets/Sconosciuto.jpg" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Josiah Barclay</div>
                                                <div class="text-muted">March 23, 2023 &middot; 4 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 mb-5">
                            <div class="card h-100 shadow border-0">
                                <div class="card-body p-4">
                                    <div class="badge bg-primary bg-gradient rounded-pill mb-2">289 Likes</div>
                                    <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">Cucina TOP !!</h5></a>
                                    <p class="card-text mb-0">Sono rimasto impressionato dalla cucina raffinata e dalla gentilezza del personale all'Imperial Yu shi. Un'esperienza culinaria straordinaria!</p>
                                </div>
                                <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
                                    <div class="d-flex align-items-end justify-content-between">
                                        <div class="d-flex align-items-center">
                                            <img class="rounded-circle me-3" src="assets/Adriano.jpg" alt="..." />
                                            <div class="small">
                                                <div class="fw-bold">Adriano Asprone</div>
                                                <div class="text-muted">April 2, 2023 &middot; 10 min read</div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- Footer-->
        <footer class="bg-dark py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; IMPERIAL Yu Shi 2023</div></div>
                    <div class="col-auto">
                        <a class="link-light small" href="#!">Privacy</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Terms</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Contact</a>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>