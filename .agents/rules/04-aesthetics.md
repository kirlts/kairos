---
description: Aplica cuando la tarea involucra generación o modificación de contenido visual (CSS, HTML, componentes de frontend, diseño de experiencia de usuario, documentos formateados PDF/EPUB, imágenes, diagramas, o cualquier artefacto destinado a la percepción visual humana).
---

# Armonía visual

Los principios de armonía visual son universales a todo contenido visual. Estas leyes gobiernan la generación de interfaces web, documentos formateados, imágenes y diagramas.

## Leyes de armonía

| Ley | Constraint | Violación detectable |
|---|---|---|
| **Proporción dinámica** | Los sistemas de escala armónica (Proporción Áurea, Tercera Menor, Cuarta Perfecta) gobiernan la relación entre elementos. La función `clamp()` se usa para fluidez responsiva | Ratio H1:body ≥ 3:1 sin escalas intermedias. Múltiplos rígidos (1rem → 2rem → 3rem) sin proporción modulada |
| **Equilibrio de masas** | El espacio negativo es un elemento activo de diseño. La distribución de peso visual es intencional, no simétrica por defecto | Layout simétrico centralizado universal (`max-w-7xl mx-auto text-center`) sin variación compositiva |
| **Contraste perceptual** | El cálculo de color opera en espacios perceptualmente uniformes (OKLCH). La relación de luminosidad entre pares fondo-texto se modula explícitamente | Valores hexadecimales arbitrarios sin relación de luminosidad. Acentos saturados sobre fondos oscuros sin compensación |
| **Ritmo y repetición** | Una unidad de medida base (x) y sus múltiplos gobiernan el spacing. El ratio macro:micro es ≥ 4:1 | `p-6`/`gap-4` indiscriminado. Ratio macro:micro < 3:1. Padding genérico sin agrupación semántica |
| **Accesibilidad (A11y)** | Los contrastes son legibles. Los anillos de enfoque (`:focus-visible`) son visibles para navegación por teclado. La jerarquía HTML es semántica. Hover exclusivamente en elementos interactivos | `focus:outline-none` sin compensación. Hover en elementos no clicables. Div-soup sin semántica |

## Regla anti-default

Las soluciones por defecto del modelo (fuentes, colores, layouts, radios, sombras) requieren justificación atmosférica. La coincidencia con los valores de inercia estadística del modelo no está prohibida; la coincidencia sin justificación sí lo está. Para la lista completa de valores de convergencia, referir `@knowledge/ai-smell-registry.md`.
