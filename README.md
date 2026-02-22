# Kairós en Antigravity IDE

Este repositorio es una plantilla *greenfield* para proyectos desarrollados mediante colaboración Humano-IA utilizando **Antigravity IDE**. Implementa de manera nativa y exhaustiva la **Metodología Kairós** (Constitución V0.99) y el **Instrumento de Medición Kairós 4.0 (IMK)** como una arquitectura de meta-gobernanza.

El objetivo de este repositorio no es ser un "asistente" de código, sino forzar un entorno de **forja sinérgica**, donde cada decisión técnica se somete a escrutinio socrático, tensión estratégica y auditoría estricta antes de escribir la primera línea de código.

## 🏛️ Arquitectura de Gobernanza

La gobernanza de Kairós está embebida directamente en el "cerebro" del IDE a través de archivos persistentes que controlan la atención y el comportamiento del agente:

* **`/.agent/rules/`**: Contiene la física operativa fundamental basada en la Constitución Kairós. Estas reglas (con el *trigger* `always_on`) aseguran que el agente opere siempre bajo la doble fuerza de **Kratos** (estructura, viabilidad, convergencia) y **Khaos** (potencial, propósito, divergencia).
* **`/.agent/workflows/`**: Secuencias de comando estrictas que obligan a seguir ritos metodológicos como `/forja` (diseño estratégico socrático antes de codificar), `/test` (ciclo de autosanación) y `/audit` (medición rigurosa IMK 4.0).
* **`/.agent/skills/`**: Módulos de comportamiento activados contextualmente, como `auditoria-transparencia` (despliega alternativas descartadas si el humano las pide), `ciclo-evolutivo` (cosecha lecciones de métricas reales) y `guardian-integridad` (detiene operaciones cuando se violan límites intransgredibles).

## 🗂️ El Eje Documental (`/docs/`)

ESTÁ ESTRICTAMENTE PROHIBIDO (por las Reglas Operativas) modificar código sin que la trilogía documental esté actualizada y alineada:

1. **`MASTER-SPEC.md` (La Especificación Maestra):** Registra "el qué" y "el cómo". Define la arquitectura de alto nivel, el propósito central (outcome) y las restricciones de diseño acordadas. Todo desarrollo debe servir a este documento.
2. **`TODO.md` (La Condición de Arranque):** Estructurado en Épicas e Historias de Usuario. Exige la inclusión de los `Chat IDs` de Antigravity (ej. ``) junto a cada tarea terminada para garantizar trazabilidad histórica.
3. **`MEMORY.md` (La Memoria del Proyecto):** Un registro ininmutable (*Append-Only*) que acumula la memoria evolutiva: tensiones resueltas, hitos cerrados, correcciones arquitectónicas, y los resultados de las auditorías (PDK).

## 🚀 Flujos de Trabajo Principales (Workflows)

Antigravity puede invocar los siguientes flujos de trabajo en cualquier momento mediante "Slash Commands":

* **/forja:** Inicia el **Ritual de la Forja Estratégica**. El agente suspende la escritura de código para enfocar al usuario en definir la intención, restricciones y tensiones, generando un *Implementation Plan* a ser validado antes de proceder.
* **/audit:** Ejecuta el **Instrumento de Medición Kairós (IMK 4.0)**. El agente inspecciona la transcripción reciente del chat y asigna puntuaciones a la Alineación, Integridad, Eficiencia y Sinergia, depositando el diagnóstico (PDK) al final del `MEMORY.md`.
* **/test:** Inicia el ciclo de diseño y ejecución de pruebas apuntando a validar el límite intransgredible actual, aplicando protocolos de auto-sanación si falla la terminal.

## 🤝 Cómo Empezar un Nuevo Proyecto

1. Clona este repositorio como base para tu nuevo proyecto.
2. Inicia Antigravity IDE. Las reglas ocultas en `.agent/` tomarán el control automáticamente.
3. Comienza por definir tu propósito y arquitectura de alto nivel en `docs/MASTER-SPEC.md`.
4. Crea tus primeras historias y subtareas en `docs/TODO.md`.
5. Usa el comando `/forja` en tu primer prompt para que el agente inicie el co-diseño socrático de tu primer componente.
