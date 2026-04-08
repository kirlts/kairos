---
description: /document - Sincroniza el eje documental (MASTER-SPEC, TODO, MEMORY) con el estado real del proyecto.
---

# Sincronización documental

Este workflow asegura que toda la documentación del proyecto refleja fielmente el estado actual del código y la arquitectura. Se ejecuta directamente sin pedir validación previa al usuario.

## Inventario

Leer todos los archivos del eje documental:

- `docs/MASTER-SPEC.md`
- `docs/TODO.md`
- `docs/MEMORY.md`
- `docs/USER-DECISIONS.md`
- `docs/CHANGELOG.md`
- `docs/TEST.md` (si existe)
- `docs/DEUDA-TECNICA.md` (si existe)

## Verificación estructural y Soft-Update

Comparar cada archivo con su plantilla canónica en `.agent/templates/`:

- **MASTER-SPEC:** ¿Tiene las secciones §1-§8? ¿§8 existe aunque sea con nota "Pendiente de verificación formal"? ¿Los checks de §8 usan la taxonomía `[ACTOR.CATEGORÍA.NN]`?
- **TODO:** ¿Utiliza la taxonomía `[EPIC-NNN]` / `[TASK-NNN]`? ¿Cada TASK tiene el campo `**Checks cubiertos:**`? ¿Los timestamps están completos?
- **MEMORY:** ¿El contenido es exclusivamente meta-heurístico? ¿Sigue el formato `[HEU-NNN]`?
- **USER-DECISIONS:** ¿Registra la agencia humana con el formato de 5 campos (Contexto, Decisión, Alternativas, Consecuencias, Reversión)?
- **CHANGELOG:** ¿Sigue el formato Keep a Changelog? ¿Existe la sección `[Unreleased]`?

**Mecanismo de Soft-Update:** Si un documento existe pero su formato es "legacy" (ej. un `MASTER-SPEC` antiguo sin §8 o un `TODO` sin timestamp):
1. **NO LO DESTRUYAS.** Ejerce retro-compatibilidad.
2. Inyecta silenciosamente las secciones faltantes (ej. agregar §8 vacío o con nota).
3. Adapta el contenido existente al nuevo formato (ej. convierte un task base en uno con `**Checks cubiertos:**`).
4. Si la desalineación es irreversible, archiva la versión legacy en `docs/archive/` y reconstruye uno nuevo fusionando la data antigua con la plantilla fresca.

## Sincronización con código

Para cada documento, verificar la coherencia con el estado actual del proyecto:

- ¿El MASTER-SPEC refleja la arquitectura real implementada?
- ¿El TODO.md refleja el progreso real y tiene los timestamps correctos?
- ¿Hay decisiones en el código que falten en USER-DECISIONS.md?
- ¿Hay cambios en el producto que no figuren en CHANGELOG.md?

## Coherencia de Trazabilidad §8 ↔ TODO

Verificación cruzada obligatoria:

1. **Checks sin TASK:** ¿Hay checks en §8 que NO están marcados como implementados Y no tienen ninguna TASK asociada? → Crear las TASKs faltantes.
2. **TASKs sin check:** ¿Hay TASKs que referencian IDs de checks inexistentes en §8 (IDs huérfanos)? → Corregir las referencias o eliminar las TASKs.
3. **Checks fantasma:** ¿Hay checks marcados como "✅ Implementado" cuyo código correspondiente ya no existe o fue eliminado? → Desmarcar y crear TASK de reimplementación.
4. **Conteo de cobertura por actor:** Para cada actor en §8, contar checks implementados vs. pendientes. Registrar en la tabla de resumen del TODO.

## Diagnóstico y Corrección

Generar una tabla consolidada de brechas:

| Documento | Tipo de Brecha | Descripción | Acción |
| --- | --- | --- | --- |
| ej: MASTER-SPEC | Estructura | Faltan secciones §5 y §6 | Migrar a plantilla preservando contenido |
| ej: TODO | Contenido | TASK-001 sin timestamp | Añadir timestamp basado en logs |
| ej: TODO | Trazabilidad | TASK sin campo Checks cubiertos | Agregar campo |
| ej: DEUDA-TECNICA | Ciclo de Vida | 100% completado | Eliminar archivo |

Aplicar todas las correcciones inmediatamente. No solicitar aprobación para brechas detectadas — el usuario ejecuta `/document` precisamente para que la sincronización se realice.

## Validación de Coherencia Cruzada (Check Final)

Verificar que no existan contradicciones internas:

- Intenciones/Propósitos en MASTER-SPEC §1 ↔ Épicas en TODO.md
- Restricciones en MASTER-SPEC §4 ↔ Reglas en `.agent/rules/03`
- Decisiones en USER-DECISIONS.md ↔ Trade-offs en MASTER-SPEC §5
- Checks en MASTER-SPEC §8 ↔ TASKs en TODO.md (bidireccional)
