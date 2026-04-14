---
description: /release - Genera una nueva versión oficial del framework Kairós (Version Bump + Manifiesto + Documentación Pública). Uso EXCLUSIVO en repositorio canónico.
---

# Release de Kairós

Este workflow automatiza la creación de una nueva versión del framework Kairós. Gestiona el cálculo semántico de versión (SemVer), la reconstrucción del manifiesto, la sincronización del Changelog, la actualización de la documentación pública y la verificación de integridad de las plantillas distribuibles.

## Paso 0: Guardia de Entorno

Este workflow modifica el manifiesto de distribución global. **SOLO** debe ejecutarse si el ecosistema actual en el que trabajas está designado como el repositorio canónico de Kairós que redistribuye al resto. Si estás en un repositorio cliente (ej. una app, un servicio), debes **ABORTAR INMEDIATAMENTE** y notificar al usuario.

## Paso 1: Detección y Análisis

1. Leer el archivo `kairos-version.txt` actual en la raíz del repositorio. Obtener la versión `vX.Y.Z` de la primera línea y los archivos del manifiesto. (Si no existe, asumir `v0.1.0` temporalmente).
2. Listar todos los archivos reales actuales dentro del directorio `.agents/` (ignorando archivos temporales o el subdirectorio `scratch/`). Las rutas deben estar relativas a la raíz (ej. `.agents/rules/00-kairos-identidad-y-lealtad.md`).
3. Calcular el **Diff**:
   - Archivos NUEVOS en `.agents/` que no estaban en el manifiesto viejo (+).
   - Archivos ELIMINADOS del manifiesto viejo que ya no están en `.agents/` (-).
   - Archivos MODIFICADOS (comparar contenido actual con el status de "lo que había", revisar historial si es posible, o deducir por el CHANGELOG `[Unreleased]`) (~).
4. Leer `docs/CHANGELOG.md` en su sección `[Unreleased]` para capturar la intención de los cambios.

## Paso 2: Cálculo SemVer Automático

La IA determina el tipo de salto de versión (SemVer) basándose en la gravedad y naturaleza del Diff:

- **BUMP MAJOR (`v(X+1).0.0`):**
  - Se eliminaron archivos del framework (kills dependencias de reglas/workflows previos).
  - Se alteró significativamente la estructura canónica de las plantillas en `.agents/templates/`.
  - Ruptura de retrocompatibilidad.
- **BUMP MINOR (`vX.(Y+1).0`):**
  - Se añadieron nuevas `rules/`, `workflows/` o `skills/` limpiamente.
  - Nuevas funcionalidades añadidas sin remover o romper las anteriores.
- **BUMP PATCH (`vX.Y.(Z+1)`):**
  - Correcciones de redacción (typos).
  - Actualización de prompts, lógicas internas, y bugfixes estructurales dentro de los mismos archivos, que no cambian el contrato primario. Ningún archivo fue eliminado.

## Paso 3: Triaje (Informativo)

Presentar el plan de release al usuario y proceder directamente a la generación de artefactos:

```markdown
**Versión actual:** vX.Y.Z
**Nueva propuesta:** vA.B.C ([MAJOR/MINOR/PATCH])
**Cálculo:** [Justificación breve del bump basado en la semántica]

**Diff de Manifiesto:**
- [+] [Rutas nuevas]
- [-] [Rutas eliminadas]
- [~] [Cambios registrados]
```

## Paso 4: Generación de Artefactos

### 4.1 Manifiesto de versión
1. **Reescribir `kairos-version.txt`**:
   - Línea 1: Nueva Versión (`vA.B.C`)
   - Desde Línea 2 en adelante: La lista limpia e indexada alfabéticamente de todas las rutas de los archivos dentro de `.agents/` (una ruta por línea).

### 4.2 Changelog
2. **Promover Changelog**: Modificar `docs/CHANGELOG.md` actualizando el título `[Unreleased]` a `[vA.B.C] - YYYY-MM-DD`. Agregar una nueva sección `[Unreleased]` vacía arriba.

### 4.3 Documentación Pública (READMEs)

Los READMEs son la primera impresión del framework. Deben ser accesibles, claros y no intimidar al usuario. Existen dos archivos de documentación pública que DEBEN actualizarse en cada release:

- **`.github/README.md`**: README público de GitHub. Es la cara del proyecto para visitantes externos.
- **`README-KAIROS.md`**: README interno que se copia a cada proyecto adoptante. Es la guía de referencia rápida para desarrolladores que ya usan Kairós.

**Protocolo de actualización:**

