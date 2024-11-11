<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Consulta de Comunidades</title>
 <link rel="stylesheet" type="text/css" href="../../css/comunidade/comunidade.css">
<link rel="shortcut icon" href="" type="image/x-icon">
</head>

<body>
	<form action="comunidades" method="get">
		<input type="text" name="nome" placeholder="Nome da comunidade" />
		<button type="submit">Enviar</button>
	</form>
	<div class="container-comunidades">
		<c:forEach var="comunidade" items="${listaComunidades}">
			<div class="card-comunidade">
				<img src="${comunidade.fotoPerfil}"
					alt="Foto da comunidade ${comunidade.nome}" />
				<div class="titulo-comunidade">${comunidade.nome}</div>
				<div class="descricao-comunidade">
					Sobre:<br /> ${comunidade.descricao}
				</div>
				<c:choose>
					<c:when test="${comunidade.acompanhando}">
						<a href="desacompanhar?id=${comunidade.id}"
							class="botao-acompanhar desacompanhar">Desacompanhar</a>
					</c:when>
					<c:otherwise>
						<a href="acompanhar?id=${comunidade.id}" class="botao-acompanhar">Acompanhar</a>
					</c:otherwise>
				</c:choose>
			</div>
		</c:forEach>
	</div>
	<script
		src="<%=request.getContextPath()%>/recursos/js/comunidade/comunidade.js"></script>
</body>
</html>
