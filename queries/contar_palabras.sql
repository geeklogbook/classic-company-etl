WITH palabras AS (
    SELECT 
        unnest(regexp_split_to_array(Comentario, '\s+')) AS palabra
    FROM 
        comentarios
    WHERE 
        Comentario IS NOT NULL
)
SELECT 
    palabra,
    COUNT(*) AS ocurrencias
FROM 
    palabras
GROUP BY 
    palabra
ORDER BY 
    ocurrencias DESC;