<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="shortcut icon"
          href="${pageContext.request.contextPath}/recursos/imagens/logos/png/icone%20guarda-chuva.png"
          type="image/x-icon">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/recursos/css/componentes/cabecalho.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/geral.css">
</head>
<div class="fundo-transparente-avisaai" id="fundoTransparente" onclick="fecharMenu()"></div>

<header class="cabecalho-avisaai">
    <i class="fas fa-bars icone-menu-avisaai" onclick="alternarMenu()"></i>
    <div class="logo-avisaai">
        <a class="logo-avisaai" href="feed-pessoal">
            <img class="logo-avisaai-img"
                 src="${pageContext.request.contextPath}/recursos/imagens/logos/png/logo%20branco.png" alt="Logo">
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
        <a href="notificacoes">
            <img src="icons/notificacoes.png" alt="Notificações">
        </a>
        <a href="perfil-usuario-logado" class="logo-avisaai">
            <img class="perfil-usuario-img" src="exibir-foto?id-foto=${usuarioLogado.fotoPerfil.id}"
                 alt="Foto de ${usuarioLogado.nome}">
        </a>
    </div>
</header>

<div class="barra-lateral-avisaai" id="barraLateral">
    <div class="menu-avisaai">
        <h2>Menu</h2>
        <a href="cadastro-incidente"><i class="fas fa-exclamation-triangle"></i>
            Cadastrar Incidente
        </a>
        <a href="feed-pessoal">
            <i class="fas fa-newspaper"></i> Feed
        </a>
        <h3>Comunidades</h3>
        <a href="perfil-comunidade?id=1">
            <img src="${pageContext.request.contextPath}/recursos/imagens/comunidades/png/Centro.jpg" alt="Centro">
            Centro
        </a>
        <a href="perfil-comunidade?id=2">
            <img src="${pageContext.request.contextPath}/recursos/imagens/comunidades/png/Vila%20Nova.png"
                 alt="Vila Nova">
            Vila Nova
        </a>
    </div>
    <div class="perfil-avisaai">
        <a href="perfil-usuario-logado" class="logo-avisaai">
            <img class="perfil-usuario-img" src="exibir-foto?id-foto=${usuarioLogado.fotoPerfil.id}"
                 alt="Foto de ${usuarioLogado.nome}">
            <span>${usuarioLogado.nome} ${usuarioLogado.sobrenome}<</span>
        </a>
        <button class="sair-botao" onclick="redirecionar('deslogar')">
            <i class="fas fa-sign-out-alt"></i> Sair da Conta
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
</html>