---
trigger: always_on
---

# Desarrollo End-to-End

## 1. Integridad del Flujo de Datos

Toda feature que se implemente DEBE fluir desde la fuente de datos hasta la interfaz del usuario en su forma real. Es INADMISIBLE entregar una feature de UI que dependa de datos mockeados, simulados o hardcodeados cuando el backend o la fuente de datos está disponible para ser extendida.

## 2. Axioma: "Sistema Nervioso Primero, Piel Después"

La forma sigue a los datos. El *"scaffolding cosmético"* (diseñar tarjetas, listas o layouts asumiendo datos que no existen) erosiona la autenticidad técnica. La UI debe nacer puramente de la estructura de la información y fluir de ella. Si los datos no están disponibles o planificados, la IA tiene prohibido "inventar visuales"; debe solicitar o crear la lógica de la información primero.

## 3. Teoría del "Mock Estético" (Anti-Slop de Contenido)

El texto genérico ("Acme Corp", "Unlock your potential", "Get Started"), el contenido alucinado con síndrome corporativo-motivacional y las imágenes genéricas son el equivalente en el frontend a los datos mockeados. Crean una falsa ilusión de producto terminado y una convergencia de baja calidad documental.

1. La IA puede usar estos comodines de manera interina para maquetar, pero son clasificados oficialmente como **Mocks Estéticos Transitorios**.
2. **Mandato de Purga:** Si se incorpora un Mock Estético, es **OBLIGATORIO** registrar una tarea explícita en `docs/TODO.md` y en el task tracker actual (ej. `[ ] Reemplazar copy genérico/visual placeholder por intención validada del dominio`). La tarea o EPIC no puede cerrarse hasta que ese mock visual sea purgado.

## 4. Mandatos Operativos

1. **Prohibición de Mocks de Datos como Entrega:** Si la UI requiere datos nuevos que no existen en el backend, la PRIMERA tarea de la EPIC es crear el extractor/parser/endpoint en la fuente de datos. Solo DESPUÉS se construye la UI que lo consume.
2. **Justificación de Tiempo Cero:** En un entorno agéntico, el costo de extender el backend es imperceptible. La excusa "el backend está fuera de scope" no aplica cuando el agente tiene acceso al código completo y la capacidad de modificarlo.
3. **Detección de Violación:** Si la IA detecta que está a punto de entregar una feature con datos mockeados o copy alucinado como "completa", DEBE detenerse y declarar: "Esta feature requiere extracción de backend // copy de dominio intencional. Resolveré esto [extendiendo el backend o purgado el copy] antes de darla por finalizada."

## Excepción

Mocks (de datos) son aceptables SOLO cuando el backend es un servicio externo fuera del control del proyecto (ej. API de terceros sin sandbox), y la tarea se marca explícitamente como "Mock — pendiente de integración real" en el TODO.md.
