<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AvisaAí - Meu Perfil</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/usuario/usuario.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/incidente/incidente.css">
</head>
<body>
<div class="principal">
    <div class="coluna" id="esquerda">
        <div class="perfil-container">
            <div class="perfil-imagem">
                <img id= "editar-foto-usuario" src="exibir-foto?id-foto=${usuarioLogado.fotoPerfil.id}"
                     alt="Foto de ${usuarioLogado.nome} ${usuarioLogado.sobrenome}">
            </div>
            <div class="perfil-nome">
                <span class="nome-usuario">${usuarioLogado.nome} ${usuarioLogado.sobrenome}</span>
            </div>
            <div class="perfil-botoes">
                <button type="button" onclick="window.location.href='incidentes-acompanhados'">
                    <img src="${pageContext.request.contextPath}/recursos//imagens/icones/usuario/acompanhados perfil.png"
                         alt="Incidentes Acompanhados" class="icone-icidente-acompanhados"> Incidentes Acompanhados
                </button>
                <jsp:include page="/recursos/paginas/componentes/editar-usuario.jsp"/>
                <a href="deslogar">
                    <img src="${pageContext.request.contextPath}/recursos/imagens/icones/usuario/Lego-out%20perfil.png"
                         alt="Logout" class="icone-logout">Log out
                </a>
            </div>
        </div>
    </div>
    <div class="coluna" id="meio">
        <jsp:include page="../componentes/feed-incidentes.jsp"/>
    </div>
    <div class="coluna" id="direita"><!-- Conteúdo ou espaços laterais --></div>
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
