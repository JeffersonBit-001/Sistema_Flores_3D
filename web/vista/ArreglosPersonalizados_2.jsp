<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Ramo 3D Personalizado - AR</title>
        <style>
            body {
                margin: 0;
                overflow: hidden;
                font-family: sans-serif;
            }
            #form-container {
                position: absolute;
                top: 10px;
                left: 10px;
                padding: 1rem;
                background: rgba(240, 240, 240, 0.9);
                width: 250px;
                z-index: 2;
                border-radius: 8px;
            }
            h2 {
                margin-top: 0;
            }
            label {
                display: block;
                margin: 10px 0 5px;
            }
            input, button, select {
                width: 100%;
                padding: 6px;
                font-size: 14px;
                margin-bottom: 10px;
            }
            canvas {
                display: block;
            }
        </style>
        <script type="importmap">
            {
            "imports": {
            "three": "https://cdn.jsdelivr.net/npm/three@0.155.0/build/three.module.js"
            }
            }
        </script>
    </head>
    <body>
        <div id="form-container">
            <h2>Personaliza tu ramo ?</h2>
            <div id="flower-inputs-container">
                <!-- Los inputs se generarán dinámicamente aquí -->
            </div>
            <button id="generar">Generar Ramo</button>

            <div id="decorative-inputs-container">
                <h2>Personaliza tus decorativos</h2>
                <!-- Los inputs se generarán dinámicamente aquí -->
                <button id="generarDecorativos">Generar Decorativos</button>
            </div>

            <label for="vaseSelect">Seleccionar maceta:</label>
            <select id="vaseSelect">
                <option value="florero_ai">Florero AI</option>
                <option value="jarron_punico">Jarrón Púnico</option>
            </select>
            <button id="cambiarMaceta">Cambiar Maceta</button>
        </div>
        <canvas id="canvas"></canvas>

        <script type="module">
            import * as THREE from 'three';
            import { OrbitControls } from 'https://cdn.jsdelivr.net/npm/three@0.155.0/examples/jsm/controls/OrbitControls.js';
            import { ARButton } from 'https://cdn.jsdelivr.net/npm/three@0.155.0/examples/jsm/webxr/ARButton.js';
            import { GLTFLoader } from 'https://cdn.jsdelivr.net/npm/three@0.155.0/examples/jsm/loaders/GLTFLoader.js';

            // Configuración del renderer y la escena
            const canvas = document.getElementById('canvas');
            const renderer = new THREE.WebGLRenderer({canvas, antialias: true});
            renderer.setSize(window.innerWidth, window.innerHeight);
            renderer.setPixelRatio(window.devicePixelRatio);
            renderer.xr.enabled = true;
            document.body.appendChild(
                    ARButton.createButton(renderer, {
                        requiredFeatures: ['hit-test'],
                        optionalFeatures: ['dom-overlay'],
                        domOverlay: {root: document.body}
                    })
                    );

            const scene = new THREE.Scene();
            scene.background = new THREE.Color(0xcccccc);

            const camera = new THREE.PerspectiveCamera(70, window.innerWidth / window.innerHeight, 0.1, 1000);
            camera.position.set(0, 1, 3);
            const controls = new OrbitControls(camera, renderer.domElement);
            controls.enableDamping = true;

            // Iluminación
            const directionalLight = new THREE.DirectionalLight(0xffffff, 1);
            directionalLight.position.set(2, 2, 5);
            scene.add(directionalLight);
            scene.add(new THREE.AmbientLight(0xffffff, 0.6));

            // Grupos para la maceta y las flores
            const vaseGroup = new THREE.Group();
            scene.add(vaseGroup);

            const vaseModelGroup = new THREE.Group();
            vaseGroup.add(vaseModelGroup);

            const flowerGroup = new THREE.Group();
            vaseGroup.add(flowerGroup);

            const loader = new GLTFLoader();

            // Opciones para las macetas: se definen los paths de los modelos.
            const vaseOptions = {
                florero_ai: {modelPath: '../models/jarron_punico_4k.glb'},
                jarron_punico: {modelPath: '../models/florero_ai.glb'}
            };

            // CARGAR JARRONES
            async function fetchVaseOptions() {
                try {
                    // Ajusta la URL a la de tu controlador para los jarrones
                    const response = await fetch('../ControladorFlores?tipoc=mostrar_florero');
                    const data = await response.json();
                    updateVaseSelect(data);
                    console.log("Configuración de jarrones obtenida:", data);
                } catch (error) {
                    console.error("Error al obtener la configuración de jarrones:", error);
                }
            }

            function updateVaseSelect(vaseArray) {
                const vaseSelect = document.getElementById("vaseSelect");
                vaseSelect.innerHTML = ""; // Limpiar opciones previas
                console.log("florero " + vaseArray);
                vaseArray.forEach(vase => {
                    // Crear cada opción del select usando, por ejemplo, 'nombreVisual' para mostrar
                    const option = document.createElement("option");
                    option.value = vase.nombre_florero; // Este valor se usará como key
                    vaseSelect.appendChild(option);
                    option.textContent = vase.nombre_florero;
                    // Actualizar vaseOptions para que el cargador 3D conozca la ruta correcta.
                    // Supongamos que los archivos están dentro de la carpeta "../models/"
                    vaseOptions[vase.nombre_florero] = {modelPath: "../models/" + vase.img_3d};
                });
            }



            // Variable para almacenar la configuración de flores obtenida de la base de datos
            let flowerOptions = {};

            // Función para normalizar el jarrón usando bounding box
            function normalizeVase(model, targetVaseSize = 0.1) {
                const bbox = new THREE.Box3().setFromObject(model);
                const size = bbox.getSize(new THREE.Vector3());
                const maxAxis = Math.max(size.x, size.y, size.z);
                const scaleFactor = targetVaseSize / maxAxis;
                model.scale.multiplyScalar(scaleFactor);
                const bbox2 = new THREE.Box3().setFromObject(model);
                const center = bbox2.getCenter(new THREE.Vector3());
                model.position.sub(center);

                const wrapper = new THREE.Group();
                wrapper.add(model);

                wrapper.position.set(0.016, -0.65, -0.046999);
                return wrapper;
            }

            // Función para normalizar la flor usando un bounding box
            function normalizeFlower(model, targetSize, offsetY) {
                const bbox = new THREE.Box3().setFromObject(model);
                const center = bbox.getCenter(new THREE.Vector3());
                model.position.sub(center);
                const maxAxis = Math.max(
                        bbox.getSize(new THREE.Vector3()).x,
                        bbox.getSize(new THREE.Vector3()).y,
                        bbox.getSize(new THREE.Vector3()).z
                        );
                const scaleFactor = targetSize / maxAxis;
                model.scale.multiplyScalar(scaleFactor);
                model.position.y += offsetY;
                return model;
            }

            // Función para cargar la maceta (remueve la anterior y carga la seleccionada)
            function cargarMaceta(vaseKey) {
                while (vaseModelGroup.children.length > 0) {
                    vaseModelGroup.remove(vaseModelGroup.children[0]);
                }
                const config = vaseOptions[vaseKey];
                loader.load(
                        config.modelPath,
                        function (gltf) {
                            const vaseModel = gltf.scene.clone();
                            const normalizedVase = normalizeVase(vaseModel, 1.1);
                            vaseModelGroup.add(normalizedVase);
                            console.log("Jarrón cargado y normalizado:", vaseKey);
                        },
                        undefined,
                        function (error) {
                            console.error("Error al cargar el jarrón:", error);
                        }
                );
            }

            // Función para generar el ramo de forma dinámica
            function generarRamoDinamico() {
                // Elimina flores anteriores
                while (flowerGroup.children.length > 0) {
                    flowerGroup.remove(flowerGroup.children[0]);
                }

                const flowerInputs = document.querySelectorAll('.flower-input');
                let globalAngles = [];
                const commonRadius = 0.05;
                const minSeparation = 0.55;

                function getNonOverlappingAngle(existingAngles, minSeparation, maxAttempts = 50) {
                    let candidate;
                    let attempt = 0;
                    let valid;
                    do {
                        candidate = Math.random() * Math.PI * 2;
                        valid = true;
                        for (let angle of existingAngles) {
                            let diff = Math.abs(candidate - angle);
                            diff = Math.min(diff, Math.PI * 2 - diff);
                            if (diff < minSeparation) {
                                valid = false;
                                break;
                            }
                        }
                        attempt++;
                    } while (!valid && attempt < maxAttempts);
                    return candidate;
                }

                // Recorrer cada input dinámico
                flowerInputs.forEach(input => {
                    const flowerType = input.dataset.flower; // Ej. "florA"
                    const cantidad = parseInt(input.value, 10) || 0;
                    if (!flowerOptions[flowerType]) {
                        console.error(`No existe configuración para ${flowerType}`);
                        return;
                    }
                    for (let i = 0; i < cantidad; i++) {
                        const angle = getNonOverlappingAngle(globalAngles, minSeparation);
                        globalAngles.push(angle);
                        const basePos = new THREE.Vector3(
                                Math.cos(angle) * commonRadius,
                                flowerOptions[flowerType].offsetY,
                                Math.sin(angle) * commonRadius
                                );
                        loader.load(
                                flowerOptions[flowerType].modelPath,
                                function (gltf) {
                                    const flowerModel = gltf.scene.clone();
                                    normalizeFlower(flowerModel, flowerOptions[flowerType].targetSize, flowerOptions[flowerType].offsetY);
                                    const pivot = new THREE.Group();
                                    pivot.position.copy(basePos);
                                    pivot.rotation.y += (Math.random() - 0.5) * 0.2;
                                    pivot.rotation.x = (Math.random() - 0.5) * -0.4;
                                    pivot.add(flowerModel);
                                    flowerGroup.add(pivot);
                                    console.log(`Flor ${flowerType} cargada en:`, basePos);
                                },
                                undefined,
                                function (error) {
                                    console.error("Error al cargar la flor:", error);
                                }
                        );
                    }
                });
                console.log("Ramo generado de forma dinámica");
            }

            // Función para generar inputs dinámicamente según la configuración recibida
            function updateFlowerInputs(options) {
                const container = document.getElementById("flower-inputs-container");
                container.innerHTML = ""; // Limpiar cualquier contenido previo

                for (const key in options) {
                    if (options.hasOwnProperty(key)) {
                        const label = document.createElement("label");
                        label.textContent = "Cantidad de " + key + ":";
                        label.setAttribute("for", "cantidad_" + key);
                        container.appendChild(label);

                        const input = document.createElement("input");
                        input.type = "number";
                        input.className = "flower-input";
                        input.setAttribute("data-flower", key);
                        input.min = "0";
                        input.max = "30";
                        input.value = "5";
                        input.id = "cantidad_" + key;
                        container.appendChild(input);
                    }
                }
            }



            // Función para obtener la configuración de flores desde la base de datos
            async function fetchFlowerOptions() {
                try {



                    const response = await fetch('../ControladorFlores?tipoc=mostrar_flores'); // Ajusta la URL a la de tu controlador
                    const data = await response.json();

                    console.log("dadasdasdas" + data);
                    // Si los valores fijos son los mismos para todas, puedes definirlos así:
                    const defaultFlowerConfig = {targetSize: 0.7, offsetY: -0.005};

                    // Si para algunas flores estos valores son distintos, podrías condicionarlos aquí:
                    // const customFlowerConfigs = {
                    //   florC: { targetSize: 0.8, offsetY: 0.0 }
                    // };

                    // Construir flowerOptions automáticamente a partir del array recibido
                    let combinedOptions = data.reduce((acc, item) => {
                        // Usa customFlowerConfigs si existen, o recurre a los valores por defecto
                        const config = defaultFlowerConfig; // customFlowerConfigs[item.nombre] || defaultFlowerConfig;
                        acc[item.nombre_flor] = {
                            modelPath: "../models/" + item.img_3d,
                            targetSize: config.targetSize,
                            offsetY: config.offsetY
                        };
                        return acc;
                    }, {});

                    flowerOptions = combinedOptions;
                    updateFlowerInputs(flowerOptions);
                    console.log("Configuración de flores obtenida automáticamente:", flowerOptions);
                } catch (error) {
                    console.error("Error al obtener la configuración de flores:", error);
                }
            }
            // Eventos de los botones
            document.getElementById("generar").addEventListener("click", () => {
                console.log("Botón Generar Ramo presionado");
                generarRamoDinamico();
            });

            document.getElementById("cambiarMaceta").addEventListener("click", () => {
                const vaseSelect = document.getElementById("vaseSelect");
                const selectedVase = vaseSelect.value;
                console.log("Cambiando jarrón a:", selectedVase);
                cargarMaceta(selectedVase);
            });

            // Carga inicial
            cargarMaceta('florero_ai');
            // obtener configuracion de Maceta
            fetchVaseOptions();
            // Obtener la configuración de flores dinámicamente
            fetchFlowerOptions();

            // Bucle de renderizado y animación
            renderer.setAnimationLoop(() => {
                if (!renderer.xr.isPresenting) {
                    controls.update();
                    vaseGroup.rotation.y += 0.005;
                }
                renderer.render(scene, camera);
            });

            // Ajuste de tamaño al cambiar el viewport
            window.addEventListener("resize", () => {
                camera.aspect = window.innerWidth / window.innerHeight;
                camera.updateProjectionMatrix();
                renderer.setSize(window.innerWidth, window.innerHeight);
            });


            /// DECORATIVOS
            // Declarar variables globales para decorativos
            let decorativeOptions = {};

