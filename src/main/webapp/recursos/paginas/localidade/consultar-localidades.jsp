<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../componentes/cabecalho.jsp" />
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8" />
<title>Lista de Localidades</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/recursos/css/localidade/localidade.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/recursos/css/geral.css">
</head>
<body>
	<div class="principal">
		<div class="coluna" id="esquerda"><!-- Conteúdo ou espaços laterais --></div>
		<div class="coluna" id="meio">
		<div class="consulta-localidade">
			<h2>Consulta de Localidades</h2>
			<form method="get" action="localidades">
				<input type="text" name="parametro" id="parametro"
					placeholder="Digite o endereço">
				<button type="submit">Pesquisar</button>
			</form>
		</div>
			<c:choose>
				<c:when test="${empty listaLocalidades}">
					<p>Nenhuma localidade encontrada.</p>
				</c:when>
				<c:otherwise>
					<table>
						<thead>
							<tr>
								<th>Estado</th>
								<th>Cidade</th>
								<th>Bairro</th>
								<th>Logradouro</th>
								<th>Funções</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="localidade" items="${listaLocalidades}">
								<tr>
									<td>${localidade.estado}</td>
									<td>${localidade.cidade}</td>
									<td>${localidade.bairro}</td>
									<td>${localidade.logradouro}</td>
									<td class="acoes"><a
										href="editar-localidade?id-localidade=${localidade.id}">Editar<img
											src="" alt="Editar"></a> <a
										href="excluir-localidade?id-localidade=${localidade.id}">Excluir<img
											src="" alt="Excluir"></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="coluna" id="direita"><!-- Conteúdo ou espaços laterais --></div>
	</div>
</body>
</html>