<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AvisaAí - Login</title>
	<link rel="shortcut icon" href="${pageContext.request.contextPath}/recursos/imagens/logos/png/icone%20guarda-chuva.png" type="image/x-icon">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/usuario/usuario.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/geral.css">
</head>
<body>
	<header>
		<div class="logo-acesso">
			<a href="pagina-inicial"> <img src="img" alt="Logo do AvisaAí"
				class="logo-avisaai">
			</a>
		</div>
	</header>
	<main>
		<div class="container-acesso">
			<div class="acesso-esquerda">
				<img src="" alt="Imagem de Login" class="imagem-centralizada">
			</div>
			<div class="acesso-direita">
				<h2>Login</h2>
				<div class="formulario-entradas">
					<form action="fazer-login" method="POST">
						<div class="formulario-grupo">
							<input type="email" name="email" id="email" placeholder="E-mail:" required>
						</div>
						<div class="formulario-grupo">
							<input type="password" name="senha" id="senha" placeholder="Senha:" required>
						</div>
						<div class="formulario-botoes">
							<button type="submit" class="botao-confirmar">Confirmar</button>
							<button type="button"
									onclick="window.location.href='cadastro-usuario'"
									class="botao-cadastrar">Cadastrar-se</button>
						</div>
						<div class="botao-cadastro">
							<a href="alterar-senha" class="link">Esqueceu a senha?</a>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>