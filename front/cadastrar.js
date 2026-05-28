const campos = {
  processador: `
          <div class="input-group">
            <label>Marca:</label>
            <input type="text" name="marca" required />
          </div>
          <div class="input-group">
            <label>Soquete:</label>
            <input type="text" name="soquete" placeholder="AM4, LGA1700..." required />
          </div>`,

  placamae: `
          <div class="input-group">
            <label>Soquete:</label>
            <input type="text" name="soquete" placeholder="AM4, LGA1700..." required />
          </div>
          <div class="input-group">
            <label>DDR:</label>
            <input type="text" name="ddr" placeholder="DDR4, DDR5..." required />
          </div>`,

  ram: `
          <div class="input-group">
            <label>DDR:</label>
            <input type="text" name="ddr" placeholder="DDR4, DDR5..." required />
          </div>
          <div class="input-group">
            <label>Capacidade:</label>
            <input type="text" name="capacidade" placeholder="8GB, 16GB..." required />
          </div>`,

  gpu: `
          <div class="input-group">
            <label>Marca:</label>
            <input type="text" name="marca" required />
          </div>`,

  ssd: `
          <div class="input-group">
            <label>Capacidade:</label>
            <input type="text" name="capacidade" placeholder="240GB, 1TB..." required />
          </div>
          <div class="input-group">
            <label>Tipo:</label>
            <input type="text" name="tipo" placeholder="SATA, NVMe..." required />
          </div>`,

  fonte: `
          <div class="input-group">
            <label>Marca:</label>
            <input type="text" name="marca" required />
          </div>
          <div class="input-group">
            <label>Potência (W):</label>
            <input type="number" name="potencia" placeholder="650, 750..." required />
          </div>`,

  gabinete: `
          <div class="input-group">
            <label>Marca:</label>
            <input type="text" name="marca" required />
          </div>
          <div class="input-group">
            <label>Tipo:</label>
            <input type="text" name="tipo" placeholder="Mini ITX, Mid Tower..." required />
          </div>`,
};

function mudarCampos() {
  const categoria = document.getElementById("categoria").value;
  document.getElementById("campos-extras").innerHTML = campos[categoria] || "";
}

/* FUNÇÃO DE ATUALIZAO SUBSTITUI O ATUALIZAR.JS / HTML A UM ARQUIVO */

async function atualizar() {
  const params = new URLSearchParams(window.location.search);
  const id = params.get("id");
  if (id) {
    document.querySelector("form").action = `../back/cadastro.php?id=${id}`;
  }
  let categoria = params.get("categoria");

  if (!id || !categoria) return;

  const tabelaMap = {
    processador: "Processadores",
    placamae: "PlacaMae",
    ram: "Ram",
    gpu: "GPU",
    ssd: "Ssd",
    fonte: "Fontes",
    gabinete: "Gabinetes",
  };

  const categoriaChave = tabelaMap[categoria.toLowerCase()]
    ? categoria.toLowerCase()
    : categoria;

  const tabelaNome = tabelaMap[categoriaChave];

  document.getElementById("categoria").value = categoriaChave;
  mudarCampos();

  const resposta = await fetch(
    `../back/listar.php?tabela=${tabelaNome}&id=${id}`,
  );

  const dados = await resposta.json();
  const item = dados[0];

  console.log("id:", id);
  console.log("categoria:", categoria);
  console.log("dados:", dados);
  console.log("item:", item);

  document.getElementById("nome").value = item.nome;
  document.getElementById("preco").value = item.preco;
  document.getElementById("descricao").value = item.descricao;

  document.getElementById("foto-atual").value = item.foto;
  document.getElementById("foto").closest(".input-group").style.display =
    "none";
  document.getElementById("foto").removeAttribute("required");

  setTimeout(() => {
    if (item.marca) document.querySelector('[name="marca"]').value = item.marca;
    if (item.soquete)
      document.querySelector('[name="soquete"]').value = item.soquete;
    if (item.ddr) document.querySelector('[name="ddr"]').value = item.ddr;
    if (item.capacidade)
      document.querySelector('[name="capacidade"]').value = item.capacidade;
    if (item.tipo) document.querySelector('[name="tipo"]').value = item.tipo;
    if (item.potencia)
      document.querySelector('[name="potencia"]').value = item.potencia;
  }, 50);
}

atualizar();
