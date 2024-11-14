<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AvisaAí - Perfil Comunidade</title>
<link rel="shortcut icon" href="" type="image/x-icon">
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
				<button type="submit" value='${usuario.id}'
					onclick="window.location.href='acompanhar'">Acompanhar</button>
				<button type="button"
					onclick="window.location.href='usuariosComunidade'">Ver
					Usuários</button>
			</div>
		</div>
	</main>
</body>
</html>