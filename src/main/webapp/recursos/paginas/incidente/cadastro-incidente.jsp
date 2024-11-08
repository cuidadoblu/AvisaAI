<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../componentes/cabecalho.jsp" />
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AvisaAí - Cadastro Incidente</title>
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

.container-cadastro {
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
	margin-bottom: auto;
}

.cabecalho-cadastro {
	display: flex;
	align-items: center;
	justify-content: flex-start;
	margin-bottom: 20px;
}

.botao-retornar {
	display: inline-block;
	text-decoration: none;
	color: #2C3E50;
	margin-right: 15px;
	transition: color 0.3s ease, transform 0.2s ease;
}

.botao-retornar:hover {
	color: #2C3E50;
	transform: scale(1.05);
}

.formulario-entradas {
	display: grid;
	grid-template-columns: 1fr;
	gap: 20px;
}

.formulario-grupo {
	position: relative;
}

label {
	font-weight: bold;
	display: block;
	font-size: 14px;
	margin-bottom: 5px;
	color: #555;
}

.formulario-controle {
	width: 100%;
	padding: 10px;
	border: 1px solid #ddd;
	border-radius: 5px;
	font-size: 14px;
	color: #333;
	transition: border 0.3s, box-shadow 0.3s;
}

.formulario-controle:focus {
	border-color: #2C3E50;
	box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
	outline: none;
}

textarea.formulario-controle {
	resize: vertical;
	height: 100px;
}

select.formulario-controle {
	cursor: pointer;
}

select.formulario-controle:hover {
	border-color: #2C3E50;
	box-shadow: 0 0 8px rgba(0, 123, 255, 0.3);
}

.formulario-botoes {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 10px;
	margin-top: 20px;
}

.botao-limpar, .botao-confirmar {
	padding: 10px 20px;
	font-size: 14px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	transition: background-color 0.3s, transform 0.2s;
}

.botao-limpar {
	background-color: #f5f5f5;
	color: #333;
	transition: background-color 0.3s ease;
}

.botao-limpar:hover {
	background-color: #e0e0e0;
	transform: scale(1.05);
}

.botao-confirmar {
	background-color: #3498DB;
	color: #fff;
	transition: background-color 0.3s ease, transform 0.2s ease;
}

.botao-confirmar:hover {
	background-color: #2C3E50;
	transform: scale(1.05);
}

.botao-limpar:active, .botao-confirmar:active {
	transform: scale(0.98);
}

/* Responsividade */
@media ( max-width : 600px) {
	.formulario-entradas {
		grid-template-columns: 1fr;
	}
	.formulario-botoes {
		grid-template-columns: 1fr;
	}
}
</style>
</head>
<body>


	<main>
		<div class="container-cadastro">
			<div class="cabecalho-cadastro">
				<a href="feed-usuario" class="botao-retornar"> <svg
						width="24" height="25" viewBox="0 0 24 25" fill="none"
						xmlns="http://www.w3.org/2000/svg">
                    <rect x="0.5" y="1" width="23" height="23" rx="3.5"
							stroke="#D0D5DD" />
                    <path d="M14 16.5L10 12.5L14 8.5" stroke="#64748B"
							stroke-width="2" stroke-linecap="round" stroke-linejoin="round" />
                </svg>
				</a>
				<h2>Cadastrar Incidente</h2>
			</div>
			<form action="inserir-incidente" method="post">
				<div class="formulario-entradas">
					<div class="formulario-grupo">
						<label for="titulo">Título</label>
                        <input type="text" id="titulo" name="titulo" class="formulario-controle" placeholder="Escreva o título do incidente..." maxlength="50" required>
					</div>

					<div class="formulario-grupo">
						<label for="descricao">Descrição</label>
						<textarea id="descricao" name="descricao" class="formulario-controle" placeholder="Escreva uma descrição para o seu incidente..." required></textarea>
					</div>

					<div class="formulario-grupo">
						<label for="foto" class="arquivo-foto">Escolha uma foto</label>
                        <input type="file" id="foto" name="foto" class="arquivo-foto" accept="image/*">
					</div>

					<div class="formulario-grupo">
						<label for="usuario">Usuário</label>
                        <input type="text" id="usuario" name="id-usuario" class="formulario-controle" placeholder="Insira o id do autor" maxlength="50" required>
					</div>

					<div class="formulario-grupo">
						<label for="logradouro">Logradouro</label>
						<select id="logradouro" name="id-localidade" class="formulario-controle" required>
							<option value="" disabled selected>Selecione o seu Logradouro</option>
							<c:forEach var="localidade" items="${listaLocalidades}">
								<option value="${localidade.id}">${localidade.cidade},${localidade.bairro},${localidade.logradouro}</option>
							</c:forEach>
						</select>
					</div>

                    <div class="formulario-grupo">
                        <label for="comunidade">Comunidade</label>
                        <select id="comunidade" name="id-comunidade" class="formulario-controle" required>
                            <option value="" disabled selected>Selecione a Comunidade</option>
                            <c:forEach var="comunidade" items="${listaComunidades}">
                                <option value="${comunidade.id}">${comunidade.nome}</option>
                            </c:forEach>
                        </select>
                    </div>

					<div class="formulario-grupo">
						<label for="categoria">Categoria</label>
                        <select id="categoria" name="categoria" class="formulario-controle" required>
							<option value="ENXURRADA">Enxurrada</option>
							<option value="ALAGAMENTO">Alagamento</option>
							<option value="INUNDACAO">Inundação</option>
							<option value="DESLIZAMENTO">Deslizamento</option>
							<option value="DOAÇÃO">Doação</option>
							<option value="RESGATE">Resgate</option>
							<option value="ASSISTÊNCIA">Assistência</option>
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
	</main>
</body>
</html>