<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <!-- Metadados do documento -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AvisaAí - Cabeçalho Admin</title>
</head>

<body>
    <header class="navbar">
        <!-- Seção de menu e logo -->
        <div class="menu-e-logo">
            <div class="menu-btn">
                <!-- Botão do menu -->
                <a href=""> 
                    <img src="" alt="menu" class="menu">
                </a>
                <!-- Logo com link para a página inicial -->
                <a href=""> 
                    <img src="logo.png" alt="Logo" class="logo">
                </a>
            </div>
        </div>        
        <!-- Barra de consulta -->
       <div class="barra-consulta">
    		<div class="consulta-container">
        <!-- Formulário para enviar a consulta ao servlet -->
        		<form action="consulta" method="GET">
            		<input type="text" name="consulta" class="consulta-input" placeholder="Consultar">
            			<button type="submit">Enviar</button>
        		</form>
    		</div>
		</div>

        <!-- Ícones do cabeçalho -->
        <div class="icones-cabecalho">
            <a href="" class="incidente-btn">
                <img src="" alt="Cadastrar Localidade">
                Localidade
            </a>
            <a href="" class="incidente-btn">
                <img src="" alt="Cadastrar Comunidade">
                Comunidade
            </a>
            <a href="" class="incidente-btn">
                <img src="" alt="Cadastrar Incidente">
                Cadastrar Incidente
            </a>
            <a href="" class="feed-btn">
                <img src="" alt="Feed">
                Feed
            </a>
            <a href="" class="acompanhados-btn">
                <img src="" alt="Notificações">
            </a>
            <a href="" class="perfil-btn">
                <img src="" alt="Perfil">
            </a>
        </div>
    </header>
</body>

</html>