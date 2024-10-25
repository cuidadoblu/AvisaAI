<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AvisaAí - Perfil Comunidade</title>
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
</head>
<body>
	<main>
		<div class="comunidade-container">
			<!-- perfil do comunidade -->
			<div class="comunidade-imagem">
				<img src="<c:out value='${comunidade.fotoPerfil}'/>"
					alt="Imagem de Perfil da Comunidade">
			</div>
			<!-- nome do usuário -->
			<div class="comunidade-nome">
				<h2>
					<c:out value='${comunidade.nome}' />
				</h2>
			</div>
			<div class="comunidade-localidade">
				<h2>
					Comunidade
					<c:out value='${comunidade.localidade}' />
				</h2>
			</div>
			<div class="comunidade-descricao">
				<h2>
					Sobre a Comunidade:
					<c:out value='${comunidade.descricao}' />
				</h2>
			</div>

			<!-- Botões -->
			<div class="perfil-botoes">
				<button type="button" onclick="window.location.href=''">
					Acompanhar</button>
				<button type="button" onclick="window.location.href=''">
					Ver Usuários</button>

			</div>
		</div>
	</main>
</body>
</html>