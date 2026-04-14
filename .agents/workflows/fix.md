---
description: /fix - Diagnostica y resuelve deuda técnica, errores específicos o áreas de mejora estructural en el código. Proceso algorítmico de 5 fases con investigación de mejores prácticas y cierre documental.
---

# Fix (Remediación algorítmica)

Este workflow diagnostica y resuelve deuda técnica mediante un proceso riguroso de 5 fases. Opera en dos modos según la invocación.

## Detección de modo

- **`/fix` (sin argumento):** Escaneo global. Identificar patrones de deuda técnica en el codebase.
- **`/fix [texto]` (focalizado):** Reparación quirúrgica del error o área específica descrita.

---

## Fase 1: Intake

**Objetivo:** Identificar los targets de remediación.

- **Modo global:** Escanear el codebase buscando patrones de deuda (tests faltantes, dependencias obsoletas, patrones inconsistentes, código duplicado, errores de type safety). Leer `docs/DEUDA-TECNICA.md` (si existe) y `docs/TODO.md` para identificar deuda ya documentada.
- **Modo focalizado:** El target es lo que el usuario describe. Localizar el código, archivos, y dependencias involucradas.

**Salida de Fase 1:** Lista priorizada de targets con severidad (Alta / Media / Baja).

## Fase 2: Valla de Chesterton

**Objetivo:** Entender POR QUÉ cada elemento está como está antes de cambiarlo.

Para cada target identificado:
1. Leer el historial de git (`git log --follow`, `git blame`) para entender quién introdujo el patrón y cuándo.
2. Consultar `docs/USER-DECISIONS.md` y `docs/MEMORY.md` para determinar si fue una decisión explícita del usuario.
3. Si la decisión fue explícita, declarar al usuario antes de proponer cambio: «Este patrón fue una decisión deliberada registrada en [referencia]. ¿Confirmas que quieres revisarlo?»
4. Si no hay rastro de intención deliberada, proceder.

**Salida de Fase 2:** Cada target anotado con su contexto histórico y justificación (o ausencia de ella).

## Fase 3: Investigación de mejores prácticas

**Objetivo:** Verificar que la corrección propuesta es la mejor práctica actual.

Para targets de severidad Alta o Media que involucren cambio de herramienta, framework, o patrón arquitectónico:
- Activar el skill `investigacion-estandar`.
- Triangular soluciones actuales antes de proponer remedios.

Para targets de severidad Baja o correcciones mecánicas (typos, types, imports):
- Proceder directamente sin investigación externa.

**Salida de Fase 3:** Cada target con su remedio propuesto y fuentes que lo respaldan (si aplica).

## Fase 4: Plan de corrección y ejecución

**Objetivo:** Generar y ejecutar el plan de remediación.

1. Generar `implementation_plan.md` con cada corrección como subtarea verificable.
2. Cada subtarea referencia el check de MASTER-SPEC §8 que satisface (si aplica).
3. Clasificar correcciones:
   - **Quick Wins** (severidad Baja, riesgo bajo): Aplicar inmediatamente. tests, dependencias, types, imports.
   - **Correcciones estructurales** (severidad Alta/Media): Proponer cambios que respeten la arquitectura del MASTER-SPEC. Ejecutar con verificación.
4. Actualizar `docs/DEUDA-TECNICA.md`. añadir nuevos items descubiertos, marcar resueltos con timestamp.

**Salida de Fase 4:** Código corregido + DEUDA-TECNICA.md actualizado.

## Fase 5: Cierre documental

1. Actualizar `docs/TODO.md` con el progreso realizado.
2. Si alguna corrección implica una decisión arquitectónica significativa, registrar en `docs/USER-DECISIONS.md` tras confirmación del usuario.
3. Si la corrección revela un patrón transferible, candidato para `docs/MEMORY.md` (con protocolo anti-sesgo: verificar si el patrón es generalizable).
4. Ejecutar `/document` como cierre obligatorio.

**Salida de Fase 5:** Documentación sincronizada. Workflow terminado.
