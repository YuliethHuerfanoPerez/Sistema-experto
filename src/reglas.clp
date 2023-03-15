;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Definición de hechos y reglas ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(deftemplate gustos
(slot familia-olfativa)
(slot intensidad))

(deftemplate perfume
(slot nombre)
(slot familia-olfativa)
(slot intensidad))

(defrule regla-1
(gustos (familia-olfativa floral))
(perfume (familia-olfativa floral))
=>
(assert (recomendacion perfume)))

(defrule regla-2
(gustos (intensidad fuerte))
(perfume (intensidad fuerte))
=>
(assert (recomendacion perfume)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Definición de consultas y funciones ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defquery perfiles-recomendados
(declare (variables ?perfume))
(recomendacion ?perfume)
=>
(bind ?result (list ?perfume))
(printout t "Retornando resultados" crlf)
(return ?result))

(defun str-cat (?s1 ?s2)
(str-cat$ ?s1 ?s2))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Comentarios y documentación ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Este archivo define un sistema experto para recomendar perfumes
; basándose en los gustos del usuario. Las reglas establecen que si
; al usuario le gusta una familia olfativa o una intensidad específica,
; el sistema recomendará un perfume que coincida con esos gustos.

; La consulta "perfiles-recomendados" se utiliza para obtener los
; perfumes recomendados después de que se hayan ejecutado las reglas.

; La función "str-cat" se utiliza para concatenar cadenas de texto.