<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../componentes/cabecalho.jsp" />
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AvisaAí - Perfil Usuário</title>
<link rel="shortcut icon" href="" type="image/x-icon">

<style>
    /* Estilo geral */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
    }
    main {
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }
    /* Estilo do container do perfil */
    .perfil-container {
        display: grid;
        grid-template-rows: auto auto 1fr auto;
        gap: 20px;
        width: 300px;
        background-color: white;
        border-radius: 10px;
        box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        text-align: center;
    }
    /* Estilo da imagem de perfil */
    .perfil-imagem {
        position: relative;
        display: flex;
        justify-content: center;
    }
    .perfil-imagem img {
        width: 120px;
        height: 120px;
        border-radius: 50%;
        object-fit: cover;
    }
    .editar-foto {
        position: absolute;
        bottom: 10px;
    }
    .editar-foto input[type="file"] {
        display: none;
    }
    .editar-foto button {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 5px 10px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 12px;
    }
    .editar-foto button:hover {
        background-color: #0056b3;
    }
    /* Nome do usuário */
    .perfil-nome span {
        font-size: 20px;
        font-weight: bold;
        color: #333;
    }
    /* Botões de ação */
    .perfil-botoes {
        display: grid;
        gap: 10px;
    }
    .perfil-botoes button {
        display: flex;
        align-items: center;
        padding: 10px;
        background-color: #fff;
        border: 1px solid #ddd;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .perfil-botoes button:hover {
        background-color: #f0f0f0;
    }
    .perfil-botoes img {
        width: 24px;
        height: 24px;
        margin-right: 10px;
    }
    /* Estilo para o link de Log-out */
    .perfil-logout {
        margin-top: 10px;
        color: #007BFF;
        font-weight: bold;
        text-decoration: none;
        transition: color 0.3s;
    }
    .perfil-logout:hover {
        color: #0056b3;
    }
</style>
</head>
<body>
   <main>
		<c:choose>
			<c:when test="${usuario == null}">
				<p>Nenhum usuário encontrado.</p>
			</c:when>
			<c:otherwise>
				<div class="perfil-container">
					<div class="perfil-imagem">
						<img src="${usuario.fotoPerfil}"
							alt="Foto de ${usuario.nome} ${usuario.sobrenome}">
						<div class="editar-foto">
							<form action="uploadFoto" method="post"
								enctype="multipart/form-data">
								<input type="file" name="foto-perfil" id="foto-perfil">
								<input type="hidden" name="id-usuario" value="${usuario.id}">
								<button type="submit">Atualizar Foto</button>
							</form>
						</div>
					</div>
					<div class="perfil-nome">
						<span class="nome-usuario">${usuario.nome}
							${usuario.sobrenome}</span>
					</div>
					<div class="perfil-botoes">
						<button type="button"
							onclick="window.location.href='incidentes-acompanhados'">
							<img src="img/icidente-acompanhados.png"
								alt="Ícone Incidentes Acompanhados Usuário"
								class="icone-icidente-acompanhados">
						</button>
						<button type="button"
							onclick="window.location.href='configuracoes'">
							<img src="img/icone-configuracao.png" alt="Configurações"
								class="icone-configuracao">
						</button>
						<a href="logout"> <img src="img/icone-logout.png" alt="Logout"
							class="icone-logout">
						</a>
					</div>
				</div>
			</c:otherwise>
		</c:choose>
	</main>
</body>
</html>
