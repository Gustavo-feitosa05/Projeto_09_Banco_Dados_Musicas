-- Mostrando a tabela
SELECT * FROM musicas

-- 1. Músicas mais populares (mais streams)
SELECT titulo, artista, streaming_count 
FROM musicas 
ORDER BY streaming_count DESC 
LIMIT 10;

-- 2. Artistas com mais músicas na lista
SELECT artista, COUNT(*) as total_musicas, 
       SUM(streaming_count) as total_streams
FROM musicas 
GROUP BY artista 
HAVING COUNT(*) > 1
ORDER BY total_musicas DESC, total_streams DESC;

-- 3. Músicas por década
SELECT 
    (ano_lancamento / 10) * 10 as decada,
    COUNT(*) as total_musicas,
    AVG(duracao_segundos) as media_duracao
FROM musicas 
GROUP BY decada 
ORDER BY decada;

-- 4. Gêneros musicais mais populares
SELECT genero, COUNT(*) as total, 
       AVG(streaming_count) as media_streams
FROM musicas 
GROUP BY genero 
ORDER BY total DESC;

-- 5. Músicas mais longas
SELECT titulo, artista, duracao_segundos, genero
FROM musicas 
ORDER BY duracao_segundos DESC 
LIMIT 10;

-- 6. Top artistas por total de streams
SELECT artista, SUM(streaming_count) as total_streams
FROM musicas 
GROUP BY artista 
ORDER BY total_streams DESC 
LIMIT 10;


-- 7. Quero saber quais os albuns do Michael Jackson estão na lista e quais os anos de lançamento dos albuns

-- 8. Quero ver somente as musicas de Rock da playlist
SELECT titulo, genero FROM musicas WHERE genero = "Rock"

-- 9. quero ver somente as musicas lançadas nos anos 90
SELECT titulo, ano_lancamento FROM musicas WHERE ano_lancamento >=1090 AND ano_lancamento <= 1999

-- 10. quero ver musicas lançadas apartir dos anos 2000
SELECT titulo, ano_lancamento FROM musicas WHERE ano_lancamento >=2000

-- 11. Adicione as informações a respeito da sua musica favorita.
INSERT INTO musicas (titulo, artista, album, genero, duracao_segundos, ano_lancamento, streaming_count) 
VALUES ('Carnaval', 'Kamaitachi', 'Festa', 'Pop', 195 , 2023, 3100000)

-- 12 .Adicione qualquer música de Funk que o professor odeia
INSERT INTO musicas (titulo, artista, album, genero, duracao_segundos, ano_lancamento, streaming_count) 
VALUES ('Voz do Coração', 'MC Cabelinho', 'Minha Raiz', 'Funk', 236, 2018, 540000000)

-- 13. remova essa música que você acabou de adicionar.
DELETE FROM musicas WHERE id = 125

-- 14. Conte quantas músicas a banda AC/DC tem 
SELECT titulo, artista,count(*) as total_musicas FROM musicas WHERE artista = "AC/DC"
SELECT count(*) as total_musicas FROM musicas WHERE artista = "AC/DC"

-- 15. conte quantas músicas de POP tem na playlist 
SELECT count (*) FROM musicas WHERE genero = "Pop"

-- 16. Ordene as musícas da mais velha para a mais nova.
SELECT * FROM musicas ORDER by ano_lancamento asc


SELECT * FROM musicas ORDER by id DESC


