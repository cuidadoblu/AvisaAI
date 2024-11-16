<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AvisaAí - Cadastro</title>
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/recursos/imagens/logos/png/logo azul.png" type="image/x-icon">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/usuario/usuario.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/recursos/css/geral.css">
</head>
<body>
<header>
    <div class="logo-acesso">
        <a href="landing-Page">
            <img src="" alt="AvisaAí Logo" class="logo-avisaai">
        </a>
    </div>
</header>
<main>
    <div class="container-acesso">
        <div class="acesso-esquerda">
            <img src="" alt="Cadastro" class="imagem-tela">
        </div>
        <div class="acesso-direita">
            <div class="formulario-entradas">
                <h2>Cadastrar-se</h2>
                <form action="inserir-usuario" method="post">
                    <div class="formulario-grupo">
                        <input type="text" name="nome" id="nome" placeholder="Nome:" required>
                    </div>
                    <div class="formulario-grupo">
                        <input type="text" name="sobrenome" id="sobrenome" placeholder="Sobrenome:" required>
                    </div>
                    <div class="formulario-grupo">
                        <input type="tel" name="telefone" id="telefone" placeholder="Telefone:" pattern="[0-9]{11}"
                               required>
                    </div>
                    <div class="formulario-grupo">
                        <input type="email" name="email" id="email" placeholder="Email:" required>
                    </div>
                    <div class="formulario-grupo">
                        <input type="password" name="senha" id="senha" placeholder="Senha:" required>
                    </div>
                    <div class="formulario-grupo">
                        <input type="password" name="confirmarsenha" id="confirmarsenha" placeholder="Confirmar Senha:"
                               required>
                    </div>
                    <div class="formulario-botoes">
                        <div class="botao-login">
                            Já faz parte? <a href="login" class="link">Entrar</a>
                        </div>
                        <button type="submit" class="botao-confirmar">Confirmar</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</main>
</body>
</html>