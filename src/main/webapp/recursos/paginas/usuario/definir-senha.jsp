<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AvisaAí - Definir Senha</title>
<link rel="shortcut icon"
	href="${pageContext.request.contextPath}/recursos/imagens/logos/png/icone%20guarda-chuva.png"
	type="image/x-icon">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/recursos/css/usuario/usuario.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/recursos/css/geral.css">
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
				<img src="${pageContext.request.contextPath}/recursos/imagens/ilustracoes/png/definir_senha.png" alt="Cadastro" class="imagem-tela">
			</div>
			<div class="acesso-direita">
				<div class="formulario-entradas">
					<h2>Definir Senha</h2>
					<form action="atualizar-cadastro" method="post">
						<input type="password" name="senha" id="senha"
							placeholder="Senha:" required> <input type="password"
							name="confirmarsenha" id="confirmarsenha"
							placeholder="Confirmar Senha:" required>
						<div class="formulario-botoes">
							<div class="botao-login">
								Já tem conta? <a href="login" class="link">Entrar</a>
							</div>
							<div class="botao-submit">
								<button type="button"
									onclick="window.location.href='cadastro-usuario'"
									class="botao-cadastrar">Cadastrar-se</button>
								<button type="submit" class="botao-confirmar">Confirmar</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</main>
</body>
</html>