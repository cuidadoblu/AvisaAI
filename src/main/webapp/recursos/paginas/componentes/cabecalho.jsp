<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AvisaAí - Interface</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        * {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .cabecalho-avisaai {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #2c3e50;
            padding: 10px 20px;
            color: #ffffff;
        }

        .cabecalho-avisaai .icone-menu-avisaai {
            font-size: 24px;
            cursor: pointer;
        }

        .cabecalho-avisaai .logo-avisaai {
            display: flex;
            align-items: center;
            font-size: 24px;
        }

        .cabecalho-avisaai .barra-consulta-avisaai {
            flex-grow: 1;
            margin: 0 20px;
            position: relative;
        }

        .barra-consulta-avisaai input {
            width: 100%;
            padding: 8px;
            border-radius: 20px;
            border: none;
            outline: none;
            padding-left: 30px;
        }

        .barra-consulta-avisaai i {
            position: absolute;
            left: 10px;
            top: 50%;
            transform: translateY(-50%);
            color: #aaa;
        }

        .cabecalho-avisaai .icones-avisaai {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .icones-avisaai img {
            width: 24px;
            cursor: pointer;
        }

        .consulta-expandida-avisaai {
            position: absolute;
            top: 100%;
            left: 0;
            width: 100%;
            background-color: #f5f5f5;
            border-radius: 10px;
            padding: 10px;
            margin-top: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            color: #333;
            display: none;
            z-index: 100;
            max-height: 300px;
            overflow-y: auto;
        }

        .consulta-expandida-avisaai h4 {
            margin-bottom: 5px;
        }

        .consulta-expandida-avisaai .item-consulta-avisaai {
            cursor: pointer;
            padding: 5px 0;
            border-bottom: 1px solid #ddd;
        }

        .consulta-expandida-avisaai .item-consulta-avisaai:last-child {
            border-bottom: none;
        }

        .consulta-expandida-avisaai .item-consulta-avisaai:hover {
            background-color: #ddd;
        }

        /* Barra lateral */
        .barra-lateral-avisaai {
            position: fixed;
            left: -100%;
            top: 0;
            width: 300px;
            height: 100%;
            background-color: #2c3e50;
            color: #ffffff;
            transition: left 0.3s ease;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.2);
            z-index: 1000;
        }

        .barra-lateral-avisaai.aberta {
            left: 0;
        }

        .barra-lateral-avisaai .menu-avisaai {
            margin-bottom: 20px;
        }

        .barra-lateral-avisaai .menu-avisaai h2 {
            margin-bottom: 15px;
        }

        .barra-lateral-avisaai .menu-avisaai a {
            display: flex;
            align-items: center;
            color: #ffffff;
            text-decoration: none;
            padding: 5px 0;
        }

        .barra-lateral-avisaai .menu-avisaai img {
            margin-right: 10px;
            width: 24px;
        }

        .barra-lateral-avisaai .perfil-avisaai {
            margin-top: auto;
        }

        .barra-lateral-avisaai .perfil-avisaai img {
            border-radius: 50%;
            width: 40px;
            margin-right: 10px;
        }

        .barra-lateral-avisaai button {
            margin-top: 10px;
            background-color: #e74c3c;
            color: #ffffff;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            width: 100%;
        }

        /* Fundo transparente para fechar a barra */
        .fundo-transparente-avisaai {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 999;
        }

        .fundo-transparente-avisaai.ativo {
            display: block;
        }

        /* Responsividade */
        @media (max-width: 768px) {
            .cabecalho-avisaai {
                flex-direction: column;
                align-items: flex-start;
            }

            .barra-consulta-avisaai {
                width: 100%;
                margin: 10px 0;
            }

            .barra-lateral-avisaai {
                width: 250px;
            }
        }
    </style>
</head>
<body>

<div class="fundo-transparente-avisaai" id="fundoTransparente" onclick="fecharMenu()"></div>

<header class="cabecalho-avisaai">
    <i class="fas fa-bars icone-menu-avisaai" onclick="alternarMenu()"></i>
    <div class="logo-avisaai">
        <i class="fas fa-users"></i> AvisaAí!
    </div>
    <div class="barra-consulta-avisaai">
        <i class="fas fa-search"></i>
        <input type="text" placeholder="Consultar" onkeyup="mostrarConsultaExpandida(this.value)">
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
    <div class="icones-avisaai">
        <a href="cadastrar-incidente">
            <img src="icons/cadastrar-incidente.png" alt="Cadastrar Incidente">
        </a>
        <a href="feed">
            <img src="icons/feed.png" alt="Feed">
        </a>
        <a href="notificacoes">
            <img src="icons/notificacoes.png" alt="Notificações">
        </a>
        <a href="perfil-usuario">
            <img src="icons/perfil.png" alt="Perfil">
        </a>
    </div>
</header>

<!-- Barra lateral -->
<div class="barra-lateral-avisaai" id="barraLateral">
    <div class="menu-avisaai">
        <h2>Menu</h2>
        <a href="cadastrar-incidente"><i class="fas fa-exclamation-triangle"></i> Cadastrar Incidente</a>
        <a href="feed"><i class="fas fa-newspaper"></i> Feed</a>
        <h3>Comunidades</h3>
        <c:forEach var="comunidade" items="${comunidades}">
            <a href="perfil-comunidade?id=${comunidade.id}">
                <img src="${comunidade.foto}" alt="${comunidade.nome}"> ${comunidade.nome}
            </a>
        </c:forEach>
    </div>
    <div class="perfil-avisaai">
        <img src="icons/perfil.png" alt="Perfil">
        <span>Usuário Logado</span>
        <button onclick="redirecionar('sair')"><i class="fas fa-sign-out-alt"></i> Sair da Conta</button>
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
        if (valor.length > 0) {
            consultaExpandida.style.display = "block";
        } else {
            consultaExpandida.style.display = "none";
        }
    }

    function redirecionar(url) {
        window.location.href = url;
    }
</script>

</body>
</html>