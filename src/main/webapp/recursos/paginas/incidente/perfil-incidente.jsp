<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../componentes/cabecalho.jsp"/>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AvisaAí - Postagem de Incidente</title>
<link rel="shortcut icon" href="img" type="image/x-icon">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Manrope', sans-serif;
}

body {
	background-color: #f4f4f4;
}

.container-postagem {
	width: 100%;
	max-width: 1000px;
	margin: 40px auto;
	padding: 20px;
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

h2 {
	font-size: 30px;
	color: #333;
	text-align: center;
	margin-bottom: 20px;
}

.cabecalho-postagem {
	display: flex;
	align-items: center;
	justify-content: space-between;
	margin-bottom: 20px;
}

.titulo-postagem {
	color: #555;
	font-size: 24px;
	font-weight: bold;
}

.icone-situacao {
	display: flex;
	align-items: center;
	color: #3498DB;
	font-size: 14px;
}

.informacao-postagem {
	display: ruby;
	align-items: center;
	gap: 10px;
	margin-bottom: 20px;
}

.imagem-usuario {
	border-radius: 50%;
	width: 40px;
	height: 40px;
	object-fit: cover;
}

.nome {
	color: #555;
	font-size: 14px;
}

.data {
	color: #888;
	font-size: 12px;
}

.mensagem-postagem {
	font-size: 16px;
	color: #333;
	margin-top: 10px;
	margin-bottom: 20px;
}

.imagem-postagem {
	width: 100%;
	border-radius: 8px;
	margin-bottom: 20px;
}

.miniaturas {
	display: flex;
	gap: 10px;
	justify-content: center;
	margin-bottom: 20px;
}

.miniaturas img {
	width: 80px;
	height: 80px;
	object-fit: cover;
	border-radius: 5px;
	cursor: pointer;
	transition: transform 0.3s ease;
}

.miniaturas img:hover {
	transform: scale(1.1);
}

.reacoes {
	display: flex;
	align-items: center;
	gap: 20px;
	font-size: 14px;
	margin-bottom: 20px;
}

.botao-curtir {
	display: flex;
	align-items: center;
	padding: 8px 12px;
	font-size: 14px;
	background-color: #3498DB;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.botao-curtir:hover {
	background-color: #2C3E50;
	transform: scale(1.05);
}

.botao-curtir:active {
	transform: scale(0.98);
}

.contador-comentarios {
	display: flex;
	align-items: center;
	font-size: 14px;
	color: #333;
}

.campo-comentario {
	margin-bottom: 20px;
}

.formulario-grupo {
	margin-bottom: 10px;
}

label {
	font-weight: bold;
	display: block;
	font-size: 14px;
	margin-bottom: 5px;
	color: #555;
}

textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
	color: #333;
	resize: vertical;
	height: 80px;
	transition: border 0.3s, box-shadow 0.3s;
}

textarea:focus {
	border-color: #3498DB;
	box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
	outline: none;
}

.botao-enviar {
	padding: 10px 20px;
	font-size: 14px;
	border: none;
	border-radius: 5px;
	background-color: #3498DB;
	color: white;
	cursor: pointer;
	transition: background-color 0.3s, transform 0.2s;
}

.botao-enviar:hover {
	background-color: #2C3E50;
	transform: scale(1.05);
}

.comentarios {
	border-top: 1px solid #e0e0e0;
	padding-top: 20px;
}

.comentario {
	color: #333;
	margin-bottom: 15px;
}

.respostas {
	margin-left: 20px;
	margin-top: 10px;
}

.botao-responder {
	font-size: 12px;
	background-color: #3498DB;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	padding: 5px 10px;
	margin-top: 10px;
}

.botao-responder:hover {
	background-color: #2C3E50;
}

.fechar-resposta {
	position: relative;
	top: 5px;
	right: 10px;
	font-size: 20px;
	color: #888;
	cursor: pointer;
}

@media ( max-width : 600px) {
	.container-postagem {
		padding: 10px;
	}
	.titulo-postagem {
		font-size: 20px;
	}
	.mensagem-postagem {
		font-size: 14px;
	}
	.reacoes {
		font-size: 12px;
	}
	textarea {
		height: 60px;
	}
}
</style>
<script>
	function trocarImagemPrincipal(imagemUrl) {
		document.getElementById("imagem-principal").src = imagemUrl;
	}

	function responderComentario(comentarioId) {
		const respostaContainer = document.getElementById("resposta-"
				+ comentarioId);
		respostaContainer.style.display = 'block';
	}

	function fecharResposta(comentarioId) {
		const respostaContainer = document.getElementById("resposta-"
				+ comentarioId);
		respostaContainer.style.display = 'none';
	}
</script>
</head>
<body>

	<main>
		<div class="container-postagem">
			<div class="cabecalho-postagem">
				<div class="titulo-postagem">${incidente.titulo}</div>
				<div class="icone-situacao">${incidente.categoria}</div>
			</div>

			<img id="imagem-principal" src="https://via.placeholder.com/600x300"
				alt="Imagem da enxurrada" class="imagem-postagem">

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

			<div class="reacoes">
				<button class="botao-curtir">
					<img src="" alt="">Curtir
				</button>
				<span id="contador-curtidas">Curtidas</span> <span
					class="contador-comentarios">Comentários</span>
			</div>

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

			<div class="comentarios">
				<div class="comentario">
					<div>
						<span class="nome">{comentario.usuario}</span> <span class="data">{comentario.dataHora}</span>
					</div>
					<div>${comentario.conteudo}</div>
					<button class="botao-responder"
						onclick="responderComentario('comentario1')">Responder</button>

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

</body>
</html>