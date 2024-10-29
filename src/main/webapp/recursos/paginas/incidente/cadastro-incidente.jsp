<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>AvisaAí - Cadastro Incidente</title>
	<link rel="shortcut icon" href="img" type="image/x-icon">
</head>
<body>
<main>
	<div class="container-cadastro">
		<div class="cabecalho-cadastro">
			<a href="inserir-incidente" class="botao-retornar">←</a>
			<h2>Cadastrar Incidente</h2>
		</div>
		<form action="inserir-incidente" method="post"
			  enctype="multipart/form-data">
			<div class="formulario-entradas">
				<div class="formulario-grupo">
					<label for="titulo">Título</label> <input type="text"
															  id="titulo" name="titulo"
															  placeholder="Escreva o título do incidente..." maxlength="50"
															  required> <span class="contador-caracteres">0/50</span>
				</div>

				<div class="formulario-grupo">
					<label for="descricao">Descrição</label>
					<textarea id="descricao" name="descricao"
							  placeholder="Escreva uma descrição para o seu incidente..."
							  required></textarea>
				</div>

				<div class="formulario-grupo">
					<label for="foto" class="arquivo-foto">Escolha uma
						foto</label> <input type="file" id="foto" name="foto"
											class="arquivo-foto" accept="image/*">
				</div>

				<div class="formulario-grupo">
					<label for="usuario">Usuário</label> <input type="text"
																id="usuario" name="usuario" placeholder="insira o autor"
																maxlength="50" required>
				</div>

				<!--Aqui vai um  método recuperando os bairros(localidades) -->
				<div class="formulario-grupo">
					<label for="bairro">Bairro</label> <select id="bairro"
															   name="bairro" required>
					<option value="" disabled>Selecione o seu bairro...</option>
					<c:forEach var="localidade" items="${localidades}">
						<option value="${localidade.bairro}">${localidade.bairro}</option>
					</c:forEach>
				</select>
				</div>

				<div class="formulario-grupo">
					<label for="logradouro">Logradouro</label> <select id="logradouro"
																	   name="id-logradouro" required>
					<option value="" disabled>Selecione o seu logradouro...</option>
					<c:forEach var="localidade" items="${localidades}">
						<option value="${localidade.id}">${localidade.logradouro}</option>
					</c:forEach>
				</select>
				</div>



				<div class="formulario-grupo">
					<label for="categoria">Categoria</label> <select id="categoria"
																	 name="categoria" required>
					<option value="Enxurrada">Enxurrada</option>
					<option value="Alagamento">Alagamento</option>
					<option value="Inundacao">Inundação</option>
					<option value="Enchente">Enchente</option>
					<option value="Deslizamento">Deslizamento</option>
					<option value="Outros">Outros</option>
				</select>
				</div>

				<div class="formulario-botoes">
					<button type="button" class="botao-cancelar"
							onclick="window.location.href='feed-pessoal'">Cancelar</button>
					<button type="submit" class="botao-confirmar">Confirmar</button>
				</div>
			</div>
		</form>
	</div>
</main>
</body>
</html>