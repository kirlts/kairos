# MASTER-SPEC — [Nombre del Proyecto] v0.1.0

> [Descripción de una línea del proyecto]

---

## §1. Identidad del Proyecto

**Propósito:** [Qué hace, para quién, y por qué importa — máximo 3 oraciones]

**Nombre:** [Nombre del proyecto]

**Dominio:** [Categoría del problema: ej. "Seguridad de datos", "Educación", "Productividad"]

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
| Frontend | [ej. React + Vite] | [por qué] |
| Backend | [ej. Zero-backend] | [por qué] |
| Datos | [ej. IndexedDB] | [por qué] |
| Hosting | [ej. GitHub Pages] | [por qué] |

---

## §4. Restricciones (Límites Intransgredibles)

> Estas restricciones NO son negociables y anulan cualquier otra decisión.

1. [ej. Cero transmisión de datos del usuario fuera del navegador]
2. [ej. Compatibilidad con Chrome, Firefox y Safari]
3. [restricción N]

---

## §5. Trade-offs Acordados

> Decisiones donde se sacrificó una cualidad en favor de otra, con justificación.

| Trade-off | A favor de | En contra de | Justificación |
| --- | --- | --- | --- |
| [ej. Bundle size vs funcionalidad] | [Funcionalidad] | [Bundle size] | [por qué] |

---

## §6. Interfaz y Experiencia de Usuario

**Atmósfera de referencia:** [Descripción del "feel" buscado]

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

**Propósito:** [qué hace]

**Interfaz:**

```
[firma de función/API/endpoint]
```

**Dependencias:** [lista de dependencias]

---

## §8. Checklist de Verificación

> Sección canónica poblada por `/derive`. Si no se ha ejecutado `/derive`, escribir:
> "Pendiente de verificación formal — ejecutar `/derive` para poblar esta sección."

<!-- 
Taxonomía: [ACTOR.CATEGORÍA.NN]
Actores: Definidos por /derive según el proyecto
Categorías: AV (Disponibilidad), FN (Funcionalidad), CR (Corrección), IN (Integridad), RS (Resiliencia)
-->

---

## §9. Ambiente y Entorno (Opcional)

> Poblado por el workflow `/contain`.
> Estrategia de contenedores, aislamiento, o setup local.

