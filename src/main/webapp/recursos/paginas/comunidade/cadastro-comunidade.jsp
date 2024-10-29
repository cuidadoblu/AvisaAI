<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AvisaAí - Cadastro Comunidade</title>
<link rel="shortcut icon" href="img" type="image/x-icon">
</head>
<body>
	<main>
		<div class="container-cadastro">
			<div class="cabecalho-cadastro">
				<a href="inserir-comunidade" class="botao-retornar">←</a>
				<h2>Cadastrar Comunidade</h2>
			</div>
			<form action="cadastro-comunidade" method="post">
				<div class="formulario-entradas">
					<div class="foto-perfil">
						<label for="foto" class="foto-label"> <img src="" alt="Enviar Foto" class="icone-camera" id="foto-perfil"></label> 
						<input type="file" id="foto" class="foto-input" accept="image/*">
					</div>

					<div class="formulario-grupo">
						<label for="comunidade-nome">Comunidade</label> 
						<input type="text"id="nome" class="formulario-controle" placeholder="Escreva o nome da comunidade..." maxlength="30" required>
					</div>

					<div class="formulario-grupo">
						<label for="descricao">Descrição</label>
						<textarea id="descricao" class="formulario-controle" placeholder="Escreva uma descrição para a comunidade..." rows="4" srequired></textarea>
					</div>

					<div class="formulario-grupo">
						<label for="localidade">Localidade</label> 
						<select id="id-localidade" class="formulario-controle" required>
							<option value="" disabled selected>Não selecionado</option>
						</select>
					</div>

					<div class="formulario-botoes">
						<button type="button" class="botao-cancelar">Cancelar</button>
						<button type="submit" class="botao-confirmar">Confirmar</button>
					</div>
				</div>
			</form>
		</div>
	</main>
</body>
</html>