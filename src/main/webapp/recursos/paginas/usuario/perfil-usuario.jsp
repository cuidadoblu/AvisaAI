<%@ page import="avisaai.modelo.dao.foto.FotoDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html lang="pt-br">
<script>
    function atualizarUsuario() {

    }
</script>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AvisaAí - Perfil Usuário</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/usuario/usuario.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/geral.css">
</head>
<body class="perfil=usuario">
<main>
    <c:choose>
        <c:when test="${usuario != null}">
            <div class="perfil-container">
                <jsp:include page="/recursos/paginas/usuario/editar-usuario.jsp"/>
                <div class="perfil-imagem">
                    <img src="exibir-foto?id-foto=${fotoPerfil.id}"
                         alt="Foto de ${usuario.nome} ${usuario.sobrenome}">
                </div>
                <div class="perfil-nome">
						<span class="nome-usuario">${usuario.nome}
                                ${usuario.sobrenome}</span>
                </div>
                <div class="perfil-botoes">
                    <button type="button"
                            onclick="window.location.href='incidentes-acompanhados'">
                        <img src="img/icidente-acompanhados.png"
                             alt="Ícone Incidentes Acompanhados Usuário"
                             class="icone-icidente-acompanhados">
                    </button>
                    <button type="button"
                            onclick="window.location.href='editar-usuario'">
                        <img src="img/icone-configuracao.png" alt="Configurações"
                             class="icone-configuracao">
                    </button>
                    <a href="deslogar"> <img src="img/icone-logout.png" alt="Logout"
                                           class="icone-logout">
                    </a>
                </div>
            </div>
        </c:when>
        <c:otherwise>
            <p>Nenhum usuário encontrado.</p>
        </c:otherwise>
    </c:choose>
</main>
</body>
</html>
