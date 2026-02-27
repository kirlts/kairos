# USER-DECISIONS: Registro de Agencia Humana

> **Propósito:** Este archivo documenta las decisiones significativas tomadas por el
> humano durante el desarrollo, incluyendo las alternativas que se descartaron y por qué.
> Permite responder: ¿quién decidió esto? ¿por qué no se fue por otro camino? ¿qué
> condición haría cambiar esta decisión?
>
> **Quién actualiza esto:** La IA redacta la entrada después de que el usuario tome una
> decisión relevante. El usuario confirma con "ok" o similar antes de que se guarde.
>
> **Formato de ID:** DEC-YYYYMMDD-NNN (fecha + número secuencial del día)

---

<!-- PLANTILLA DE ENTRADA — copiar para cada nueva decisión -->
<!--
## [DEC-YYYYMMDD-NNN] [Título corto y descriptivo]

**Fecha:** YYYY-MM-DD
**Estado:** Activa | Supersedida por [DEC-...] | En revisión
**Agente principal:** Humano | IA (propuesta) + Humano (aprobó)

### Contexto
¿Qué situación o problema generó la necesidad de esta decisión?

### Decisión
La decisión tomada, en una oración clara.

### Alternativas Descartadas
| Alternativa | Por qué se descartó |
| --- | --- |
| | |

### Consecuencias
¿Qué implica esta decisión? ¿Qué se habilita y qué se cierra?

### Condiciones de Reversión
¿Qué cambio en el contexto, tecnología, equipo o negocio haría reconsiderar
esta decisión? Permite que la IA proponga revisarse si esas condiciones aparecen.

- Si [condición] → reconsiderar esta decisión
-->

---

## [DEC-20260227-001] Arquitectura de Visibilidad vs Seguridad de Instalación

**Fecha:** 2026-02-27
**Estado:** Activa
**Agente principal:** IA (propuesta) + Humano (aprobó)

### Contexto

Existía un conflicto entre la visibilidad del repositorio en GitHub (que requiere un README.md en la raíz) y la seguridad de instalación manual o actualización (que puede sobreescribir el README.md del usuario por error).

### Decisión

Utilizar la estructura `.github/README.md` para la visibilidad en GitHub y mantener `README-KAIROS.md` para la operatividad del usuario, eliminando cualquier `README.md` de la raíz del sistema de gobernanza.

### Alternativas Descartadas

| Alternativa | Por qué se descartó |
| --- | --- |
| README en raíz | Riesgo inaceptable de sobreescritura accidental en proyectos de usuario. |
| README-KAIROS solo | El repositorio aparece "vacío" o sin manual de bienvenida al visitarlo en GitHub. |
| Alias simbólico | Puede romperse en sistemas operativos diferentes (Windows) o al copiar carpetas. |

### Consecuencias

- Habilita la visibilidad profesional del repositorio.
- Garantiza instalaciones manuales ("drag-and-drop") seguras.
- Requiere que el usuario identifique `README-KAIROS.md` como su manual operativo inicial.

### Condiciones de Reversión

- Si GitHub cambia el orden de prioridad de renderizado (priorizando docs o root siempre sobre .github).
- Si se desarrolla un instalador vía CLI que maneje la colisión de forma inteligente.
