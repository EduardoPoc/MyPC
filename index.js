// buscar dados no banco
let dadosOriginais = [];
async function carregarDados() {
  const resposta = await fetch("back/listar.php");
  dadosOriginais = await resposta.json();

  montarCards(dadosOriginais);
}
function montarCards(listaDados) {
  const container = document.querySelector(".produtos-grid");

  container.innerHTML = "";
  if (listaDados.length === 0) {
    container.innerHTML = "<p>Erro</p>";
    return;
  }
  listaDados.forEach((item) => {
    const card = document.createElement("div");
    card.classList.add("card-main");

    const titulo = document.createElement("p");
    titulo.textContent = item.nome;

    const texto = document.createElement("span");
    texto.textContent = item.email;

    const botao = document.createElement("button");
    botao.classList.add("btn-carrinho");
    botao.textContent = "+ Adicionar";

    botao.onclick = () => {
      const url = `front/atualizar.html?id=${item.id}&nome=${encodeURIComponent(item.nome)}&email=${encodeURIComponent(item.email)}`;

      window.location.href = url;
    };

    const btnDeletar = document.createElement("button");
    btnDeletar.textContent = "- Deletar";
    btnDeletar.onclick = async () => {
      if (confirm(`Deseja deletar ${item.nome}?`)) {
      }
    };

    card.append(titulo, texto, botao, btnDeletar);
  });
}
carregarDados();
