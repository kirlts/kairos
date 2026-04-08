---
description: /release - Genera una nueva versión oficial del framework Kairós (Version Bump + Manifiesto). Uso EXCLUSIVO en repositorio canónico.
---

# Release de Kairós

Este workflow automatiza la creación de una nueva versión del framework Kairós. Se encarga de calcular semánticamente la versión (SemVer), reconstruir el manifiesto de archivos oficial y sincronizar el Changelog. 

## Paso 0: Guardia de Entorno

Este workflow modifica el manifiesto de distribución global. **SOLO** debe ejecutarse si el ecosistema actual en el que trabajas está designado como el repositorio canónico de Kairós que redistribuye al resto. Si estás en un repositorio cliente (ej. una app, un servicio), debes **ABORTAR INMEDIATAMENTE** y notificar al usuario.

## Paso 1: Detección y Análisis

1. Leer el archivo `kairos-version.txt` actual en la raíz del repositorio. Obtener la versión `vX.Y.Z` de la primera línea y los archivos del manifiesto. (Si no existe, asumir `v0.1.0` temporalmente).
2. Listar todos los archivos reales actuales dentro del directorio `.agent/` (ignorando archivos temporales o el subdirectorio `scratch/`). Las rutas deben estar relativas a la raíz (ej. `.agent/rules/01-kairos...`).
3. Calcular el **Diff**:
   - Archivos NUEVOS en `.agent/` que no estaban en el manifiesto viejo (+).
   - Archivos ELIMINADOS del manifiesto viejo que ya no están en `.agent/` (-).
   - Archivos MODIFICADOS (comparar contenido actual con el status de "lo que había", revisar historial si es posible, o deducir por el CHANGELOG `[Unreleased]`) (~).
4. Leer `docs/CHANGELOG.md` en su sección `[Unreleased]` para capturar la intención de los cambios.

## Paso 2: Cálculo SemVer Automático

La IA determina el tipo de salto de versión (SemVer) basándose en la gravedad y naturaleza del Diff:

- **BUMP MAJOR (`v(X+1).0.0`):**
  - Se eliminaron archivos del framework (kills dependencias de reglas/workflows previos).
  - Se alteró significativamente la estructura canónica de las plantillas en `.agent/templates/`.
  - Ruptura de retrocompatibilidad.
- **BUMP MINOR (`vX.(Y+1).0`):**
  - Se añadieron nuevas `rules/`, `workflows/` o `skills/` limpiamente.
  - Nuevas funcionalidades añadidas sin remover o romper las anteriores.
- **BUMP PATCH (`vX.Y.(Z+1)`):**
  - Correcciones de redacción (typos).
  - Actualización de prompts, lógicas internas, y bugfixes estructurales dentro de los mismos archivos, que no cambian el contrato primario. Ningún archivo fue eliminado.

## Paso 3: Triaje con el Usuario

Presentar el plan de release:

```markdown
**Versión actual:** vX.Y.Z
**Nueva propuesta:** vA.B.C ([MAJOR/MINOR/PATCH])
**Cálculo:** [Justificación breve del bump basado en la semántica]

**Diff de Manifiesto:**
- [+] [Rutas nuevas]
- [-] [Rutas eliminadas]
- [~] [Cambios registrados]
```

**Preguntar explícitamente:** "¿Apruebas la generación de este release y el bump sugerido?"

## Paso 4: Generación de Artefactos (Post-Aprobación)

1. **Reescribir `kairos-version.txt`**:
   - Línea 1: Nueva Versión (`vA.B.C`)
   - Desde Línea 2 en adelante: La lista limpia e indexada alfabéticamente de todas las rutas de los archivos dentro de `.agent/` (una ruta por línea, ej: `.agent/rules/00-kairos-identidad-y-lealtad.md`).
2. **Promover Changelog**: Modificar `docs/CHANGELOG.md` actualizando el título `[Unreleased]` a `[vA.B.C] - YYYY-MM-DD`. Agregar una nueva sección `[Unreleased]` vacía arriba.

## Paso 5: Instrucción Final
Si el entorno exige hacer commits a git automáticamente para hacer efectivos los cambios en `raw.githubusercontent.com`, infórmale al usuario que haga push.
