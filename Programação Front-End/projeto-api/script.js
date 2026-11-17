const API_URL = "https://api.thedogapi.com/v1";
const API_KEY = "DEMO-API-KEY";

const breedInput = document.querySelector("#breedInput");
const searchBtn = document.querySelector("#searchBtn");
const randomBtn = document.querySelector("#randomBtn");
const clearBtn = document.querySelector("#clearBtn");
const message = document.querySelector("#message");
const results = document.querySelector("#results");

function setMessage(text = "", type = "") {
  message.textContent = text;
  message.className = `message ${type}`;
}

function setLoading(loading) {
  searchBtn.disabled = loading;
  randomBtn.disabled = loading;
  searchBtn.textContent = loading ? "Consultando..." : "Pesquisar";
}

function formatValue(value) {
  return value && String(value).trim() ? value : "Não informado";
}

function showDog(dog) {
  const breed = dog.breeds?.[0];

  if (!breed) {
    throw new Error("A API retornou um cão sem informações de raça.");
  }

  const weight = breed.weight
    ? `${formatValue(breed.weight.metric)} kg`
    : "Não informado";

  const height = breed.height
    ? `${formatValue(breed.height.metric)} cm`
    : "Não informado";

  results.innerHTML = `
    <article class="card">
      <img class="card-image"
           src="${dog.url}"
           alt="Foto de ${breed.name || "cão"}"
           onerror="this.alt='Imagem indisponível'; this.style.display='none';">
      <div class="card-content">
        <h2>${formatValue(breed.name)}</h2>
        <p class="temperament">
          <strong>Temperamento:</strong>
          ${formatValue(breed.temperament)}
        </p>

        <div class="info-grid">
          <div class="info">
            <strong>Origem</strong>
            <span>${formatValue(breed.origin)}</span>
          </div>
          <div class="info">
            <strong>Expectativa de vida</strong>
            <span>${formatValue(breed.life_span)} anos</span>
          </div>
          <div class="info">
            <strong>Peso</strong>
            <span>${weight}</span>
          </div>
          <div class="info">
            <strong>Altura</strong>
            <span>${height}</span>
          </div>
        </div>
      </div>
    </article>
  `;
}

async function fetchBreeds(searchTerm = "") {
  const url = searchTerm
    ? `${API_URL}/breeds/search?q=${encodeURIComponent(searchTerm)}`
    : `${API_URL}/breeds`;

  const response = await fetch(url, {
    headers: {
      "x-api-key": API_KEY
    }
  });

  if (!response.ok) {
    throw new Error(`Erro HTTP ${response.status}`);
  }

  return await response.json();
}

async function fetchDogImage(breedId) {
  const response = await fetch(
    `${API_URL}/images/search?breed_ids=${encodeURIComponent(breedId)}&limit=1`,
    {
      headers: {
        "x-api-key": API_KEY
      }
    }
  );

  if (!response.ok) {
    throw new Error(`Erro HTTP ${response.status}`);
  }

  const data = await response.json();

  if (!Array.isArray(data) || data.length === 0) {
    throw new Error("Não foi encontrada uma imagem para essa raça.");
  }

  return data[0];
}

async function searchBreed() {
  const term = breedInput.value.trim();

  if (!term) {
    setMessage("Digite o nome de uma raça antes de pesquisar.", "error");
    results.innerHTML = "";
    breedInput.focus();
    return;
  }

  setLoading(true);
  setMessage("Consultando a API...");
  results.innerHTML = "";

  try {
    const breeds = await fetchBreeds(term);

    if (!Array.isArray(breeds) || breeds.length === 0) {
      throw new Error("Raça não encontrada. Tente outro nome.");
    }

    const breed = breeds[0];
    const image = await fetchDogImage(breed.id);

    showDog({
      ...image,
      breeds: [breed]
    });

    setMessage(`Resultado encontrado: ${breed.name}.`, "success");
  } catch (error) {
    console.error(error);
    setMessage(
      error.message || "Não foi possível realizar a consulta.",
      "error"
    );
    results.innerHTML = "";
  } finally {
    setLoading(false);
  }
}

async function randomDog() {
  setLoading(true);
  setMessage("Sorteando um cão...");
  results.innerHTML = "";

  try {
    const response = await fetch(
      `${API_URL}/images/search?has_breeds=true&limit=1`,
      {
        headers: {
          "x-api-key": API_KEY
        }
      }
    );

    if (!response.ok) {
      throw new Error(`Erro HTTP ${response.status}`);
    }

    const data = await response.json();

    if (!Array.isArray(data) || data.length === 0 || !data[0].breeds?.length) {
      throw new Error("A API não retornou um cão com dados de raça.");
    }

    showDog(data[0]);
    setMessage("Cão sorteado com sucesso!", "success");
  } catch (error) {
    console.error(error);
    setMessage(
      error.message || "Não foi possível sortear um cão.",
      "error"
    );
  } finally {
    setLoading(false);
  }
}

function clearSearch() {
  breedInput.value = "";
  results.innerHTML = "";
  setMessage("");
  breedInput.focus();
}

searchBtn.addEventListener("click", searchBreed);
randomBtn.addEventListener("click", randomDog);
clearBtn.addEventListener("click", clearSearch);

breedInput.addEventListener("keydown", (event) => {
  if (event.key === "Enter") {
    searchBreed();
  }
});

setMessage("Pesquise uma raça ou use “Cão aleatório” para começar.");
