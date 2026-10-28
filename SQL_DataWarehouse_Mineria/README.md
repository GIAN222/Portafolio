Análisis Demográfico y Tendencias Ocupacionales 

Objetivo del Proyecto
El objetivo de este proyecto es descubrir y analizar las tendencias ocupacionales y demográficas de la población reflejada en la base de datos. Utilizando técnicas de minería de datos, buscamos responder preguntas de negocio como: ¿Cuáles son los perfiles profesionales dominantes por región? 

Algoritmo y Metodología (DBSCAN)
Para este análisis, se implementó el algoritmo de agrupamiento DBSCAN (Density-Based Spatial Clustering of Applications with Noise). A diferencia de modelos como K-Means, DBSCAN no requiere que le indiquemos cuántos grupos existen de antemano. Es ideal para este proyecto exploratorio, ya que agrupa a los ciudadanos basándose puramente en la densidad de sus características (edad, ciudad, ocupación) y aísla los valores atípicos que no representan una tendencia poblacional.

Metodología:El proyecto sigue el ciclo de vida **CRISP-DM / KDD**, abarcando desde la extracción SQL hasta el modelado matemático.

---
Resultados: Interpretación y Análisis Comercial.
El algoritmo dividió a los 53 ciudadanos de la muestra en tres clústeres principales, revelando tendencias de mercado muy claras:

1. Perfil Tecnológico y Especializado: Representa el 34% de la muestra. Son ciudadanos locales ubicados en Bogotá con profesiones predominantes como Ingenieros de Software (28%) y Médicos (22%).
2.  Perfil Corporativo Internacional (Posibles Nómadas Digitales): Abarca el 30% del grupo. Compuesto netamente por talento extranjero operando roles digitales altamente conectivos (Contadores, Desarrolladores, Diseñadores). Demostró ser un perfil estable y de dedicación exclusiva a su actividad principal.
3.  Ecosistema Legal y Tecnológico en Medellín: Representa el 28%. Destaca como el ecosistema de mayor dinamismo y pluriempleo (26% de la población mantiene actividades económicas secundarias simultáneas). Está impulsado fuertemente por Analistas de Calidad (33%) y el sector legal (20%).

(El 7% restante fue clasificado matemáticamente como perfiles atípicos/ruido).
