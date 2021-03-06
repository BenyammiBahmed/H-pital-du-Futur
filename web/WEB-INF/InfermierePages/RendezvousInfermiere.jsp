<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <link rel="shortcut icon" href="icon/Logo.png" type="image/png">
    <script src="scripteJS/InfiermiereJs/Rendez-vousInfermierePage.js"></script>
    <script src="scripteJS/stomp.js"></script>
    <script src="scripteJS/WebSocket.js"></script>
    <script src="scripteJS/InfiermiereJs/traiterMessqgeInfermiere.js"></script>
    <title>
        Espace infirmiere
    </title>
</head>

<body class="bg-light">

<nav class="navbar cloudy-knoxville-gradient shadow-sm navbar-light bg-light">
    <a class="navbar-brand card-link nav-link font-weight-bolder" href="#">
        <img src="icon/Logo.png" width="30" height="30" alt="" class="sd-inline-block align-top">
        Abismail Hopitel
    </a>

</nav>

<div class="vertical-nav  " id="sidebar">
    <div class="py-4 px-3 mb-4 cloudy-knoxville-gradient">
        <div class="text-center align-items-center"><img src="${sessionScope.user.getPhoto()}" alt="..." width="150"
                                                         class="mr-3 rounded-circle img-thumbnail shadow-sm"><br/>
            <div>
                <h4 class="text-center">Dr.${sessionScope.user.getNom()} ${sessionScope.user.getPrenom()}</h4>
            </div>
        </div>
    </div>
    <div>
        <ul class="nav flex-column  mb-0 list-group " id="list">
            <li class=" font-italic list-group-item list-group-item-action">
                <a href="<c:url value="/InfermiereHomePage"/>" class="text-dark card-link"><span class="fa fa-home mr-3"></span> Home</a>
            </li>
            <li class="active nav-item list-group-item list-group-item-action">
                <a href="#" class="text-dark font-italic card-link"><span
                        class="far fa-calendar-alt mr-3"></span>Rendez-vous</a>
            </li>
            <li class="nav-item list-group-item list-group-item-action">
                <a href="#" class="text-dark font-italic card-link" id="sa"><span
                        class="fas fa-exclamation-triangle mr-3"></span>Signal alarme</a>
            </li>
            <li class="nav-item list-group-item list-group-item-action">
                <a href="<c:url value="/CompteInformation"></c:url>" class="text-dark font-italic card-link"><span class="fas fa-cog mr-3"></span>Vorte
                    compte</a>
            </li>
            <li class="nav-item list-group-item list-group-item-action">
                <a href="/logout" class="text-dark font-italic card-link "><span
                        class="fas fa-sign-out-alt mr-3"></span>logout</a>
            </li>
        </ul>


    </div>
</div>
<div class="page-content" id="content">

    <c:choose>
        <c:when test="${sessionScope.get(\"user\").getService()==null}">
            <p>no service exsite</p>
        </c:when>
        <c:otherwise>
            <p class="h3">Rendez-vous</p>
            <div class="shadow tablewidth my-auto bg-white">
                <div class="row divcontenu">
                    <div class="col">
                        <p class="h5">Ajoute Rendez-Vous</p></div>

                    <div class="col d-flex">
                        <a href="/InfermiereHomePage"> <button class="btn btn-success ml-auto align-self-center" id="getchembreList"
                                style="margin-right: 2rem;"><span class="fas fa-plus mr-3"></span>Ajoute
                        </button></a>
                    </div>
                </div>
            </div>
            <div class="shadow-sm tablewidth my-auto bg-white divcontenu rendez">
                <div class="row ">
                    <div class="col">
                        <p class="h5">select date</p>
                    </div>
                    <div class="col">
                        <input type="date" name="date" class="form-control" id="dateInput">
                    </div>
                </div>
                <div>
                    <p class="h4" >Rendez-vous en <span id="dateRendewVous">${date}</span></p>
                </div>
                <div id="redezvous" class="divcontenu container  tablewidth my-auto bg-white ">
                    <c:choose>
                    <c:when test="${rendezVous.size()==0}">
                        <p class="h5 text-center">no Rendez vous en ${date}</p>
                    </c:when>
                    <c:otherwise>

                        <div class="row  divcontenu ">

                            <div class="col-3 my-auto ">
                                <p class="h5">partient </p>
                            </div>
                            <div class="col-3 my-auto ">
                                <p class="h5">Medcin</p>
                            </div>

                            <div class="col  my-auto ">
                                <p class="h5"> Date</p>
                            </div>
                            <div class="col  my-auto ">
                                <p class="h5"> Temp</p>
                            </div>
                            <div class="col  my-auto ">

                            </div>
                        </div>
                        <div class="w-100 border"></div>
                        <c:forEach var="rendez" items="${rendezVous}">
                        <div class="row my-auto">
                            <div class="col-3 ">
                                <div class="row">
                                    <div class="col my-auto">
                                        <img src="${rendez.patient.photo}" width="50" height="50"
                                             class="rounded-circle  shadow-sm ">
                                    </div>
                                    <div class="col my-auto">
                                        <p class="h6 row">${rendez.patient.nom}</p>
                                        <p class="h6 row">kh${rendez.patient.prenom}</p>
                                        <p class="text-info font-italic row">Id:${rendez.patient.id}</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-3 my-auto ">
                                <div class="row">
                                    <div class="col">
                                        <img src="${rendez.medecin.photo}" width="50" height="50"
                                             class="rounded-circle  shadow-sm ">
                                    </div>
                                    <div class="col">
                                        <p class="h6 row">${rendez.medecin.nom}</p>
                                        <p class="h6 row">${rendez.medecin.prenom}</p>
                                    </div>
                                </div>
                            </div>

                            <div class="col  my-auto ">
                                <p class="h5"> ${rendez.date}</p>
                            </div>
                            <div class="col  my-auto ">
                                <p class="h5"> ${rendez.time}</p>
                            </div>
                            <div class="col  my-auto ">
                                <button class="btn"><span style="color: rgb(104, 229, 238);"><i class="fas fa-pen"></i></span>
                                </button>
                                /
                                <button class="btn" onclick=><span style="color: red;"><i class="far fa-trash-alt"></i></span>
                                </button>
                            </div>
                        </div>
                        <div class="w-100 border"></div>
                        </c:forEach>


                    </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </c:otherwise>
    </c:choose>

</div>


<script type="text/javascript">


</script>
</body>

</html>