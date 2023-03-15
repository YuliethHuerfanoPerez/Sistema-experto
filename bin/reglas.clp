;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Definici�n de hechos y reglas ;;;;
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
;;; Definici�n de consultas y funciones ;;;;
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
;;; Comentarios y documentaci�n ;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Este archivo define un sistema experto para recomendar perfumes
; bas�ndose en los gustos del usuario. Las reglas establecen que si
; al usuario le gusta una familia olfativa o una intensidad espec�fica,
; el sistema recomendar� un perfume que coincida con esos gustos.

; La consulta "perfiles-recomendados" se utiliza para obtener los
; perfumes recomendados despu�s de que se hayan ejecutado las reglas.

; La funci�n "str-cat" se utiliza para concatenar cadenas de texto.