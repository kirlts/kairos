---
name: protocolo-excelencia-visual
description: Se activa para garantizar que los artefactos visuales y de experiencia cumplan con el Norte Estético de Kairós, traduciendo atmósferas en tokens técnicos de precisión. Codifica la Huella Paramétrica del AI Smell para forzar desvío preemptivo.
---

# Protocolo: Excelencia Visual

Este protocolo operacionaliza la Rule 06. Su función es actuar como el "Arquitecto de Sistemas de Diseño" de Kairós, armado con el conocimiento empírico de los patrones de convergencia estadística que los LLMs producen por inercia.

## 0. Fase de Purga de Inercia (PREVIA A TODO — MANDATORIO)

Antes de inhalar contexto o derivar tokens, el agente **DEBE** cargar conscientemente la siguiente lista de valores de convergencia. Estos son los valores que la distribución estadística del modelo producirá por defecto si no se desvía deliberadamente. **Nada en esta lista está prohibido per se; lo que está prohibido es la coincidencia injustificada.**

### Lista Negra de Convergencia (LNC)

| Eje | Valor de Inercia Estadística | Desvío Requerido |
|---|---|---|
| **COLOR** | `#6366F1`, `#8B5CF6→#3B82F6`, `#10B981`, fondos `#09090B/#18181B`. Gradientes purple→blue en texto hero vía `bg-clip-text`. | Derivar paleta propia en OKLCH con luminosidad consistente entre pares fondo-texto. |
| **FUENTE** | Inter, system-ui, sans-serif como familia única. H1 = 48px/800/tracking-tight. Ratio H1:body ≥ 3:1 sin escalas intermedias. | Seleccionar ≥ 1 fuente con carácter. Escala proporcional modulada (Áurea, Tercera Menor, Cuarta Perfecta). Uso de `clamp()` para fluidez responsiva. |
| **LAYOUT** | `max-w-7xl mx-auto`, `grid-cols-3` simétrico, `text-center items-center` universal. Single-page scroll sin routing. | Introducir ≥ 1 composición asimétrica o de ancho fluido. Routing real si hay ≥ 2 contextos temáticos. |
| **ESPACIO** | `p-6`/`gap-4`/`gap-6` indiscriminado. Ratio macro:micro < 3:1. Hero con padding vacío sobredimensionado. | Ratio macro:micro ≥ 4:1. Variación intencional en spacing. Valores "impuros" (12px, 20px, 40px) permitidos si sirven al ritmo. |
| **SUPERFICIE** | `rounded-xl`/`rounded-2xl` + `border-gray-200` + `shadow-md` en todo. "Cards Everywhere": todo envuelto en contenedores idénticos. | Radios, sombras y bordes diferenciados por nivel de affordance. Sombras coloreadas o multicapa cuando la atmósfera lo demande. |
| **ÍCONOS** | Emojis Unicode (🔒⚡🚀) como íconos funcionales. Lucide React / Heroicons sin custom. SVG blobs decorativos sin propósito. URLs de Unsplash genéricas. | 0 emojis funcionales. Si se usa una librería de íconos, complementar con assets propios o variantes. 0 ornamentación sin función informativa. |
| **MOVIMIENTO** | `transition-all duration-300 ease-in-out` universal. Fade-in-up en todo al scroll sin stagger. Framer Motion importado para animaciones triviales. | Transiciones selectivas por propiedad (no `transition-all`). Duración y easing variados según dirección (ease-out para entradas, ease-in para salidas). Stagger secuencial entre elementos hermanos. |
| **ESTADOS** | `hover:scale-105`/`hover:-translate-y-1` en elementos no interactivos. `focus:outline-none` sin compensación. Skeleton screens en componentes triviales. Toasts sin categorización de severidad. | Hover SOLO en elementos clicables. `:focus-visible` en todo elemento focusable. Skeleton screens solo para carga de página completa. Toasts con color diferenciado por tipo (error/success/warning). |
| **NAVEGACIÓN** | Logo izq + links centro + CTA "Get Started" derecha. Footer de 4 columnas ("Producto", "Compañía", "Recursos", "Legal") con links `href="#"`. | 0 links a `#`. Footer con contenido real. Navbar que responda a la arquitectura de información del proyecto, no al arquetipo genérico. |
| **COPY** | "Get Started", "Learn More", "Try for Free", "Unlock your potential", "Elevate your workflow". Feature lists = [Emoji] + [Bold] + [1 línea genérica]. "Something went wrong" como error global. Testimonios de "Acme Corp". | CTAs que describan la acción concreta del dominio. Copy que contenga jerga específica del nicho. Mensajes de error contextuales. 0 testimonios ficticios presentados como reales. |

