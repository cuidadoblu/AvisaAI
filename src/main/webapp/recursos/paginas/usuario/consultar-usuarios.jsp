<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"/>
    <title>Lista de Usuários</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/usuario/usuario.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/geral.css">
 
</head>
<body>
<form action="usuarios" method="get">
    <input type="text" name="nome" id="nome" placeholder="Nome de usuário"/>
    <button type="submit">Consultar</button>
</form>
<c:choose>
    <c:when test="${empty listaUsuarios}">
        <p>Nenhum usuário encontrado.</p>
    </c:when>
    <c:otherwise>
        <ul class="lista-usuarios">
            <c:forEach var="usuario" items="${listaUsuarios}">
                <li><a href="perfil-usuario?id-usuario=${usuario.id}"
                       class="card-usuario"> <img src="${usuario.fotoPerfil}"
                                                  alt="Foto de ${usuario.nome} ${usuario.sobrenome}"/> <span
                        class="nome-usuario">${usuario.nome} ${usuario.sobrenome}</span>
                </a></li>
            </c:forEach>
        </ul>
    </c:otherwise>
</c:choose>
</body>
</html>
