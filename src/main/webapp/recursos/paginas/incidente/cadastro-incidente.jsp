<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../componentes/cabecalho.jsp" />
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AvisaAí - Cadastro Incidente</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/recursos/css/incidente/incidente.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/recursos/css/geral.css">
</head>
<body>
	<main>
		<div class="principal">
			<div class="coluna" id="esquerda"><!-- Conteúdo ou espaços laterais --></div>
			<div class="coluna" id="meio">
				<div class="container-cadastro">
					<div class="cabecalho-cadastro">
						<a href="feed-pessoal" class="botao-retornar"> <svg width="24"
								height="25" viewBox="0 0 24 25" fill="none"
								xmlns="http://www.w3.org/2000/svg">
                    <rect x="0.5" y="1" width="23" height="23" rx="3.5"
									stroke="#D0D5DD" />
                    <path d="M14 16.5L10 12.5L14 8.5" stroke="#64748B"
									stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                </svg>
						</a>
						<h2>Cadastrar Incidente</h2>
					</div>
					<form action="inserir-incidente" method="post"
						enctype="multipart/form-data">
						<div class="formulario-entradas">
							<div class="formulario-grupo">
								<label for="titulo">Título</label> <input type="text"
									id="titulo" name="titulo" class="formulario-controle"
									placeholder="Escreva o título do incidente..." maxlength="50"
									required>
							</div>

							<div class="formulario-grupo">
								<label for="descricao">Descrição</label>
								<textarea id="descricao" name="descricao"
									class="formulario-controle"
									placeholder="Escreva uma descrição para o seu incidente..."
									required></textarea>
							</div>

							<div class="formulario-grupo">
								<label for="foto" class="arquivo-foto">Escolha uma foto</label>
								<input type="file" id="foto" name="foto" class="arquivo-foto"
									accept="image/*" multiple>
							</div>

							<div class="formulario-grupo">
								<label for="logradouro">Logradouro</label> <select
									id="logradouro" name="id-localidade"
									class="formulario-controle" required>
									<option value="" disabled selected>Selecione o seu
										Logradouro</option>
									<c:forEach var="localidade" items="${listaLocalidades}">
										<option value="${localidade.id}">${localidade.cidade},${localidade.bairro},${localidade.logradouro}</option>
									</c:forEach>
								</select>
							</div>

							<div class="formulario-grupo">
								<label for="comunidade">Comunidade</label> <select
									id="comunidade" name="id-comunidade"
									class="formulario-controle" required>
									<option value="" disabled selected>Selecione a
										Comunidade</option>
									<c:forEach var="comunidade" items="${listaComunidades}">
										<option value="${comunidade.id}">${comunidade.nome}</option>
									</c:forEach>
								</select>
							</div>

							<div class="formulario-grupo">
								<label for="categoria">Categoria</label> <select id="categoria"
									name="categoria" class="formulario-controle" required>
									<option value="ENXURRADA">Enxurrada</option>
									<option value="ALAGAMENTO">Alagamento</option>
									<option value="INUNDACAO">Inundação</option>
									<option value="DESLIZAMENTO">Deslizamento</option>
									<option value="DOACAO">Doação</option>
									<option value="RESGATE">Resgate</option>
									<option value="ASSISTENCIA">Assistência</option>
									<option value="OUTROS">Outros</option>
								</select>
							</div>

							<div class="formulario-botoes">
								<button type="reset" class="botao-limpar">Limpar</button>
								<button type="submit" class="botao-confirmar">Confirmar</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="coluna" id="direita"><!-- Conteúdo ou espaços laterais --></div>
		</div>
	</main>
</body>
</html>