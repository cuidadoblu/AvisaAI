<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/recursos/paginas/componentes/cabecalho.jsp" />

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8" />
<title>Consulta de Comunidades</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/recursos/css/comunidade/comunidade.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/recursos/css/geral.css">

<script>
    function toggleAcompanhamento(button, comunidadeId) {
        // Altera o texto do botão entre "Acompanhar" e "Desacompanhar"
        if (button.textContent === 'Acompanhar') {
            button.textContent = 'Desacompanhar'; // Altera o texto para "Desacompanhar"
            window.location.href = 'acompanhar-comunidade?id-comunidade=' + comunidadeId; // Redireciona para acompanhar
        } else {
            button.textContent = 'Acompanhar'; // Altera o texto para "Acompanhar"
            window.location.href = 'acompanhar-comunidade?id-comunidade=' + comunidadeId; // Redireciona para desacompanhar
        }
    }
</script>

</head>
<body>
	<h2>Consulta de Comunidades</h2>
	<form action="comunidades" method="get">
		<input type="text" name="nome" placeholder="Nome da comunidade" />
		<button type="submit">Pesquisar</button>
	</form>

	<div class="container-comunidades">
		<c:choose>
			<c:when test="${empty listaComunidades}">
				<p>Nenhuma comunidade encontrada.</p>
			</c:when>
			<c:otherwise>
				<c:forEach var="comunidade" items="${listaComunidades}">
					<div class="card-comunidade">
						<img src="${comunidade.fotoPerfil}"
							alt="Foto da comunidade ${comunidade.nome}" />
						<div class="titulo-comunidade">${comunidade.nome}</div>
						<div class="descricao-comunidade">
							Sobre:<br /> ${comunidade.descricao}
						</div>

						<div class="perfil-botoes">
							<!-- Aqui o botão alterna entre "Acompanhar" e "Desacompanhar" -->
							<button type="button"
								onclick="toggleAcompanhamento(this, ${comunidade.id})"
								class="botao-acompanhar">Acompanhar</button>
						</div>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>
