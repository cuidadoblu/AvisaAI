<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>AvisaAí - Cadastro de Comentário</title>
<link rel="stylesheet" href="styles.css" />
</head>
<body>
	<main>
		<div class="comment-section">
			<h2>Escreva um Comentário</h2>
			<form action="inserir-comentario" method="post">
				<input type="hidden" name="id-incidente" value='${incidente.id}' />
				<input type="hidden" name="id-usuario" value='${usuariologado.id}' />
				<textarea name="conteudo"
					placeholder="Escreva seu comentário aqui..." required></textarea>
				<button type="submit" class="botao-enviar">Enviar</button>
			</form>
		</div>
	</main>
</body>
</html>