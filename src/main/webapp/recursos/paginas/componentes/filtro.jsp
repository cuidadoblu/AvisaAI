<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/recursos/css/componentes/filtro.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/recursos/css/geral.css">

<!-- Botão de Filtrar -->
<button id="botao-filtrar" class="botao-filtrar"
	onclick="alternarFiltro()">
	<img class="filtro-imagem"
		src="${pageContext.request.contextPath}/recursos/imagens/icones/incidente/filtro.svg"
		alt="Foto de "> Filtrar
</button>

<!-- Filtros Container -->
<div id="filtros-container" class="filtros-container"
	style="display: none;">
	<form action="filtrarResultados" method="get">
		<div class="header">
			<h2>Filtros</h2>
			<button type="reset" class="limpar">Limpar Filtros</button>
			<!-- Botão Fechar -->
			<button type="button" class="fechar" onclick="alternarFiltro()">×</button>
		</div>
		<!-- Conteúdo do Filtro -->
		<div class="campo">
			<label for="logradouro">Logradouro</label> <select id="logradouro"
				name="id-localidade" class="formulario-controle">
				<option value="" disabled selected>Selecione o seu
					Logradouro</option>
				<c:forEach var="localidade" items="${listaLocalidades}">
					<option value="${localidade.id}">${localidade.cidade},${localidade.bairro},${localidade.logradouro}</option>
				</c:forEach>
			</select>
		</div>

		<div class="campo">
			<label>Situação</label>
			<div class="toggle-container">
				<div class="slider"></div>
				<button type="button" id="btn-ativo" class="toggle-option ativo">Ativo</button>
				<button type="button" id="btn-finalizado" class="toggle-option">Finalizado</button>
				<input type="hidden" id="situacao" name="situacao" value="ativo">
			</div>
		</div>

		<div class="campo">
			<label for="categoria">Categoria</label> <select id="categoria"
				name="categoria" class="formulario-controle">
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

		<div class="campo">
			<label for="comunidade">Comunidade</label> <select id="comunidade"
				name="id-comunidade" class="formulario-controle">
				<option value="" disabled selected>Selecione a Comunidade</option>
				<c:forEach var="comunidade" items="${listaComunidades}">
					<option value="${comunidade.id}">${comunidade.nome}</option>
				</c:forEach>
			</select>
		</div>

		<div class="campo">
			<label>Data</label>
			<div class="data">
				<input type="date" id="dataDe" name="dataDe" placeholder="De">
				<input type="date" id="dataAte" name="dataAte" placeholder="Até">
			</div>
		</div>

		<div class="campo">
			<button type="submit" class="confirmar">Confirmar</button>
		</div>
	</form>
</div>

<script>
       const btnAtivo = document.getElementById('btn-ativo');
       const btnFinalizado = document.getElementById('btn-finalizado');
       const situacaoInput = document.getElementById('situacao');
       const slider = document.querySelector('.slider');

       btnAtivo.addEventListener('click', () => {
           btnAtivo.classList.add('ativo');
           btnFinalizado.classList.remove('ativo');
           situacaoInput.value = 'ativo';

           slider.style.transform = 'translateX(0)';
       });

       btnFinalizado.addEventListener('click', () => {
           btnFinalizado.classList.add('ativo');
           btnAtivo.classList.remove('ativo');
           situacaoInput.value = 'finalizado';

           slider.style.transform = 'translateX(100%)';
       });
       
       function alternarFiltro() {
    	    const filtrosContainer = document.getElementById('filtros-container');
    	    const botaoFiltrar = document.getElementById('botao-filtrar');

    	    if (filtrosContainer.style.display === 'none' || filtrosContainer.style.display === '') {
    	        filtrosContainer.style.display = 'block'; // Mostra o container
    	        botaoFiltrar.style.display = 'none'; // Oculta o botão "Filtrar"
    	    } else {
    	        filtrosContainer.style.display = 'none'; // Esconde o container
    	        botaoFiltrar.style.display = 'inline-block'; // Mostra o botão "Filtrar"
    	    }
    	}
   </script>
</body>
</html>
