<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="/recursos/paginas/componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"/>
    <title>Consulta de Comunidades</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/recursos/imagens/logos/png/logo azul.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/comunidade/comunidade.css">
</head>
<body>
<form action="comunidades" method="get">
    <input type="text" name="nome" placeholder="Nome da comunidade"/>
    <button type="submit">Enviar</button>
</form>
<div class="container-comunidades">
    <c:forEach var="comunidade" items="${listaComunidades}">
        <div class="card-comunidade">
            <img src="${comunidade.fotoPerfil}" alt="Foto da comunidade ${comunidade.nome}"/>
            <div class="titulo-comunidade">${comunidade.nome}</div>
            <div class="descricao-comunidade">Sobre:<br/> ${comunidade.descricao}</div>
            <div class="botao-acompanhar">
            </div>
            <form>
                <button type="submit" class="botao-acompanhar">
                    <c:choose>
                        <c:when test="${comunidade.usuarios.contains(usuarioLogado)}">
                            <a href="desacompanhar?id-comunidade=${comunidade.id}" class="botao-acompanhar desacompanhar">Desacompanhar</a>
                        </c:when>
                        <c:otherwise>
                            <a href="acompanhar?id-comunidade=${comunidade.id}" class="botao-acompanhar">Acompanhar</a>
                        </c:otherwise>
                    </c:choose>
                </button>
            </form>
        </div>
    </c:forEach>
</div>
</body>
</html>
