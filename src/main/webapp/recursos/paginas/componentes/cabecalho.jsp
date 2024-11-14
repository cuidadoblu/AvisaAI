<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<head>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        *, *::before, *::after {
            box-sizing: border-box;
        }

        .cabecalho-avisaai {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 10px 20px;
            background-color: #34495E;
            position: sticky;
            width: 100%;
            height: fit-content;
            top: 0;
            z-index: 3;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
        }

        .icone-menu-avisaai {
            font-size: 24px;
            cursor: pointer;
            color: #ffffff;
            transition: transform 0.3s;
        }

        .icone-menu-avisaai:hover {
            transform: scale(1.1);
        }

        .logo-avisaai {
            margin-left: 10px;
            display: flex;
            align-items: center;
            transition: transform 0.3s;
            width: min-content;
            height: 30px;
        }

        .logo-avisaai-img {
            justify-items: center;
            width: auto;
            height: 75%;
        }

        .logo-avisaai:hover {
            transform: scale(1.1);
        }

        .barra-consulta-container {
            display: flex;
            justify-content: center;
            flex: 1;
            width: 100%;

        }

        .barra-consulta-avisaai {
            position: relative;
            display: flex;
            align-items: center;
            background-color: #FFFFFF;
            border-radius: 50px;
            padding: 5px 10px;
            margin: 0;
            width: 30%;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s;
        }

        .barra-consulta-avisaai:hover {
            transform: scale(1.01);
        }

        .input-pesquisa {
            border: none;
            background: none;
            outline: none;
            width: 100%;
            font-size: 16px;
            color: #2C3E50;
        }

        .consulta-expandida-avisaai {
            display: none;
            position: absolute;
            top: calc(100% + 8px);
            left: 0;
            width: 100%;
            background-color: #34495E;
            color: #ffffff;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            z-index: 3;
        }

        .consulta-expandida-avisaai h4 {
            font-size: 14px;
            color: #BDC3C7;
            margin-top: 10px;
        }

        .item-consulta-avisaai {
            padding: 8px;
            border-radius: 4px;
            transition: background-color 0.3s ease;
            cursor: pointer;
        }

        .item-consulta-avisaai:hover {
            background-color: #4E6A88;
        }

        .icones-avisaai {
            display: flex;
            align-items: center;
            margin-left: auto;
        }

        .icones-avisaai a img {
            width: auto;
            margin-left: 10px;
            transition: transform 0.3s;
        }

        .icones-avisaai a img:hover {
            transform: scale(1.1);
        }

        .barra-lateral-avisaai {
            position: fixed;
            top: 50px;
            left: -250px;
            width: 250px;
            height: 100%;
            background-color: #2C3E50;
            color: #ffffff;
            overflow: auto;
            transition: left 0.3s ease;
            z-index: 2;
        }

        .barra-lateral-avisaai.aberta {
            left: 0;
        }

        .menu-avisaai {
            padding: 20px;
        }

        .menu-avisaai h2, .menu-avisaai h3 {
            margin-bottom: 10px;
            font-size: 16px;
            color: #BDC3C7;
        }

        .menu-avisaai a {
            display: block;
            color: #ffffff;
            padding: 10px;
            text-decoration: none;
            transition: background-color 0.3s, color 0.3s;
        }

        .menu-avisaai a:hover {
            background-color: #34495E;
            color: #3498DB;
        }

        .menu-avisaai img {
            width: 20px;
            margin-right: 10px;
            vertical-align: middle;
        }

        .perfil-avisaai {
            padding: 20px;
            text-align: center;
        }

        .perfil-avisaai img {
            width: 50px;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .sair-botao {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #fff;
            color: #000;
            border: none;
            cursor: pointer;
            text-align: center;
            transition: background 0.3s ease;
        }

        .sair-botao:hover {
            background-color: #3498DB;
        }

        .fundo-transparente-avisaai {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1;
        }

        .fundo-transparente-avisaai.ativo {
            display: block;
        }
    </style>
  
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/recursos/imagens/logos/png/logo azul.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/componentes/cabecalho.css">
</head>
<div class="fundo-transparente-avisaai" id="fundoTransparente" onclick="fecharMenu()"></div>

<header class="cabecalho-avisaai">
    <i class="fas fa-bars icone-menu-avisaai" onclick="alternarMenu()"></i>
    <div class="logo-avisaai">
        <a class="logo-avisaai" href="feed-pessoal">
            <img class="logo-avisaai-img" src="${pageContext.request.contextPath}/recursos/imagens/logos/png/logo%20branco.png" alt="Logo">
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
        <a href="perfil-usuario-logado">
            <img src="icons/perfil.png" alt="Perfil">
        </a>
    </div>
</header>

<div class="barra-lateral-avisaai" id="barraLateral">
    <div class="menu-avisaai">
        <h2>Menu</h2>
        <a href="cadastro-incidente"><i class="fas fa-exclamation-triangle"></i> Cadastrar Incidente</a>
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
</html>