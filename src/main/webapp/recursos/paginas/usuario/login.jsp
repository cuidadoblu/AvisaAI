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
<body class="adentrar">
	<header>
		<div class="logo-acesso">
			<a href="pagina-inicial"> <img src="${pageContext.request.contextPath}/recursos/imagens/logos/png/logo azul.png" alt="Logo do AvisaAí"
				class="logo-avisaai">
			</a>
		</div>
	</header>
	<main>
		<div class="container-acesso">
			<div class="acesso-esquerda">
				<img src="${pageContext.request.contextPath}/recursos/imagens/ilustracoes/png/login.png" alt="Imagem de Login" class="imagem-centralizada">
			</div>
			<div class="acesso-direita">
				<div class="formulario-entradas">
				<h2>Login</h2>
					<form action="fazer-login" method="POST">	
							<input type="email" name="email" id="email" placeholder="E-mail:" required>
							<input type="password" name="senha" id="senha" placeholder="Senha:" required>
						<div class="formulario-botoes">
							<div class="botao-login">
								<a href="alterar-senha" class="link">Esqueceu a senha?</a>
							</div>
							<div class="botao-submit">
								<button type="submit" class="botao-confirmar">Confirmar</button>
								<button type="button"
									onclick="window.location.href='cadastro-usuario'"
									class="botao-cadastrar">Cadastrar-se</button>
							</div>
						</div>
						
					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>