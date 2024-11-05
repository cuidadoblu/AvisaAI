<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>AvisaAí - Lista de Comentários</title>
<link rel="stylesheet" href="styles.css" />
</head>
<body>
	<main>
		<div class="container-comentarios">
			<c:choose>
				<c:when test="${empty listaComentarios}">
					<p>Nenhum comentário disponível.</p>
				</c:when>
				<c:otherwise>
					<div class="lista-comentarios">
						<c:forEach var="comentario" items="${listaComentarios}">
							<div class="comentario">
								<div class="autor">
									<img src="${comentario.usuario.foto}" alt="Foto do usuário"
										class="foto-usuario" /> <span class="nome-autor">${comentario.usuario.nome}</span>
									<span class="data-hora">${comentario.dataHora}</span>
								</div>
								<div class="conteudo">
									<p class="texto-comentario">${comentario.conteudo}</p>
								</div>
								<div class="acoes">
									<a href="#" class="avaliar">Avaliar</a> <a href="#"
										class="responder">Responder</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</main>
</body>
</html>
