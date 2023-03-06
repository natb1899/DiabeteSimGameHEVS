'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "favicon.png": "5dcef449791fa27946b3d35ad8803796",
"manifest.json": "0fbba2073a2c93c52934c8e4e19c4e55",
"version.json": "90b39a2f4b098c91f9401ae812c685a9",
"canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"assets/FontManifest.json": "f51cab0c6f2f597c568e9cbe061ec6e7",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/assets/audio/birthofahero.mp3": "f36273a6016f97ffa8e67f04df158259",
"assets/assets/audio/perception.mp3": "d35879fcbfe1b1baf870a502d428307a",
"assets/assets/audio/happyrock.mp3": "80276ac2e9b80cdde919b3c40b4a79cc",
"assets/assets/audio/smallguitar.mp3": "4eebc12f1d7a82249ff2220bf1de910c",
"assets/assets/audio/onceagain.mp3": "b7303a025fee4c52c32f735833b2bbfa",
"assets/assets/audio/smile.mp3": "aa215fb189f37b14d6777c115b43b70d",
"assets/assets/audio/goinghigher.mp3": "2057ee6b687b56fb853af3b3574711cf",
"assets/assets/audio/highoctane.mp3": "a47178461135a796005f17700ea7fadc",
"assets/assets/audio/ukulele.mp3": "9569869286a4e88efa8724d24f50bf47",
"assets/assets/audio/endlessmotion.mp3": "b6df2d07665c3415f421857df2a68598",
"assets/assets/audio/slowmotion.mp3": "e0e75e5b7f2eaa57ab39b3a6e5a40f0b",
"assets/assets/audio/adventure.mp3": "d470b79f97de680743b51915f6dd788b",
"assets/assets/audio/funday.mp3": "feae87868e1c7404583ec0ef2bd9d779",
"assets/assets/audio/hipjazz.mp3": "d11e76f4d0b724dbdf9edcc48a87dd66",
"assets/assets/tiles/hopital_Interior.tmx": "a3b2300391be080bf9a6e35fba952994",
"assets/assets/tiles/brocoli_chamber.tmx": "be5956e50ee53251d753363c83432719",
"assets/assets/tiles/tiles_sets/bigChest.tsx": "190660f0554755d290601ac0a0f26847",
"assets/assets/tiles/tiles_sets/moutarde_home.tsx": "6f96f5b30d7e8c62019ccec37663f55f",
"assets/assets/tiles/tiles_sets/salle%2520de%2520classe.tsx": "75c6fa9cf380eae07d15dc9ceb78de9c",
"assets/assets/tiles/tiles_sets/hospitalScene_wbg.tsx": "cc3b41bf6041830393320325619d9dca",
"assets/assets/tiles/tiles_sets/joueur.tsx": "ed7bd06a31961b7257b1ad58b31a624f",
"assets/assets/tiles/tiles_sets/ami%2520positif.tsx": "bd6768e5a000540fe5b4a952846b8b1e",
"assets/assets/tiles/tiles_sets/hopital.tsx": "05ff7f30dd374414314f887629e46e1b",
"assets/assets/tiles/tiles_sets/Pokemon_mew.tsx": "72f2e7475d62be1d5246df89f0849385",
"assets/assets/tiles/tiles_sets/village.tsx": "c1e495e92bd80c1fbed80fd6bcf2be13",
"assets/assets/tiles/tiles_sets/cantine.tsx": "e4d6b3b3365eb0d1aed3753980fcc2fc",
"assets/assets/tiles/moutarde_home.tmx": "4118e9a8aa8680dc40e22939bf833690",
"assets/assets/tiles/brocoli_home.tmx": "62f61617bd6b4f703826496b9096bce2",
"assets/assets/tiles/villageCMS.tmx": "1d3f56be2bb1296495d47d29a91eb5b2",
"assets/assets/tiles/outside_hospital.tmx": "6effba74dd4338361788e66610b87a5a",
"assets/assets/images/contacts/medecin.png": "932987b7b826eb87150a4029901f2098",
"assets/assets/images/contacts/urgence.png": "992e95c4082a9d81912e189ba374f53c",
"assets/assets/images/contacts/tabacologue.png": "b21edd166cdc7ff4bcb873acb10c5e23",
"assets/assets/images/contacts/dieteticiene.png": "03ae2ce5175a744b32f431cc783fdc5c",
"assets/assets/images/contacts/physio.png": "e0e56db0368df7d6866d7c6fbe4ef3e6",
"assets/assets/images/contacts/infirmiere.png": "f823987cbfd1efedb79016324ae644d4",
"assets/assets/images/gameObjects/bigChest.png": "761e8df8a403ee9b172773a267be48bf",
"assets/assets/images/gameObjects/bag.png": "d977c83253d8c7f0a6ebb0cd22aa8db3",
"assets/assets/images/changeScene/nightAmbulanceScene.png": "d0015da495bd6bbac619c6e8a7a5ed93",
"assets/assets/images/badges/typeDiabete.png": "3741f4adb2a23f65496a3004c084958d",
"assets/assets/images/badges/complicationDiabete.png": "d6eab908120bc8706a6ca58f519661ff",
"assets/assets/images/sprite/joueur.png": "8ff5485c4fd1e51811cac9ceeca44162",
"assets/assets/images/sprite/ami%2520positif.png": "8bedcfff998c15173473cde4305b675e",
"assets/assets/images/sprite/hospitalScene_wbg.png": "ce35e256a39a9f9a0a2dda707ac3f04c",
"assets/assets/images/sprite/village.png": "8ff5485c4fd1e51811cac9ceeca44162",
"assets/assets/images/sprite/hopital.png": "a62064953cbb24821ee184216503de09",
"assets/assets/images/sprite/Pokemon_mew_d%25C3%25A9coup%25C3%25A9.png": "9d638a4d8211c006c18a42c1e569c507",
"assets/assets/images/sprite/salle%2520de%2520classe.png": "1d862021c5337c166527bf1aa5e4d242",
"assets/assets/images/sprite/cantine.png": "501409d5c1992283ab79ce5713922a4b",
"assets/assets/images/people/player48x48.png": "55ce9310cfde20419f1d02a2165cc6ea",
"assets/assets/images/people/guy0248x48.png": "4706e28d862dee2a1783563c474ee06b",
"assets/assets/images/people/brocoliOne.png": "04f4b985b1a55794161913eb6460047b",
"assets/assets/images/people/guy0148x48.png": "7d1e7f6ab7a7c5293174531095a82e0e",
"assets/assets/images/people/nurse0148x48.png": "41baea24724651a19ca4d21d6057dc1d",
"assets/assets/images/people/brocoliSon48x48.png": "31fbec3a31690bbd45045f6ede13dbc6",
"assets/assets/images/people/user32x32.png": "3dfdf3d7e8858c26493899277841048f",
"assets/assets/images/people/moutarde48x48.png": "6456eb5dd2631e02957af96ca40d1fff",
"assets/assets/images/people/brocoliSon32x32.png": "df3f19ba2161f48a8658526680c104a7",
"assets/assets/images/people/brocoli48x48.png": "1ef53323fa91a173fa31b3a8975a31e0",
"assets/assets/images/people/brocoli32x32.png": "1b3489d3144a51a3dd21150fbe3a85e1",
"assets/assets/images/medicalTools/tensiometre.png": "f596f3b1d46ebc4dcfcd1db2761a5e56",
"assets/assets/images/medicalTools/stethoscope.png": "fdb7e9c90803c734d44aed8346df9507",
"assets/assets/images/medicalTools/glycometre.png": "baca41719234d44dd21636aa4cbf4842",
"assets/assets/images/medicalTools/thermometre.png": "22d022a0f5f8bdb5c9eb60b605632b9c",
"assets/assets/images/medicalTools/pulsoxymetre.png": "495fa108aabab9dd4947b2c41a5c765d",
"assets/assets/images/medicalTools/insuline.png": "438051447e6ac1b6d2b0e52b8934fbde",
"assets/assets/fonts/pixel_sans_serif.ttf": "e4f46b0b7d59ea0d679253c472632698",
"assets/assets/fonts/novem.ttf": "9b2847883cca1f856c2b49a7d795a9a3",
"assets/assets/fonts/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"assets/assets/fonts/Montserrat-Bold.ttf": "ade91f473255991f410f61857696434b",
"assets/NOTICES": "3bd5bc4b6c6b4503e6d4c2b0c8086974",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/AssetManifest.json": "552d6d0a03cbcdcf81d6cb80e8be2700",
"index.html": "ce4f8549b9b163bd4348406c1aebc2b0",
"/": "ce4f8549b9b163bd4348406c1aebc2b0",
"main.dart.js": "e8075027f652bdb8349bb6e3e8dd7b50",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1"
};

// The application shell files that are downloaded before a service worker can
// start.
const CORE = [
  "main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];
// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});

// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});

// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});

self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});

// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}

// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
