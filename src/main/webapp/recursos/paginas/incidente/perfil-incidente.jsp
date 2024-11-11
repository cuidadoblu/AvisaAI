<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../componentes/cabecalho.jsp" />
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AvisaAí - Postagem de Incidente</title>
  <link rel="stylesheet" type="text/css" href="../../css/incidente/incidente.css">
<link rel="shortcut icon" href="img" type="image/x-icon">
</head>
<body class="perfil-incidente">
	<main>
		<div class="container-postagem">
			<div class="cabecalho-postagem">
				<div class="titulo-postagem">${incidente.titulo}</div>
				<div class="icone-situacao">${incidente.categoria}</div>
			</div>

			<!-- Imagem principal da postagem -->
			<img id="imagem-principal" src="https://via.placeholder.com/600x300"
				alt="Imagem da enxurrada" class="imagem-postagem">

			<!-- Miniaturas de imagens -->
			<div class="miniaturas">
				<img src="https://via.placeholder.com/600x300/ff0000" alt="Imagem 1"
					onclick="trocarImagemPrincipal('https://via.placeholder.com/600x300/ff0000')">
				<img src="https://via.placeholder.com/600x300/00ff00" alt="Imagem 2"
					onclick="trocarImagemPrincipal('https://via.placeholder.com/600x300/00ff00')">
				<img src="https://via.placeholder.com/600x300/0000ff" alt="Imagem 3"
					onclick="trocarImagemPrincipal('https://via.placeholder.com/600x300/0000ff')">
			</div>

			<div class="informacao-postagem">
				<img src="${usuario.fotoPerfil}"
					alt="Foto de ${usuario.nome} ${usuario.sobrenome}">
				<div>
					<div class="nome">${usuario.nome}${usuario.sobrenome}</div>
					<div class="data">${incidente.dataHora}</div>
				</div>
				<div class="mensagem-postagem">${incidente.descricao}</div>
			</div>
			<!-- Reações: Curtidas e Comentários -->
			<div class="reacoes">
				<button class="botao-curtir">
					<img src="" alt="">Curtir
				</button>
				<span id="contador-curtidas">Curtidas</span> <span
					class="contador-comentarios">Comentários</span>
			</div>

			<!-- Campo para novo comentário -->
			<div class="campo-comentario">
				<form action="inserir-comentario" method="post">
					<div class="formulario-grupo">
						<label for="novo-comentario">Adicionar comentário</label>
						<textarea id="novo-comentario" name="novo-comentario"
							placeholder="Escreva seu comentário aqui..." required></textarea>
					</div>
					<button type="submit" class="botao-enviar">Enviar
						comentário</button>
				</form>
			</div>

			<!-- Comentários existentes -->
			<div class="comentarios">
				<div class="comentario">
					<div>
						<span class="nome">{comentario.usuario}</span> <span class="data">{comentario.dataHora}</span>
					</div>
					<div>${comentario.conteudo}</div>
					<button class="botao-responder"
						onclick="responderComentario('comentario1')">Responder</button>

					<!-- Respostas -->
					<div id="resposta-comentario" class="respostas"
						style="display: none;">
						<span class="fechar-resposta"
							onclick="fecharResposta('comentario1')">&times;</span>
						<form action="inserir-resposta" method="post">
							<textarea name="resposta" placeholder="Escreva sua resposta..."
								required></textarea>
							<button type="submit" class="botao-enviar">Enviar
								resposta</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</main>
<script src="<%= request.getContextPath() %>/recursos/js/incidente/incidente.js"></script>
</body>
</html>