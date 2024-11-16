<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="/recursos/paginas/componentes/cabecalho.jsp" />

<!DOCTYPE html>
<html lang="pt-BR">
<head>
<meta charset="UTF-8" />
<title>Perfil da Comunidade</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/recursos/imagens/logos/png/logo azul.png"
	type="image/x-icon">
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
	<main>
		<div class="comunidade-container">
			<div class="comunidade-imagem">
				<img src="<c:out value='${comunidade.fotoPerfil}'/>"
					alt="Imagem de Perfil da Comunidade">
			</div>
			<div class="comunidade-nome">
				<h2>
					<c:out value='${comunidade.nome}' />
				</h2>
			</div>
			<div class="comunidade-localidade">
				<h2>
					Comunidade:
					<c:out value='${comunidade.localidade}' />
				</h2>
			</div>
			<div class="comunidade-descricao">
				<h2>
					Sobre a Comunidade:
					<c:out value='${comunidade.descricao}' />
				</h2>
			</div>
			<div class="perfil-botoes">
				<!-- Aqui o botão alterna entre "Acompanhar" e "Desacompanhar" -->
				<button type="button"
					onclick="toggleAcompanhamento(this, ${comunidade.id})"
					class="botao-acompanhar">Acompanhar</button>
			</div>
		</div>
	</main>
</body>
</html>
