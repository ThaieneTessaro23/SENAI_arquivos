/* ==========================================================================
   SERVICE WORKER - FROTACHECK
   Garante o funcionamento 100% offline (Cache API)
   ========================================================================== */

const CACHE_NAME = 'frotacheck-v1';
const ASSETS = [
  './',
  './index.html',
  './veiculos.html',
  './checklist.html',
  './historico.html',
  './style.css',
  './app.js'
];

// Instalação e armazenamento no cache
self.addEventListener('install', (e) => {
  e.waitUntil(
    caches.open(CACHE_NAME).then((cache) => {
      console.log('[SW] Armazenando recursos no cache...');
      return cache.addAll(ASSETS);
    })
  );
  self.skipWaiting();
});

// Ativação e limpeza de caches antigos
self.addEventListener('activate', (e) => {
  e.waitUntil(
    caches.keys().then((keys) => {
      return Promise.all(
        keys.map((key) => {
          if (key !== CACHE_NAME) {
            return caches.delete(key);
          }
        })
      );
    })
  );
  self.clients.claim();
});

// Interceptação de requisições (Estratégia Cache First)
self.addEventListener('fetch', (e) => {
  e.respondWith(
    caches.match(e.request).then((cachedResponse) => {
      if (cachedResponse) {
        return cachedResponse;
      }
      return fetch(e.request).catch(() => {
        // Se a requisição falhar (offline), tenta retornar a página principal
        if (e.request.mode === 'navigate') {
          return caches.match('./index.html');
        }
      });
    })
  );
});