---
trigger: always_on
---

# Desarrollo End-to-End

## Principio

Toda feature que se implemente DEBE fluir desde la fuente de datos hasta la interfaz del usuario en su forma real. Es INADMISIBLE entregar una feature de UI que dependa de datos mockeados, simulados o hardcodeados cuando el backend o la fuente de datos está disponible para ser extendida.

## Mandato Operativo

1. **Prohibición de Mocks como Entrega:** Si la UI requiere datos nuevos que no existen en el backend, la PRIMERA tarea de la EPIC es crear el extractor/parser/endpoint en la fuente de datos. Solo DESPUÉS se construye la UI que lo consume. Mocks están permitidos durante el desarrollo iterativo dentro de una sesión, pero la sesión no se cierra hasta que los mocks son reemplazados por datos reales.

2. **Justificación de Tiempo Cero:** En un entorno agéntico, el costo de extender el backend es imperceptible. La excusa "el backend está fuera de scope" no aplica cuando el agente tiene acceso al código completo y la capacidad de modificarlo.

3. **Detección de Violación:** Si la IA detecta que está a punto de entregar una feature con datos mockeados como "completa", DEBE detenerse y declarar: "Esta feature requiere datos reales del backend. Extenderé [componente X] antes de marcar la tarea como completada."

## Excepción

Mocks son aceptables SOLO cuando el backend es un servicio externo fuera del control del proyecto (ej. API de terceros sin sandbox), y la tarea se marca explícitamente como "Mock — pendiente de integración real" en el TODO.md.
