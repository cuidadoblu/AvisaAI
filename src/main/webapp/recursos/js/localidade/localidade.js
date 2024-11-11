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