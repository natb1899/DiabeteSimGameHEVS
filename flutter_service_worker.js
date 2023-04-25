'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';
const RESOURCES = {
  "canvaskit/canvaskit.js": "97937cb4c2c2073c968525a3e08c86a3",
"canvaskit/profiling/canvaskit.js": "c21852696bc1cc82e8894d851c01921a",
"canvaskit/profiling/canvaskit.wasm": "371bc4e204443b0d5e774d64a046eb99",
"canvaskit/canvaskit.wasm": "3de12d898ec208a5f31362cc00f09b9e",
"index.html": "730811fa62dd5ca828c12bf8a6f8d7cf",
"/": "730811fa62dd5ca828c12bf8a6f8d7cf",
"main.dart.js": "c0be3ae808d9336c0aa606cb90c07f42",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"manifest.json": "0fbba2073a2c93c52934c8e4e19c4e55",
"flutter.js": "a85fcf6324d3c4d3ae3be1ae4931e9c5",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"version.json": "90b39a2f4b098c91f9401ae812c685a9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "6d342eb68f170c97609e9da345464e5e",
"assets/fonts/MaterialIcons-Regular.otf": "e7069dfd19b331be16bed984668fe080",
"assets/FontManifest.json": "f51cab0c6f2f597c568e9cbe061ec6e7",
"assets/NOTICES": "8dc1cdd7e5b2a50638430c7fefbc09fa",
"assets/AssetManifest.json": "7ff78e9ef7f65aa638a5332de36c96f7",
"assets/assets/tiles/outside_hospital.tmx": "7387cdabfb20770abdeeeeb13f0a7271",
"assets/assets/tiles/choux_chamber.tmx": "447a458376143d750e5e8efc1777dc26",
"assets/assets/tiles/tiles_sets/village.tsx": "7e495f9c6505ac479d89688a344b108e",
"assets/assets/tiles/tiles_sets/Room_Builder_16x16.tsx": "5ed7a1a0bdd9aff506cddb9965bf59da",
"assets/assets/tiles/tiles_sets/hopital.tsx": "f85ae225287363e4283522f88ff95104",
"assets/assets/tiles/tiles_sets/moutarde_home.tsx": "5677ccee7fe62d717ea6fb07cedecdec",
"assets/assets/tiles/tiles_sets/Pokemon_mew.tsx": "96a31108ca8d62769c8b305ff757cd21",
"assets/assets/tiles/tiles_sets/cantine.tsx": "faaad8bbee97b4958cd1c8c04a15953e",
"assets/assets/tiles/tiles_sets/bigChest.tsx": "190660f0554755d290601ac0a0f26847",
"assets/assets/tiles/tiles_sets/joueur.tsx": "ee95fa93f37b77db0d110a2d6a4e2b85",
"assets/assets/tiles/tiles_sets/salle%2520de%2520classe.tsx": "57bd64b384a4534e78f819ae1f1e1afc",
"assets/assets/tiles/tiles_sets/hospitalScene_wbg.tsx": "cc3b41bf6041830393320325619d9dca",
"assets/assets/tiles/tiles_sets/ami%2520positif.tsx": "2b7ce394119609b61e39d9dae81a64a9",
"assets/assets/tiles/tiles_sets/Interiors_16x16.tsx": "bf2bdde200852f99ac627b207933ef16",
"assets/assets/tiles/myrtille_home.tmx": "af91ee4cbc9e5d7961f6122c3f76df3e",
"assets/assets/tiles/apricot_chamber.tmx": "2bc8f9fad29bd861ae457793faf33b8e",
"assets/assets/tiles/brocoli_home.tmx": "62f61617bd6b4f703826496b9096bce2",
"assets/assets/tiles/villageCMS.tmx": "21c5540441ccb0f7e03b605574de7ad1",
"assets/assets/tiles/brocoli_chamber.tmx": "bf311c4eb537f73cca36dcefad6e3453",
"assets/assets/tiles/nurse_office.tmx": "738c4d74229f612e0547478c4300e3cf",
"assets/assets/tiles/hopital_Interior.tmx": "e9bdd30dfffd5f79e49e94ac752e05eb",
"assets/assets/tiles/moutarde_home.tmx": "4118e9a8aa8680dc40e22939bf833690",
"assets/assets/tiles/fraiseux_chamber.tmx": "d7c40f968c4977a128d9deaab2252fdd",
"assets/assets/fonts/Roboto-Regular.ttf": "8a36205bd9b83e03af0591a004bc97f4",
"assets/assets/fonts/pixel_sans_serif.ttf": "e4f46b0b7d59ea0d679253c472632698",
"assets/assets/fonts/novem.ttf": "9b2847883cca1f856c2b49a7d795a9a3",
"assets/assets/fonts/Montserrat-Bold.ttf": "ade91f473255991f410f61857696434b",
"assets/assets/images/gameObjects/sports-club-magazine.png": "6805db77ff34c3377fc8596f1851b4c3",
"assets/assets/images/gameObjects/trolley.png": "b5b39df6154211cb30cc1d15849c9698",
"assets/assets/images/gameObjects/sports-club-magazine.psd": "c52f5d0fd9a35dab6713cb4c7ebba382",
"assets/assets/images/gameObjects/trolley.psd": "915da3ea6bcefc8313df098f1cdc7ec8",
"assets/assets/images/gameObjects/marlboro.psd": "bd1aac4b4283efebe367fd2db1f529a9",
"assets/assets/images/gameObjects/sports-club-magazine-small.png": "c87bee5a60f0aca9afe8555aef30f99d",
"assets/assets/images/gameObjects/speech_bubble.png": "c7d7b820b99765aad5e28ff9a53252ab",
"assets/assets/images/gameObjects/marlboro.png": "9dfe820986a47781f137e0038cc2f31a",
"assets/assets/images/gameObjects/bag.png": "d977c83253d8c7f0a6ebb0cd22aa8db3",
"assets/assets/images/gameObjects/milk-chocolate.psd": "645b1d8de07dd3408bcfc54afa17113e",
"assets/assets/images/gameObjects/bigChest.png": "761e8df8a403ee9b172773a267be48bf",
"assets/assets/images/gameObjects/milk-chocolate.png": "d1d65383f6ec3189b9e2076cd762e683",
"assets/assets/images/gameObjects/marlboro-small.png": "966ce9f997e78fbd1d196a50ce5483dd",
"assets/assets/images/gameObjects/cellphone.png": "4e71ab022e6cb5df23f7fe3f4e1e97b1",
"assets/assets/images/sprite/cantine.png": "501409d5c1992283ab79ce5713922a4b",
"assets/assets/images/sprite/amipositif.png": "ec4698c47dbf9508623d1c6ab3f67920",
"assets/assets/images/sprite/Interiors_free_16x16.png": "d20d4c12fe050c16ee3dde25efaa8fde",
"assets/assets/images/sprite/Pokemon_mew_decoupe.png": "9d638a4d8211c006c18a42c1e569c507",
"assets/assets/images/sprite/joueur.png": "8ff5485c4fd1e51811cac9ceeca44162",
"assets/assets/images/sprite/Room_Builder_free_16x16.png": "ca8f23f05a4c46665acf81211bcc38d6",
"assets/assets/images/sprite/hospitalScene_wbg.png": "ce35e256a39a9f9a0a2dda707ac3f04c",
"assets/assets/images/sprite/village.png": "8ff5485c4fd1e51811cac9ceeca44162",
"assets/assets/images/sprite/hopital.png": "a62064953cbb24821ee184216503de09",
"assets/assets/images/sprite/salledeclasse.png": "1d862021c5337c166527bf1aa5e4d242",
"assets/assets/images/medicalTools/tensiometre.png": "f596f3b1d46ebc4dcfcd1db2761a5e56",
"assets/assets/images/medicalTools/pulsoxymetre.png": "495fa108aabab9dd4947b2c41a5c765d",
"assets/assets/images/medicalTools/stethoscope.png": "fdb7e9c90803c734d44aed8346df9507",
"assets/assets/images/medicalTools/glycometre.png": "baca41719234d44dd21636aa4cbf4842",
"assets/assets/images/medicalTools/insuline.png": "438051447e6ac1b6d2b0e52b8934fbde",
"assets/assets/images/medicalTools/thermometre.png": "22d022a0f5f8bdb5c9eb60b605632b9c",
"assets/assets/images/badges/typeDiabete.png": "3741f4adb2a23f65496a3004c084958d",
"assets/assets/images/badges/complicationDiabete.png": "d6eab908120bc8706a6ca58f519661ff",
"assets/assets/images/contacts/urgence.png": "992e95c4082a9d81912e189ba374f53c",
"assets/assets/images/contacts/infirmiere.png": "f823987cbfd1efedb79016324ae644d4",
"assets/assets/images/contacts/physio.png": "e0e56db0368df7d6866d7c6fbe4ef3e6",
"assets/assets/images/contacts/tabacologue.png": "b21edd166cdc7ff4bcb873acb10c5e23",
"assets/assets/images/contacts/medecin.png": "932987b7b826eb87150a4029901f2098",
"assets/assets/images/contacts/dieteticiene.png": "03ae2ce5175a744b32f431cc783fdc5c",
"assets/assets/images/changeScene/nightAmbulanceScene.png": "d0015da495bd6bbac619c6e8a7a5ed93",
"assets/assets/images/people/nurse0148x48.png": "41baea24724651a19ca4d21d6057dc1d",
"assets/assets/images/people/brocoliSon32x32.png": "df3f19ba2161f48a8658526680c104a7",
"assets/assets/images/people/myrtille48x48.png": "64ea99d85194c05db0eb9ef6b25edf09",
"assets/assets/images/people/brocoli48x48.png": "1ef53323fa91a173fa31b3a8975a31e0",
"assets/assets/images/people/user32x32.png": "3dfdf3d7e8858c26493899277841048f",
"assets/assets/images/people/assc48x48.png": "e8edad7b61729a85d1b988c9c949390b",
"assets/assets/images/people/nurseDiabetes48x48.png": "67715a08e41dcc8f8d94ccd2a2103bc6",
"assets/assets/images/people/husbandMyrtille48x48.png": "bbb5b43fa41211213977375aa557abbe",
"assets/assets/images/people/moutarde48x48.png": "6456eb5dd2631e02957af96ca40d1fff",
"assets/assets/images/people/mrapricot48x48.psd": "c4f9001430f7d90cb7b892f98b909ef6",
"assets/assets/images/people/nurseWoundCare48x48.psd": "7be5b9b0dbc65dee0a7731a8df169e5e",
"assets/assets/images/people/brocoliSon48x48.png": "31fbec3a31690bbd45045f6ede13dbc6",
"assets/assets/images/people/doctor48x48.png": "32538be6a10a0188e02baf84d11f4502",
"assets/assets/images/people/nurseWoundCare48x48.png": "314ace266b41184803b62a24dd875bbd",
"assets/assets/images/people/brocoli32x32.png": "1b3489d3144a51a3dd21150fbe3a85e1",
"assets/assets/images/people/nurse48x48.psd": "788e7dcab68315c48a78e58642fb87fb",
"assets/assets/images/people/doctor48x48.psd": "dea8f11387b8ed260ac026f911116b1c",
"assets/assets/images/people/guy0248x48.png": "4706e28d862dee2a1783563c474ee06b",
"assets/assets/images/people/myrtille48x48.psd": "8b54882fa5ddc45f5274141f065021c2",
"assets/assets/images/people/guy0148x48.png": "7d1e7f6ab7a7c5293174531095a82e0e",
"assets/assets/images/people/apricot48x48.png": "1a99f7439703064a7a28b8d62965ff82",
"assets/assets/images/people/assc48x48.psd": "a3c0241eb454208b5c21cfa064de8f77",
"assets/assets/images/people/brocoliOne.png": "04f4b985b1a55794161913eb6460047b",
"assets/assets/images/people/player48x48.png": "55ce9310cfde20419f1d02a2165cc6ea",
"assets/assets/audio/endlessmotion.mp3": "b6df2d07665c3415f421857df2a68598",
"assets/assets/audio/adventure.mp3": "d470b79f97de680743b51915f6dd788b",
"assets/assets/audio/birthofahero.mp3": "f36273a6016f97ffa8e67f04df158259",
"assets/assets/audio/funday.mp3": "feae87868e1c7404583ec0ef2bd9d779",
"assets/assets/audio/goinghigher.mp3": "2057ee6b687b56fb853af3b3574711cf",
"assets/assets/audio/happyrock.mp3": "80276ac2e9b80cdde919b3c40b4a79cc",
"assets/assets/audio/smile.mp3": "aa215fb189f37b14d6777c115b43b70d",
"assets/assets/audio/onceagain.mp3": "b7303a025fee4c52c32f735833b2bbfa",
"assets/assets/audio/ukulele.mp3": "9569869286a4e88efa8724d24f50bf47",
"assets/assets/audio/perception.mp3": "d35879fcbfe1b1baf870a502d428307a",
"assets/assets/audio/hipjazz.mp3": "d11e76f4d0b724dbdf9edcc48a87dd66",
"assets/assets/audio/slowmotion.mp3": "e0e75e5b7f2eaa57ab39b3a6e5a40f0b",
"assets/assets/audio/smallguitar.mp3": "4eebc12f1d7a82249ff2220bf1de910c",
"assets/assets/audio/highoctane.mp3": "a47178461135a796005f17700ea7fadc"
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