// Crear un grupo para los decorativos y añadirlo a la escena (o al grupo principal, según requieras)
            const decorativeGroup = new THREE.Group();
            vaseGroup.add(decorativeGroup);

            /* Función para crear inputs dinámicamente para decorativos */
            function updateDecorativeInputs(options) {
                const container = document.getElementById("decorative-inputs-container");
                // Limpia contenido previo (más allá del título)
                // Si deseas conservar el título, podrías usar container.querySelector('h2') y limpiar solo lo que sigue.
                container.querySelectorAll("label, input").forEach(el => el.remove());

                for (const key in options) {
                    if (options.hasOwnProperty(key)) {
                        const label = document.createElement("label");
                        label.textContent = "Cantidad de " + key + ":";
                        label.setAttribute("for", "cantidad_decorative_" + key);
                        container.appendChild(label);

                        const input = document.createElement("input");
                        input.type = "number";
                        input.className = "decorative-input";
                        input.setAttribute("data-decorative", key);
                        input.min = "0";
                        input.max = "30";
                        input.value = "2"; // Puedes ajustar el valor por defecto si lo prefieres
                        input.id = "cantidad_decorative_" + key;
                        container.appendChild(input);
                    }
                }
            }

            /* Función para obtener la configuración de decorativos desde la base de datos */
            async function fetchDecorativeOptions() {
                try {
                    // Ajusta la URL al endpoint que devuelve los decorativos
                    const response = await fetch('../ControladorFlores?tipoc=mostrar_decorativo');
                    const data = await response.json();

                    // Define valores por defecto para normalización,
                    // estos valores pueden ajustarse según las características de tus modelos
                    const defaultDecorativeConfig = {targetSize: 0.5, offsetY: 0.0};

                    // Crear el objeto de opciones a partir del array recibido
                    let combinedOptions = data.reduce((acc, item) => {
                        acc[item.nombre_decorativo] = {
                            modelPath: "../models/" + item.img_3d,
                            targetSize: defaultDecorativeConfig.targetSize,
                            offsetY: defaultDecorativeConfig.offsetY
                        };
                        return acc;
                    }, {});

                    decorativeOptions = combinedOptions;
                    updateDecorativeInputs(decorativeOptions);
                    console.log("Configuración de decorativos obtenida:", decorativeOptions);
                } catch (error) {
                    console.error("Error al obtener la configuración de decorativos:", error);
                }
            }

            /* Función para normalizar el tamaño del modelo decorativo.
             Es similar a la de las flores, pero la definí por separado por claridad.
             Si el proceso es idéntico, podrías reutilizar normalizeFlower.
             */
            function normalizeDecorative(model, targetSize, offsetY) {
                const bbox = new THREE.Box3().setFromObject(model);
                const center = bbox.getCenter(new THREE.Vector3());
                model.position.sub(center);
                // Calcular el tamaño máximo
                const size = bbox.getSize(new THREE.Vector3());
                const maxAxis = Math.max(size.x, size.y, size.z);
                const scaleFactor = targetSize / maxAxis;
                model.scale.multiplyScalar(scaleFactor);
                model.position.y += offsetY;
                return model;
            }





            /* Función para generar los decorativos de forma dinámica */
            function generarDecorativosDinamico() {
    // Remueve decorativos anteriores
    while (decorativeGroup.children.length > 0) {
        decorativeGroup.remove(decorativeGroup.children[0]);
    }

    // Obtén todos los inputs de decorativos
    const decorativeInputs = document.querySelectorAll('.decorative-input');
    
    // Array para almacenar los ángulos ya asignados y forzar separación
    let globalDecorativeAngles = [];
    // Define un radio fijo para la posición de los decorativos, igual para todos
    const commonRadiusDecorative = 0.15; // Ajusta según el tamaño deseado
    // Define un mínimo de separación (puedes usar el mismo que para las flores)
    const minSeparationDecorative = 0.55;

    decorativeInputs.forEach(input => {
        const decorativeType = input.dataset.decorative;
        const cantidad = parseInt(input.value, 10) || 0;
        if (!decorativeOptions[decorativeType]) {
            console.error(`No existe configuración para ${decorativeType}`);
            return;
        }
        
        for (let i = 0; i < cantidad; i++) {
            // Calcula un ángulo que respete la separación mínima
            const angle = getNonOverlappingAnglesdas(globalDecorativeAngles, minSeparationDecorative);
            globalDecorativeAngles.push(angle);
            
            // Posición fija: cada decorativo se ubica usando el mismo radio (como las flores)
            const basePos = new THREE.Vector3(
                Math.cos(angle) * commonRadiusDecorative,
                decorativeOptions[decorativeType].offsetY,  // Se mantiene la altura definida en la configuración
                Math.sin(angle) * commonRadiusDecorative
            );
            
            // Cargar el modelo del decorativo
            loader.load(
                decorativeOptions[decorativeType].modelPath,
                function (gltf) {
                    const decorativeModel = gltf.scene.clone();
                    // Normaliza el modelo usando la misma función (se mantiene el offset si así lo requieres)
                    normalizeDecorative(
                        decorativeModel,
                        decorativeOptions[decorativeType].targetSize,
                        decorativeOptions[decorativeType].offsetY
                    );
                    const pivot = new THREE.Group();
                    pivot.position.copy(basePos);
                    // Agregar ligeras rotaciones para efecto natural (opcional)
                    pivot.rotation.y += (Math.random() - 0.5) * 0.2;
                    pivot.rotation.x += (Math.random() - 0.5) * -0.4;
                    pivot.add(decorativeModel);
                    decorativeGroup.add(pivot);
                    console.log(`Decorativo ${decorativeType} cargado en:`, basePos);
                },
                undefined,
                function (error) {
                    console.error("Error al cargar el decorativo:", error);
                }
            );
        }
    });
    console.log("Decorativos generados de forma dinámica");
}




function getNonOverlappingAnglesdas(existingAngles, minSeparation, maxAttempts = 40) {
    let candidate;
    let attempt = 0;
    let valid;
    do {
        candidate = Math.random() * Math.PI * 2;
        valid = true;
        for (let angle of existingAngles) {
            let diff = Math.abs(candidate - angle);
            diff = Math.min(diff, Math.PI * 2 - diff);
            if (diff < minSeparation) {
                valid = false;
                break;
            }
        }
        attempt++;
    } while (!valid && attempt < maxAttempts);
    return candidate;
}



            /* 
             Opcional: Si prefieres generar todo (flores y decorativos) con un solo botón,
             modifica el event listener para "generar" de la siguiente forma:
             */
            // Botón para generar solo las decoraciones
                document.getElementById("generarDecorativos").addEventListener("click", () => {
                    console.log("Botón Generar Decorativos presionado");
                    generarDecorativosDinamico(); // Función que genera los decorativos
                });

// Llamar a la función para obtener la configuración de decorativos al cargar la página
            fetchDecorativeOptions();



        </script>
    </body>
</html>
