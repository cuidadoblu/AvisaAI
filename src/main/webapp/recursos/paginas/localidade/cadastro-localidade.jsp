<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:include page="../componentes/cabecalho.jsp" />
<jsp:include page="../componentes/popup.jsp" />
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>AvisaAí - Cadastrar Localidade</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/recursos/css/localidade/localidade.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/recursos/css/geral.css">

</head>
<body>
	<main>
		<div class="principal">
			<div class="coluna" id="esquerda">Esquerda</div>
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
						<h2>Cadastrar Localidade</h2>
					</div>
					<form action="inserir-localidade" method="post">
						<div class="formulario-entradas">
							<div class="formulario-grupo">
								<label for="estado">Estado</label> <input type="text"
									id="estado" name="estado" class="formulario-controle"
									list="estados" placeholder="Digite o estado" required />
								<datalist id="estados">
									<c:if test="${not empty estados}">
										<c:forEach var="estado" items="${estados}">
											<option value="${estado}"></option>
										</c:forEach>
									</c:if>
								</datalist>
							</div>

							<div class="formulario-grupo">
								<label for="cidade">Cidade</label> <input type="text"
									id="cidade" name="cidade" class="formulario-controle"
									list="cidades" placeholder="Digite a cidade" required />
								<datalist id="cidades"></datalist>
							</div>

							<div class="formulario-grupo">
								<label for="bairro">Bairro</label> <input type="text"
									id="bairro" name="bairro" class="formulario-controle"
									list="bairros" placeholder="Digite o bairro" required />
								<datalist id="bairros"></datalist>
							</div>

							<div class="formulario-grupo">
								<label for="tipo">Tipo</label> <select id="tipo" name="tipo"
									class="formulario-controle" required>
									<option value="Rua">Rua</option>
									<option value="Avenida">Avenida</option>
									<option value="Praça">Praça</option>
									<option value="Travessa">Travessa</option>
									<option value="Alameda">Alameda</option>
									<option value="Rodovia">Rodovia</option>
									<option value="Viela">Viela</option>
									<option value="Largo">Largo</option>
									<option value="Estrada">Estrada</option>
									<option value="Caminho">Caminho</option>
									<option value="Beco">Beco</option>
									<option value="Passagem">Passagem</option>
									<option value="Servidão">Servidão</option>
									<option value="Via">Via</option>
									<option value="Passeio">Passeio</option>
									<option value="Parque">Parque</option>
								</select>
							</div>

							<div class="formulario-grupo">
								<label for="logradouro">Logradouro</label> <input type="text"
									id="logradouro" name="logradouro" class="formulario-controle"
									list="logradouros" placeholder="Digite o logradouro" required />
								<datalist id="logradouros"></datalist>
							</div>

							<div class="formulario-grupo">
								<label for="numero">Número</label> <input type="number"
									id="numero" name="numero" class="formulario-controle"
									placeholder="número" required />
							</div>

							<div class="formulario-grupo">
								<label for="complemento">Complemento</label> <input type="text"
									id="complemento" name="complemento" class="formulario-controle"
									placeholder="Escreva o complemento..." maxlength="30" />
							</div>

							<div class="formulario-botoes">
								<button type="reset" class="botao-limpar">Limpar</button>
								<button type="submit" class="botao-confirmar">Confirmar</button>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="coluna" id="direita">Direita</div>
		</div>
	</main>

	<script>
    document.addEventListener("DOMContentLoaded", () => {

        <c:if test="${not empty mensagemPopup}">
        mostrarPopup("${mensagemPopup}", "#4caf50", 4000);
        </c:if>

        carregarCidades();

        async function carregarCidades() {
            try {
                const response = await fetch('buscarCidades');
                const cidades = await response.json();
                const cidadeDatalist = document.getElementById('cidades');
                cidades.forEach(cidade => {
                    const option = document.createElement('option');
                    option.value = cidade;
                    cidadeDatalist.appendChild(option);
                });
            } catch (error) {
                console.error('Erro ao carregar cidades:', error);
            }
        }
    });

    document.getElementById('cidade').addEventListener('input', async function () {

        const cidade = this.value;
        const bairroDatalist = document.getElementById('bairros');

        if (cidade) {
            try {
                const response = await fetch('buscarBairros?cidade=' + encodeURIComponent(cidade));
                const bairros = await response.json();
                bairroDatalist.innerHTML = '';
                bairros.forEach(bairro => {
                    const option = document.createElement('option');
                    option.value = bairro;
                    bairroDatalist.appendChild(option);
                });
            } catch (error) {
                console.error('Erro ao carregar bairros:', error);
            }
        }
    });

    document.getElementById('bairro').addEventListener('input', async function () {

        const bairro = this.value;
        const logradouroDatalist = document.getElementById('logradouros');

        if (bairro) {
            try {
                const response = await fetch('buscarLogradouros?bairro=' + encodeURIComponent(bairro));
                const logradouros = await response.json();
                logradouroDatalist.innerHTML = '';
                logradouros.forEach(logradouro => {
                    const option = document.createElement('option');
                    option.value = logradouro;
                    logradouroDatalist.appendChild(option);
                });
            } catch (error) {
                console.error('Erro ao carregar logradouros:', error);
            }
        }
    });
</script>
</body>
</html>