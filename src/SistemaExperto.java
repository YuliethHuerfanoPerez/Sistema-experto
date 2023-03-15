import jess.*;

public class SistemaExperto {
    public static void main(String[] args) throws JessException {
        // Inicialización del motor Jess
        Rete engine = new Rete();
        engine.reset();

        // Cargar hechos
        engine.eval("(deftemplate gustos (slot aroma) (slot intensidad))");
        engine.eval("(deftemplate perfume (slot nombre) (slot aroma) (slot intensidad))");

        engine.eval("(assert (gustos (aroma floral) (intensidad suave)))");
        engine.eval("(assert (gustos (aroma oriental) (intensidad fuerte)))");
        engine.eval("(assert (gustos (aroma citrico) (intensidad suave)))");

        engine.eval("(assert (perfume (nombre Perfume1) (aroma floral) (intensidad suave)))");
        engine.eval("(assert (perfume (nombre Perfume2) (aroma oriental) (intensidad fuerte)))");
        engine.eval("(assert (perfume (nombre Perfume3) (aroma citrico) (intensidad suave)))");
        engine.eval("(assert (perfume (nombre Perfume4) (aroma floral) (intensidad fuerte)))");

        // Cargar reglas
        engine.eval("(defrule recomendar-perfume-1"
            + " (gustos (aroma ?aroma) (intensidad ?intensidad))"
            + " (perfume (aroma ?aroma) (intensidad ?intensidad) (nombre ?nombre))"
            + " =>"
            + " (printout t \"Te recomendamos el perfume: \" ?nombre crlf))");

        engine.eval("(defrule recomendar-perfume-2"
            + " (gustos (aroma ?aroma))"
            + " (perfume (aroma ?aroma) (intensidad ?intensidad) (nombre ?nombre))"
            + " =>"
            + " (printout t \"Te recomendamos el perfume: \" ?nombre crlf))");

        engine.eval("(defrule recomendar-perfume-3"
            + " (gustos (intensidad ?intensidad))"
            + " (perfume (aroma ?aroma) (intensidad ?intensidad) (nombre ?nombre))"
            + " =>"
            + " (printout t \"Te recomendamos el perfume: \" ?nombre crlf))");

        // Ejecutar el motor Jess
        engine.run();
    }
}