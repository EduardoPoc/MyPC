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
