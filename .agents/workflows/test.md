---
description: /test - Establece o ejecuta la estrategia de pruebas del proyecto. Detecta automáticamente si el repo necesita una estrategia nueva o si ya tiene una para ejecutar.
---

# Testing estratégico

Este workflow opera en dos modos detectados automáticamente por el estado del repositorio.

## Detección de modo

Escanear el repositorio buscando evidencia de una estrategia de testing existente. La evidencia incluye, sin limitarse a:

- `docs/TEST.md` (contrato formal de Kairós)
- Configuración de test runners (`pytest.ini`, `pyproject.toml [tool.pytest]`, `jest.config.*`, `vitest.config.*`, `.mocharc.*`, `phpunit.xml`)
- Directorios de tests (`test/`, `tests/`, `__tests__/`, `spec/`)
- Tests inline o scripts de validación en CI/CD (`.github/workflows/`, `Makefile` con target `test`)
- Checklists manuales o documentos de QA en cualquier formato

**Resultado de la detección:**

- Si NO se encuentra evidencia de testing → **Modo 1: Proponer estrategia**
- Si se encuentra una estrategia existente y es al menos parcialmente apropiada para el scope del repositorio → **Modo 2: Ejecutar suite existente**
- Si se encuentra una estrategia existente pero es totalmente inadecuada para el scope actual (ej: solo tests de un módulo abandonado) → **Modo 1**, pero documentar qué se encontró y por qué se descarta

---

## Modo 1: Proponer estrategia

### Fase 1: Análisis del repositorio

1. Leer `docs/MASTER-SPEC.md` para entender la arquitectura y los flujos críticos.
2. Escanear el codebase para identificar: lenguajes, frameworks, estructura de directorios, tests existentes (si hay).
3. Identificar los flujos que el usuario necesita verificar visualmente y los flujos críticos que no pueden fallar.

### Fase 2: Diseño de estrategia

La estrategia de testing se diseña desde la perspectiva del usuario: qué necesita verificar, qué flujos son críticos, qué regresiones son inaceptables.

**Pirámide de testing por defecto para greenfield:**

| Capa | Herramienta típica | Cobertura target | Criterio de éxito |
|---|---|---|---|
| Tests unitarios | vitest, pytest, go test, jest | Lógica de negocio, funciones puras, utilidades | Cada función con lógica no trivial tiene test |
| Tests de integración | vitest, pytest, supertest | Flujos de datos end-to-end, APIs, DB queries | Cada endpoint/flujo crítico tiene test |
| Tests E2E / visuales | Playwright | Flujos de usuario visibles, regresiones de UI | Cada flujo crítico del MASTER-SPEC tiene test |

El usuario siempre puede hacer override implícito de cualquier elemento de la estrategia propuesta (ej: «no quiero Playwright» → se respeta sin cuestionar).

### Fase 3: Generación de TEST.md

Generar `docs/TEST.md` con la estrategia materializada:

```markdown
# TEST.md

## Stack de Testing
- Runner: [ej: vitest, pytest]
- E2E: [si aplica: playwright, ninguno]
- Mocking: [estrategia]

## Triggers Automáticos
<!-- Condiciones bajo las cuales la IA ejecuta tests sin petición -->
- Al completar cualquier TASK que modifique [componente X]
- Al modificar [archivos/patrones específicos]
- Al cerrar una épica

## Tests de Alta Prioridad (Límites Intransgredibles)
<!-- Tests que validan que NO se viole un Límite Intransgredible -->
- [ ] [Descripción del test]. valida §4 de MASTER-SPEC

## Tests de Regresión
<!-- Se añaden cuando debugging revela un bug -->

## Política de E2E
- Activar cuando: [condiciones]
- No activar cuando: [condiciones]
```

### Fase 4: Confirmación

Presentar TEST.md al usuario. No implementar tests hasta que confirme el contrato.

---

## Modo 2: Ejecutar suite existente

### Paso 1: Leer estrategia

Cargar la estrategia de testing detectada:

- Si existe `docs/TEST.md`: usarlo como contrato formal (qué runner, qué triggers, qué tests de alta prioridad).
- Si la estrategia está en configuración de runners (pytest.ini, jest.config, etc.): leer los archivos de configuración y los tests existentes para entender qué se ejecuta y cómo.
- Si la estrategia es una checklist manual o un documento de QA: leerlo y usarlo como guía.

### Paso 2: Evaluar contexto

Determinar el subconjunto a ejecutar:
- Si el usuario especifica el subconjunto en la invocación (ej: `/test auth`), ejecutar ese subconjunto.
- Si el contexto conversacional implica un área (ej: «acabo de refactorizar el módulo de autenticación»), ejecutar tests de esa área.
- Si no hay contexto específico, ejecutar la suite completa.

### Paso 3: Ejecutar tests

Ejecutar los tests relevantes usando el runner detectado. Si un test falla:
1. Analizar la causa raíz.
2. Proponer fix.
3. Re-ejecutar para validar.

### Paso 4: Documentar resultado

- Si se descubren bugs → añadir a tests de regresión (en TEST.md si existe, o crear uno).
- Si la corrección revela un patrón transferible → candidato para MEMORY.md (con protocolo anti-sesgo).
- Actualizar conteo de cobertura si aplica.
- Si el proyecto usa una estrategia legacy sin TEST.md formal, proponer su migración a `docs/TEST.md` para futuras ejecuciones.

