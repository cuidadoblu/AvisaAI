<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AvisaAí - Perfil Usuário</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/usuario/usuario.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/incidente/incidente.css">
</head>
<body>
<div class="principal">
    <div class="coluna" id="esquerda">
        <c:choose>
            <c:when test="${usuario != null}">
                <div class="perfil-container">
                    <div class="perfil-imagem">
                        <img src="exibir-foto?id-foto=${usuario.fotoPerfil.id}"
                             alt="Foto de ${usuario.nome} ${usuario.sobrenome}">
                    </div>
                    <div class="perfil-nome">
                        <span class="nome-usuario">${usuario.nome} ${usuario.sobrenome}</span>
                    </div>
                    <div class="perfil-botoes">
                        <a id="cadastrados-usuario" class="incidentes cadastrados">
                            <span>1 incidentes cadastrados</span>
                        </a>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <p>Usuário não encontrado.</p>
            </c:otherwise>
        </c:choose>
    </div>
    <div class="coluna" id="meio">
        <jsp:include page="../componentes/feed-incidentes.jsp"/>
    </div>
    <div class="coluna" id="direita">Direita</div>
</div>
</body>
<style>
.container-postagem:hover {
	transform: scale(1.01);
}

.container-postagem:active {
	transform: scale(0.98);
}
</style>
</html>