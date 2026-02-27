---
description: /contain - Definición de la estrategia de entorno (Docker, Dev Containers, etc.)
---

# WORKFLOW: CONTAINERIZACIÓN Y ENTORNO

Este workflow define la estrategia de entorno de desarrollo del proyecto. En 2026, con IA capaz de generar configuraciones de Docker/Dev Containers de alta calidad, el overhead de containerización se reduce drásticamente.

## Fase 1: Diagnóstico con Matriz

Analizar el proyecto usando la siguiente matriz de decisión:

| Factor | Peso | A favor de container | En contra |
| --- | --- | --- | --- |
| Dependencias del sistema | Alto | 2+ servicios (DB, Redis, etc.) | Solo runtime del lenguaje |
| Uniformidad de entorno | Medio | Múltiples devs o CI/CD | Solo-dev sin CI |
| Reproducibilidad | Alto | Deploy a cloud | Solo local |
| Complejidad del setup | Medio | >5 pasos de setup manual | npm install y listo |

Ejecutar el skill `investigacion-estandar` para verificar mejores prácticas actuales para el stack del proyecto.

## Fase 2: Propuesta al Usuario

Presentar una propuesta con:

1. **Recomendación:** Containerizar / No container / Dev Container sin Docker completo
2. **Justificación** basada en la matriz y la investigación
3. **Complejidad de implementación** estimada
4. **Archivos que se generarán:**
   - `Dockerfile` / `docker-compose.yml`
   - `.devcontainer/devcontainer.json`
   - Actualizaciones a `docs/MASTER-SPEC.md` §9

**NO implementar sin aprobación del usuario.**

## Fase 3: Implementación

Si el usuario aprueba:

1. Generar archivos de containerización
2. Verificar que el entorno levanta correctamente
3. Actualizar `docs/MASTER-SPEC.md` §9 (Ambiente y Entorno)
4. Actualizar `docs/TODO.md` con tasks completadas
5. Añadir a `docs/CHANGELOG.md` sección [Unreleased]
