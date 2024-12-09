<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<jsp:include page="../componentes/cabecalho.jsp" />
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AvisaAí - Feed Pessoal</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/recursos/css/incidente/incidente.css">
</head>
<body>
	<div class="principal">
		<div class="coluna" id="esquerda"><!-- Conteúdo ou espaços laterais --></div>
		<div class="coluna" id="meio">
			<jsp:include page="../componentes/feed-incidentes.jsp" />
		</div>
		<div class="coluna" id="direita">
			<jsp:include page="../componentes/filtro.jsp"/>
		</div>
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
