<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../componentes/cabecalho.jsp" />
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8" />
<title>Lista de Usuários</title>
<style>
.lista-usuarios {
	list-style-type: none;
	padding: 0;
}

.card-usuario {
	display: flex;
	align-items: center;
	margin-bottom: 20px;
	text-decoration: none;
	color: inherit;
}

.card-usuario img {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-right: 15px;
}

.nome-usuario {
	font-size: 18px;
	color: #2d3e50;
}

.card-usuario:hover {
	background-color: #f0f0f0;
	cursor: pointer;
}
</style>
</head>
<body>
	<form action="usuarios" method="get">
		<input type="text" name="nome" id="nome" placeholder="Nome de usuário" />
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
							alt="Foto de ${usuario.nome} ${usuario.sobrenome}" /> <span
							class="nome-usuario">${usuario.nome} ${usuario.sobrenome}</span>
					</a></li>
				</c:forEach>
			</ul>
		</c:otherwise>
	</c:choose>
</body>
</html>
