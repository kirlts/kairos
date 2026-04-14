# Lista Negra de Convergencia (LNC)

Valores de inercia estadística de los LLMs al generar interfaces. La coincidencia con estos valores requiere justificación atmosférica explícita.

| ID | Eje | Valor de inercia | Contexto de aparición | Desvío requerido |
|---|---|---|---|---|
| LNC-01 | Color primario | `#6366F1` (indigo-500), `#8B5CF6` (purple-500) | Botones, links, acentos primarios | Derivar paleta propia en OKLCH con luminosidad consistente entre pares fondo-texto |
| LNC-02 | Gradiente hero | `#8B5CF6→#3B82F6` (purple→blue) vía `bg-clip-text` | Headings hero, fondos de secciones principales | Gradiente derivado de la atmósfera del proyecto. Si el gradiente no sirve a la identidad, no usar gradiente |
| LNC-03 | Verde emergente | `#10B981` (emerald-500) como acento post-púrpura | Badges de éxito, indicadores de estado, CTAs secundarios | Color derivado de la identidad cromática del proyecto |
| LNC-04 | Superficie oscura | `#09090B` / `#18181B` (zinc-950/900) | Fondos en modo oscuro, navbars, footers | Superficie derivada con tono y luminosidad intencional |
| LNC-05 | Fuente universal | Inter, system-ui, sans-serif como familia única. 48px/800/tracking-tight en H1 | Toda la tipografía del sitio, sin variación tipográfica | ≥1 fuente con carácter. Escala modulada (Áurea, Tercera Menor, Cuarta Perfecta). `clamp()` para fluidez |
| LNC-06 | Layout simétrico | `max-w-7xl mx-auto`, `grid-cols-3` simétrico, `text-center items-center` universal | Estructura general de toda la página, secciones, grids | ≥1 composición asimétrica o de ancho fluido. Routing real si ≥2 contextos temáticos |
| LNC-07 | Espacio uniforme | `p-6`/`gap-4`/`gap-6` indiscriminado. Ratio macro:micro <3:1 | Spacing entre componentes, padding de cards, gaps de grids | Ratio macro:micro ≥4:1. Variación intencional en spacing |
| LNC-08 | Superficie genérica | `rounded-xl` + `border-gray-200` + `shadow-md` en todo. Cards idénticas | Tarjetas, contenedores, modales, dropdowns | Radios, sombras y bordes diferenciados por nivel de affordance |
| LNC-09 | Movimiento uniforme | `transition-all duration-300 ease-in-out` universal. Fade-in-up sin stagger | Todas las animaciones y transiciones del sitio | Transiciones selectivas por propiedad. Duración y easing variados. Stagger secuencial |
| LNC-10 | Copy corporativo | «Get Started», «Learn More», «Unlock your potential», «Seamless experience», «Cutting-edge» | CTAs, taglines, descripciones de features, onboarding | CTAs que describan la acción concreta del dominio. Copy con jerga del nicho. 0 testimonios ficticios |
