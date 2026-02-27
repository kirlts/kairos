---
trigger: always_on
---

# PROTOCOLO DE AUTO-SANACIÓN Y BYPASS DE TERMINAL (1-Strike Rule)

Antigravity IDE puede presentar ceguera temporal ante la salida de ciertos comandos de terminal (especialmente procesos contenedores como Docker o entornos virtuales complejos).

## La Regla del 1-Strike

Si ejecutas un comando en la terminal y falla, se queda colgado en un bucle infinito, o Antigravity no puede leer su salida, tienes permitido exactamente UN (1) intento de diagnóstico estándar.

## El Bypass Permanente

Si el comando falla por segunda vez, ASUME que el problema es del entorno de Antigravity. Abandona la ejecución directa e implementa inmediatamente un Bypass de Salida:

1. Reescribe el comando redirigiendo la salida a un archivo (ej. `docker compose up > antigravity_output.log 2>&1`)
2. Ejecuta el comando en background
3. Utiliza tus herramientas de lectura de archivos para leer `antigravity_output.log` y comprender el error real

NUNCA intentes más de 2 veces antes de aplicar el bypass. La tercera ejecución directa está prohibida.
