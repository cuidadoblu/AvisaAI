<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AvisaAí - Cadastrar Localidade</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
	<!--<jsp:include page="/componentes/cabecalho.jsp" />-->
    <main>
        <div class="container-cadastro">
            <div class="cabecalho-cadastro">
                <h2>Cadastrar Localidade</h2>
            </div>
            <form action="inserir-localidade" method="post">
                <div class="formulario-entradas">
                    <div class="formulario-grupo">
                        <label for="estado">Estado</label>
                        <input type="text" id="estado" name="estado" list="estados" placeholder="Digite o estado" required>
                        <datalist id="estados">
                            <option value="Santa Catarina">
                        </datalist>
                    </div>

                    <div class="formulario-grupo">
                        <label for="cidade">Cidade</label>
                        <input type="text" id="cidade" name="cidade" list="cidades" placeholder="Digite a cidade" required>
                        <datalist id="cidades">
                            <option value="Blumenau">
                        </datalist>
                    </div>

                    <div class="formulario-grupo">
                        <label for="bairro">Bairro</label>
                        <input type="text" id="bairro" name="bairro" list="bairros" placeholder="Digite o bairro" required>
                        <datalist id="bairros">
                            <option value="Água Verde">
                            <option value="Asilo">
                            <option value="Badenfurt">
                            <option value="Bom Retiro">
                            <option value="Boa Vista">
                            <option value="Centro">
                            <option value="Da Glória">
                            <option value="Do Salto">
                            <option value="Escola Agrícola">
                            <option value="Fortaleza">
                            <option value="Fortaleza Alta">
                            <option value="Garcia">
                            <option value="Itoupava Central">
                            <option value="Itoupava Norte">
                            <option value="Itoupava Rega">
                            <option value="Itoupava Seca">
                            <option value="Jardim Blumenau">
                            <option value="Jardim Europa">
                            <option value="Ponta Aguda">
                            <option value="Progresso">
                            <option value="Ribeirão Fresco">
                            <option value="Ribeirão da Velha">
                            <option value="Salto Weissbach">
                            <option value="Testo Salto">
                            <option value="Valparaíso">
                            <option value="Velha">
                            <option value="Velha Central">
                            <option value="Velha Grande">
                            <option value="Vila Formosa">
                            <option value="Vila Itoupava">
                            <option value="Vorstadt">
                        </datalist>                        
                    </div>

                    <div class="formulario-grupo">
                        <label for="tipo">Tipo</label>
                        <input type="text" id="tipo" name="tipo" list="tipos" placeholder="Selecione o tipo" required>
                        <datalist id="tipos">
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
                        </datalist>
                    </div>

                    <div class="formulario-grupo">
                        <label for="logradouro">Logradouro</label>
                        <input type="text" id="logradouro" name="logradouro" placeholder="Escreva o logradouro..." maxlength="30" required>
                    </div>

                    <div class="formulario-grupo">
                        <label for="numero">Número</label>
                        <input type="number" id="numero" name="numero" placeholder="Número da residência..." required>
                    </div>

                    <div class="formulario-grupo">
                        <label for="complemento">Complemento</label>
                        <input type="text" id="complemento" name="complemento" placeholder="Escreva o complemento..." maxlength="30">
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