**Mandato de Fase 0:** El agente declara en el chat: "Procedo a inhalar la atmósfera del proyecto." (La carga de la LNC es interna y silenciosa; el usuario no debe ver la tabla ni terminología interna.)

## 1. Fase de Inhalación y Análisis (MANDATORIO)

El agente **DEBE** realizar los siguientes pasos antes de generar código:

1. **Auditoría de Contexto Brownfield:** **OBLIGATORIO** inspeccionar archivos de estilo existentes (`css`, `tailwind.config`, `theme`). Identificar constraints legacy.
2. **Test Interno de Intercambiabilidad (Prueba de Dominio):** **FILTRO COGNITIVO SILENCIOSO.** El agente debe preguntarse internamente: *"Si sustituyo el logo por el de una panadería o una corporación genérica cruzada, ¿este copy/layout seguiría aplicando perfectamente?"*. Si es así, el artefacto carece de anclaje de dominio y es esclavo del slop estadístico. Se debe inyectar intencionalidad específica (funcionalidad de alto valor o copy experto) antes de emitirlo.
3. **Extracción de ADN Visual:** Si se solicita una atmósfera nueva, derivar el sistema de espaciado, curvatura y luz.
4. **Identidad Tipográfica:** **MANDATO** de calcular peso, tracking y leading específicos.
5. **Curva Cromática OKLCH:** Establecer la lógica de color innegociable.

## 2. Derivación de Tokens (PROHIBIDO EL HARDCODING)

1. **Escala de Ritmo:** **OBLIGATORIO** definir la unidad base y su progresión matemática.
2. **Matriz de Jerarquía:** **MANDATO** de forzar la lectura dirigida mediante contrastes calculados.
3. **Sintonía de Tensión:** Ajustar densidad según el contexto.

## 3. Auditoría de Criterio Senior (Checklist de Bloqueo)

**PROHIBIDO** entregar el artefacto si falla cualquiera de estos gates:

### Gate A — Pureza Anti-Slop (mecánica)
Verificación binaria contra la LNC:
* **Colisión injustificada con LNC:** Si ≥ 3 valores del artefacto coinciden con la Lista Negra de Convergencia **sin justificación atmosférica explícita** → **BLOQUEO**. El agente DEBE reescribir con valores derivados de la atmósfera inhalada.
* **Emoji como ícono:** Si ≥ 1 emoji Unicode funciona como ícono de interfaz → **BLOQUEO**.
* **Links muertos:** Si ≥ 1 enlace apunta a `#` sin ser un placeholder declarado → **BLOQUEO**.
* **Copy genérico:** Si un CTA usa cadenas literales de la LNC ("Get Started", "Learn More", etc.) sin reescritura al dominio → **BLOQUEO**.

### Gate B — Armonía Intencional (cognitiva — aquí reside el juicio que ningún linter puede emitir)
Evaluación contextual que requiere razonamiento:
* **Coherencia Atmosférica:** ¿Cada decisión visual (color, fuente, radius, spacing) es justificable desde la atmósfera inhalada, o es un residuo de inercia estadística? → Bloqueo si hay residuo.
* **Armonía Geométrica:** ¿Se respeta el sistema de ritmo derivado en la Fase 2? → Bloqueo si no.
* **Integridad de Affordance:** ¿Los elementos con efecto hover son realmente interactivos? ¿Los elementos focusables tienen `:focus-visible`? → Bloqueo si no.
* **Densidad con propósito:** ¿El espacio vacío comunica agrupación semántica (Gestalt), o es padding genérico? → Bloqueo si es genérico.

### Gate C — Integridad Contextual (brownfield)
* **Integridad Legacy:** ¿Se han respetado las restricciones del `MASTER-SPEC` §4 y el sistema brownfield? → Bloqueo si no.
* **Conflicto Legacy ↔ Armonía:** Si una ley de armonía contradice una restricción legacy, el agente **DEBE** declarar el bloqueo y solicitar un veredicto al usuario.

## 4. Mandato de Salida

* **Escritura:** Documentar en el chat:
  1. Atmósfera de referencia inhalada.
  2. ≥ 3 desvíos ejecutados respecto a la LNC, con justificación.
  3. Justificación explícita de cualquier valor que coincida con la LNC (la coincidencia justificada pasa; la injustificada no).
  4. Certificación de ausencia de slop.
* **Sigilo Sintáctico:** **REGLA DE VIDA:** No uses terminología interna (LNC, Gate A/B/C, Purga de Inercia). Transforma los principios en comunicación profesional estándar. El usuario debe percibir rigor técnico, no burocracia metodológica.
