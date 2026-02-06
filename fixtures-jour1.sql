-- AnimePress - Dataset pédagogique
-- Base de données transformée en blog sur les animés

-- Catégories d'animés
INSERT INTO category (name, slug) VALUES
('Shonen', 'shonen'),
('Seinen', 'seinen'),
('Isekai', 'isekai'),
('Mecha', 'mecha'),
('Slice of Life', 'slice-of-life');

-- Articles sur les animés (avec author_id = 2)
INSERT INTO article (title, slug, content, created_at, category_id, author_id) VALUES
('One Piece : L''odyssée de Luffy', 'one-piece-odyssee-luffy',
'One Piece suit les aventures de Monkey D. Luffy, un jeune pirate au corps élastique qui rêve de devenir le Roi des Pirates. Avec son équipage du Chapeau de Paille, il parcourt Grand Line à la recherche du trésor légendaire One Piece. L''anime compte plus de 1000 épisodes et reste l''un des shonen les plus populaires au monde.', NOW(), 1, 2),

('Attack on Titan : Une œuvre magistrale', 'attack-on-titan-oeuvre-magistrale',
'L''Attaque des Titans (Shingeki no Kyojin) a révolutionné le genre seinen avec son intrigue complexe et ses rebondissements inattendus. L''histoire d''Eren Jaeger et de l''humanité face aux Titans offre une réflexion profonde sur la liberté, la guerre et la nature humaine. La fin controversée continue de diviser les fans.', NOW(), 2, 2),

('Sword Art Online : Pionnier de l''isekai moderne', 'sword-art-online-pionnier-isekai',
'SAO a popularisé le concept d''isekai dans les années 2010. Kirito et Asuna piégés dans un MMORPG virtuel où la mort dans le jeu signifie la mort réelle ont captivé des millions de fans. Malgré les critiques, l''anime reste une référence du genre et a inspiré de nombreuses œuvres similaires.', NOW(), 3, 2),

('Neon Genesis Evangelion : Déconstruction du mecha', 'evangelion-deconstruction-mecha',
'Evangelion a redéfini le genre mecha en 1995. Au-delà des combats de robots géants contre les Anges, l''anime explore la psyché de Shinji Ikari et pose des questions existentielles. Son influence sur la culture anime est immense, et ses thèmes restent d''actualité 30 ans après.', NOW(), 4, 2),

('Demon Slayer : Le phénomène Kimetsu', 'demon-slayer-phenomene-kimetsu',
'Demon Slayer (Kimetsu no Yaiba) est devenu un phénomène mondial grâce à son animation spectaculaire par Ufotable. L''histoire de Tanjiro cherchant à sauver sa sœur Nezuko transformée en démon a conquis le public. Le film Mugen Train a battu tous les records au box-office japonais.', NOW(), 1, 2),

('Steins;Gate : Le thriller temporel ultime', 'steins-gate-thriller-temporel',
'Steins;Gate est considéré comme l''un des meilleurs animes de science-fiction. Okabe Rintaro et son laboratoire découvrent accidentellement le voyage dans le temps. L''anime mélange humour, tension et émotions avec une intrigue parfaitement construite. Un chef-d''œuvre du genre seinen.', NOW(), 2, 2),

('Violet Evergarden : La beauté de l''émotion', 'violet-evergarden-beaute-emotion',
'Kyoto Animation signe avec Violet Evergarden un anime d''une beauté visuelle époustouflante. L''histoire de Violet, ancienne soldate apprenant à comprendre les émotions humaines en devenant Doll (écrivaine publique), touche au cœur. Chaque épisode est une leçon de vie empreinte de poésie.', NOW(), 5, 2),

('Gundam : L''héritage du Real Robot', 'gundam-heritage-real-robot',
'Mobile Suit Gundam a lancé en 1979 le concept de Real Robot, opposé aux Super Robots. La franchise explore les conflits de guerre, la politique et l''humanité à travers des combats de mobile suits. Avec des dizaines de séries, Gundam reste le pilier du genre mecha et une icône culturelle japonaise.', NOW(), 4, 2);
