# MASTER-SPEC: [Nombre del Proyecto] v0.1.0

> [Descripción de una línea del proyecto]

---

## §1. Identidad del Proyecto

**Propósito:** [Qué hace, para quién, y por qué importa. No como elevator pitch; como declaración de intención que un colaborador pueda usar para tomar decisiones sin preguntar.]

**Nombre:** [Nombre del proyecto]

**Dominio:** [Categoría del problema: ej. "Seguridad de datos", "Educación", "RegTech"]

**Problema que resuelve:** [Cuál es la fricción, ineficiencia, o necesidad concreta que este proyecto ataca. Una persona que no conoce el proyecto debería poder entender el dolor que esto alivia.]

**Beneficiario directo:** [Quién recibe valor concreto de este proyecto. No "usuarios" en abstracto; la entidad específica que mejora su situación.]

**Beneficiario indirecto:** [Si aplica: quién se beneficia como consecuencia secundaria.]

**Lo que NO es:** [Qué no intenta ser este proyecto. Esto protege el scope contra la expansión no intencionada. Si no hay restricciones de scope, escribir: "Sin restricciones de scope definidas."]

---

## §2. Arquitectura

**Tipo:** [Zero-backend / Cliente-Servidor / Monolito / Microservicios / etc.]

**Diagrama de Componentes:**

```
[Componente A] → [Componente B] → [Componente C]
```

**Flujo de Datos Principal:**

1. [Paso 1]
2. [Paso 2]
3. [Paso N]

---

## §3. Stack Técnico

| Capa | Tecnología | Justificación |
| --- | --- | --- |
| Frontend | [ej. React + Vite] | [por qué esta y no otra] |
| Backend | [ej. Zero-backend] | [por qué] |
| Datos | [ej. IndexedDB] | [por qué] |
| Hosting | [ej. GitHub Pages] | [por qué] |

---

## §4. Restricciones (Límites Intransgredibles)

> Estas restricciones anulan cualquier otra decisión. Son las líneas que no se cruzan.

1. [ej. Cero transmisión de datos del usuario fuera del navegador]
2. [ej. Compatibilidad con Chrome, Firefox y Safari]
3. [restricción N]

> Nota: Las restricciones registradas aquí se duplican defensivamente en `.agents/rules/03-constraints.md` para sobrevivir a la degradación de contexto en sesiones largas.

---

## §5. Trade-offs Acordados

> Decisiones donde se sacrificó una cualidad en favor de otra, con la razón explícita.

| Trade-off | A favor de | En contra de | Justificación |
| --- | --- | --- | --- |
| [ej. Bundle size vs funcionalidad] | [Funcionalidad] | [Bundle size] | [por qué se eligió esto] |

---

## §6. Interfaz y Experiencia de Usuario

**Atmósfera de referencia:** [Descripción del "feel" buscado. No adjetivos genéricos ("moderno", "limpio"); referentes concretos, colores, sensaciones, analogías.]

**Flujo principal del usuario:**

1. [Paso 1]
2. [Paso 2]
3. [Paso N]

**Componentes de interfaz:**

| Componente | Función | Archivo |
| --- | --- | --- |
| [ej. DropZone] | [ej. Área de carga de archivos] | [ej. src/components/DropZone.tsx] |

---

## §7. Especificaciones de Módulos

> Detalle técnico de cada módulo o componente crítico del sistema.

### 7.1. [Nombre del Módulo]

**Propósito:** [qué hace y por qué existe como módulo separado]

**Interfaz:**

```
[firma de función/API/endpoint]
```

**Dependencias:** [lista de dependencias]

---

## §8. Checklist de Verificación

> Sección canónica poblada por `/derive`. Si no se ha ejecutado `/derive`, escribir:
> "Pendiente de verificación formal; ejecutar `/derive` para poblar esta sección."

<!--
Taxonomía: [ACTOR.CATEGORÍA.NN.VER]
Actores: Definidos por /derive según el proyecto
Categorías: AV (Disponibilidad), FN (Funcionalidad), CR (Corrección), IN (Integridad), RS (Resiliencia)
Verificador (VER): LLM (automatizable), HUM (requiere humano), MIX (pre-verificable + humano)

Formato de check:
  🧑 `[ACTOR.CAT.NN.HUM]` Acción → Resultado. *(Promesa validada)*
  🤖 `[ACTOR.CAT.NN.LLM]` Acción → Resultado. *(Promesa validada)*
  🤖🧑 `[ACTOR.CAT.NN.MIX]` Acción → Resultado. *(Promesa validada)*

Formato de implementación (con timestamp obligatorio):
  ✅ Implementado (🤖 Verificado por [herramienta]; YYYY-MM-DD HH:MM)
  ✅ Implementado (🧑 Confirmado por usuario; YYYY-MM-DD HH:MM)
  ✅ Implementado (🤖🧑 Pre-verificado por [herramienta], confirmado por usuario; YYYY-MM-DD HH:MM)
-->
