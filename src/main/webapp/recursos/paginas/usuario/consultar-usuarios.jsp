<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AvisaAí - Consulta Usuario</title>
<link rel="stylesheet" type="text/css" href="../../css/usuario/usuario.css">
<link rel="shortcut icon" href="" type="image/x-icon">
</head>
<body class="consultar-usuario">
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
	<script
		src="<%=request.getContextPath()%>/recursos/js/usuario/usuario.js"></script>
</html>
