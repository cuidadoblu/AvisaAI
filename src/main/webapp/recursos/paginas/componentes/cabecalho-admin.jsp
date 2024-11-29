<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AvisaAí</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/recursos/imagens/logos/png/icone%20guarda-chuva.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/geral.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/componentes/cabecalho.css">  
</head>
<body>
<div class="fundo-transparente-avisaai" id="fundoTransparente" onclick="fecharMenu()"></div>

<header class="cabecalho-avisaai">
    <i class="fas fa-bars icone-menu-avisaai" onclick="alternarMenu()"></i>
    <div class="logo-avisaai">
        <a href="feed-pessoal">
            <img src="icons/logo.png" alt="Logo">
        </a>
    </div>
    <div class="barra-consulta-container">
        <div class="barra-consulta-avisaai">
            <i class="fas fa-search"></i>
            <input type="text" class="input-pesquisa" placeholder="Consultar"
                   onkeyup="mostrarConsultaExpandida(this.value)">
            <div class="consulta-expandida-avisaai" id="consultaExpandida">
                <h4>Comunidades</h4>
                <c:forEach var="comunidade" items="${comunidades}">
                    <div class="item-consulta-avisaai" onclick="redirecionar('perfil-comunidade?id=${comunidade.id}')">
                            ${comunidade.nome}
                    </div>
                </c:forEach>
                <h4>Usuários</h4>
                <c:forEach var="usuario" items="${usuarios}">
                    <div class="item-consulta-avisaai" onclick="redirecionar('perfil-usuario?id=${usuario.id}')">
                            ${usuario.nome} ${usuario.sobrenome}
                    </div>
                </c:forEach>
                <h4>Incidentes</h4>
                <c:forEach var="incidente" items="${incidentes}">
                    <div class="item-consulta-avisaai" onclick="redirecionar('perfil-incidente?id=${incidente.id}')">
                            ${incidente.titulo}
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div class="icones-avisaai">
        <a href="perfil-usuario-logado">
            <img src="icons/perfil.png" alt="Perfil">
        </a>
    </div>
</header>

<div class="barra-lateral-avisaai" id="barraLateral">
    <div class="menu-avisaai">
        <h2>Menu</h2>
        <a href="cadastro-incidente"><i class="fas fa-exclamation-triangle"></i> Cadastrar Incidente</a>
        <a href="cadastro-comunidade"><i class="fas fa-exclamation-triangle"></i> Cadastrar Comunidade</a>
        <a href="cadastro-localidade"><i class="fas fa-exclamation-triangle"></i> Cadastrar Localidade</a>
        <a href="feed-pessoal"><i class="fas fa-newspaper"></i> Feed</a>
        <h3>Comunidades</h3>
        <a href="perfil-comunidade?id=1"><img src="images/centro.jpg" alt="Centro"> Centro</a>
        <a href="perfil-comunidade?id=2"><img src="images/vila_nova.jpg" alt="Vila Nova"> Vila Nova</a>
    </div>
    <div class="perfil-avisaai">
        <img src="icons/perfil.png" alt="Perfil">

        <span>Usuário Logado</span>
        <button class="sair-botao" onclick="redirecionar('deslogar')"><i class="fas fa-sign-out-alt"></i> Sair da Conta
        </button>
    </div>
</div>

<script>
    function alternarMenu() {
        var barraLateral = document.getElementById("barraLateral");
        var fundoTransparente = document.getElementById("fundoTransparente");

        if (barraLateral.classList.contains("aberta")) {
            barraLateral.classList.remove("aberta");
            fundoTransparente.classList.remove("ativo");
        } else {
            barraLateral.classList.add("aberta");
            fundoTransparente.classList.add("ativo");
        }
    }

    function fecharMenu() {
        var barraLateral = document.getElementById("barraLateral");
        var fundoTransparente = document.getElementById("fundoTransparente");

        barraLateral.classList.remove("aberta");
        fundoTransparente.classList.remove("ativo");
    }

    function mostrarConsultaExpandida(valor) {
        var consultaExpandida = document.getElementById("consultaExpandida");
        consultaExpandida.style.display = valor.length > 0 ? "block" : "none";
    }

    function redirecionar(url) {
        window.location.href = url;
    }
</script>
</body>
</html>