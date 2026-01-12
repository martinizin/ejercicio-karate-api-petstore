# PetStore API Automation - Karate DSL & Gradle

El siguiente ejercicio presenta un conjunto de pruebas automatizadas para la API de **PetStore**, desarrolladas utilizando el framework **Karate** y gestionadas con **Gradle**.

El objetivo principal es validar el ciclo de vida completo (CRUD) de las mascotas dentro del sistema, asegurando la integridad de los datos y la correcta respuesta de los endpoints.

## Tecnologías Utilizadas

- **Java 17**: Lenguaje base.
- **Karate DSL**: Framework de pruebas automatizadas para API.
- **Gradle**: Automatización de construcción y gestión de dependencias, version 7.6.1
- **Cucumber Reporting**: Generación de reportes visuales detallados.
- **Dependencias**:
- testImplementation 'com.intuit.karate:karate-junit5:1.4.1'
- testImplementation 'net.masterthought:cucumber-reporting:5.7.7'

## Estructura del Proyecto

El proyecto sigue la convención estándar de Gradle, separando la lógica de ejecución (Java) de los recursos de prueba (Karate/Gherkin).

```text
karate-petstore/
├── src/test/java
│   └── com/nttdata/api
│       └── PetStoreRunner.java      # Runner JUnit para ejecución paralela
└── src/test/resources
    ├── karate-config.js             # Configuración global y variables de entorno
    ├── data/                        # Datos de prueba (JSON Request Bodies)
    │   ├── pets.json
    │   └── updatePet.json
    └── features/                    # Escenarios de prueba (.feature)
        ├── addPet.feature
        ├── findByStatus.feature
        ├── getPetById.feature
        └── updatePet.feature
```
## Instrucciones de Instalación y Ejecución

### Prerrequisitos

- Tener instalado **Java JDK 11 o superior**.
- No es necesario instalar Gradle manualmente (se utiliza el **Wrapper** incluido en el proyecto).

### Clonar el repositorio

```bash
git clone <URL_DEL_REPOSITORIO>
cd karate-petstore
```

### Ejecutar las pruebas

Para ejecutar todos los tests en paralelo y generar los reportes, ejecuta el siguiente comando en la terminal desde la raíz del proyecto:

**Windows (PowerShell/CMD):**

```powershell
./gradlew clean test
```

**Linux / Mac:**

```bash
./gradlew clean test
```

---

## Reportes y Evidencias

Al finalizar la ejecución, se generan dos tipos de reportes en la carpeta `build/`:

### 1) Reporte Nativo de Karate (Recomendado para Debug)

* **Ubicación:** `build/karate-reports/karate-summary.html`
* **Descripción:** Muestra la línea de tiempo de ejecución, requests, responses y logs detallados paso a paso.

### 2) Reporte Cucumber (Resumen Ejecutivo)

* **Ubicación:** `build/reports/cucumber-html-reports/overview-features.html`
* **Descripción:** Ofrece una vista gráfica con estadísticas de éxito/fallo y desglose por Feature.

---

## Características Destacadas de la Implementación

* **Ejecución Paralela:** Configurada mediante `PetStoreRunner` para optimizar el tiempo de ejecución.
* **Reutilización de Escenarios (DRY):** Se implementó la capacidad de llamar escenarios (`call read`) dentro de otros; por ejemplo, `updatePet.feature` llama a `addPet.feature` para asegurar que existan datos antes de actualizar.
* **Data Driven Testing:** Los cuerpos de las peticiones (Payloads) están externalizados en archivos JSON dentro de la carpeta `data/` para mantener los tests limpios.