1. **Version bump**: Actualizar el campo `> **Versión:** vX.Y.Z` en ambos archivos a la nueva versión.
2. **Tabla de workflows**: Verificar que AMBAS tablas de workflows estén sincronizadas con los archivos reales en `.agents/workflows/`. Para cada workflow:
   - Verificar que existe una entrada en la tabla.
   - Verificar que la descripción coincide con el campo `description:` del frontmatter del workflow.
   - Si un workflow fue añadido, agregar su fila.
   - Si un workflow fue eliminado, remover su fila.
3. **Tabla de componentes**: Verificar que la tabla de componentes del sistema refleje la estructura real de `.agents/`.
4. **Tono y accesibilidad**: Releer cada README y verificar que cumple con estos criterios:
   - El lenguaje es accesible para un desarrollador que NO conoce Kairós. No se asume conocimiento previo del framework.
   - Las funcionalidades están descritas en términos de BENEFICIO para el usuario, no en términos de mecánica interna ("Genera un checklist exhaustivo desde cualquier input" > "Ejecuta el algoritmo de descomposición de promesas").
   - No hay jerga interna del framework expuesta (Kratos, Khaos, Sintonía, tensión dinámica).
   - Los workflows están descritos con claridad tanto sobre CUÁNDO usarlos como sobre QUÉ hacen.
   - Las instrucciones de adopción son paso a paso, concretas y accionables.
   - *ANTI-PATTERN:* Usar terminología técnica del framework como gancho de marketing ("nuestro sistema de CoT Inversion con MECE gates"). El usuario quiere saber qué OBTIENE, no cómo funciona internamente.
   - *ANTI-PATTERN:* Listar funcionalidades sin contexto de uso. Cada workflow debe tener un escenario claro de cuándo ejecutarlo.

### 4.4 Integridad de Plantillas en `/docs`

Las plantillas maestras en `.agents/templates/` son la fuente de verdad para los documentos que Kairós genera en los proyectos adoptantes. Cada release debe verificar su integridad:

1. **Inventario**: Listar todas las plantillas existentes en `.agents/templates/`.
2. **Cross-reference documental**: Para cada plantilla que corresponde a un documento del eje documental (`master-spec.md`, `todo.md`, `memory.md`, `changelog.md`, `user-decisions.md`, `deuda-tecnica.md`), verificar:
   - Que la estructura de la plantilla es compatible con las reglas en `.agents/rules/02-documentation.md`. Si una regla describe un campo obligatorio o un formato, la plantilla DEBE contenerlo.
   - Que no hay plantillas huérfanas (templates que ningún workflow o regla referencia).
   - Que no hay plantillas faltantes (documentos mencionados en las reglas cuya template no existe).
3. **Cross-reference de workflow templates**: Para cada plantilla de workflow (`derive-working.md`, `derive-checklist.md`, `checklist-working.md`, `checklist-output.md`), verificar:
   - Que el workflow correspondiente referencia el nombre exacto del archivo template.
   - Que la estructura de la template es compatible con el workflow (mismas fases, mismos gates, mismos campos).
4. **Reporte de integridad**: Generar un bloque en el triaje (o post-aprobación si hay issues) listando:
   - ✅ Templates verificadas y conformes.
   - ⚠️ Templates con discrepancias menores (campos desactualizados).
   - ❌ Templates con discrepancias críticas (workflow referencia template que no existe, o template no corresponde al workflow).

Si se detectan discrepancias ❌, la IA DEBE corregirlas como parte del release. Las discrepancias ⚠️ se documentan y corrigen si el esfuerzo es bajo.

## Paso 5: Verificación Final

Antes de dar por finalizado el release:

1. **Git diff**: Ejecutar `git diff --stat` y verificar que SOLO se modificaron los archivos esperados. Si hay archivos inesperados en el diff, alertar al usuario.
2. **Consistencia de versión**: Verificar que la versión `vA.B.C` aparece en:
   - `kairos-version.txt` (línea 1)
   - `.github/README.md` (campo Versión)
   - `README-KAIROS.md` (campo Versión)
   - `docs/CHANGELOG.md` (título de la sección recién promovida)
3. **Conteo de manifiesto**: Verificar que el número de archivos en `kairos-version.txt` coincide con el conteo real de archivos en `.agents/` (excluyendo `scratch/`).

## Paso 6: Instrucción Final

Informar al usuario que el release está listo para push. Si el entorno requiere publicar en `raw.githubusercontent.com` para que `/update` funcione en otros repos, el push es necesario para hacer efectiva la distribución.
