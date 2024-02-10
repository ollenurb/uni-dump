\c plant_pathology;
TRUNCATE TABLE plants, pathogens_hosts, plants_names;

-- Plants found to be host to stored pathogens
INSERT INTO plants(eppo_code, name, phylum_eppo_code, phylum_name, family_eppo_code, family_name) VALUES
    ('1ACAG', 'Acacia', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('ANURE', 'Annona reticulata', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('LOLPE', 'Lolium perenne', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('IUGMN', 'Juglans mandshurica', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('PIEGL', 'Picea glehnii', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('PRNDO', 'Prunus domestica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('SETVE', 'Setaria verticillata', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('PIEAB', 'Picea abies', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('1ACRG', 'Acer', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('1GRAF', 'Poaceae', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('1IUGG', 'Juglans', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('ABOME', 'Aronia melanocarpa', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PRNCE', 'Prunus cerasus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('MORBO', 'Morus bombycis', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('FESAR', 'Lolium arundinaceum', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('BRSOB', 'Brassica oleracea var. botrytis', '1MAGP', 'Magnoliophyta', '1CRUF', 'Brassicaceae'),
    ('ORYSA', 'Oryza sativa', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('CYLHE', 'Corylus heterophylla', '1MAGP', 'Magnoliophyta', '1CRLF', 'Corylaceae'),
    ('PRNDT', 'Prunus domestica subsp. insititia', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ECHCG', 'Echinochloa crus-galli', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('ACRNE', 'Acer negundo', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('ABISB', 'Abies sibirica', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('PRNSN', 'Prunus spinosa', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PRNDU', 'Prunus dulcis', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PTLGL', 'Drymocallis glandulosa', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PRNAR', 'Prunus armeniaca', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CIAPA', 'Carica papaya', '1MAGP', 'Magnoliophyta', '1CAAF', 'Caricaceae'),
    ('MORAL', 'Morus alba', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('PESCI', 'Cenchrus ciliaris', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('PRNBU', 'Prunus buergeriana', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('IUGCI', 'Juglans cinerea', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('ALUFO', 'Alnus formosana', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('PYUCO', 'Pyrus communis', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('HELAN', 'Helianthus annuus', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('ABINE', 'Abies nephrolepis', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('CSNCR', 'Castanea crenata', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('FATJA', 'Fatsia japonica', '1MAGP', 'Magnoliophyta', '1ARLF', 'Araliaceae'),
    ('PIUPN', 'Pinus pinea', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('PYUSS', 'Pyrus sp.', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PIUSI', 'Pinus sylvestris', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('1CNMG', 'Chaenomeles', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CYLAV', 'Corylus avellana', '1MAGP', 'Magnoliophyta', '1CRLF', 'Corylaceae'),
    ('FRAVI', 'Fragaria virginiana', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('MABSY', 'Malus sylvestris', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ALLCE', 'Allium cepa', '1MAGP', 'Magnoliophyta', '1AMYF', 'Amaryllidaceae'),
    ('BUXBA', 'Buxus balearica', '1MAGP', 'Magnoliophyta', '1BUXF', 'Buxaceae'),
    ('1CSNG', 'Castanea', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('QUEFR', 'Quercus frainetto', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('ALUGL', 'Alnus glutinosa', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('BRWSP', 'Browallia speciosa', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('LAXDE', 'Larix decidua', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('CIDSI', 'Citrus x aurantium var. sinensis', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('CSNHE', 'Castanea henryi', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('QUEPE', 'Quercus petraea', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('ACRPE', 'Acer pensylvanicum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('CIPBE', 'Carpinus betulus', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('BUXMI', 'Buxus microphylla', '1MAGP', 'Magnoliophyta', '1BUXF', 'Buxaceae'),
    ('BRSOX', 'Brassica oleracea', '1MAGP', 'Magnoliophyta', '1CRUF', 'Brassicaceae'),
    ('ATIFU', 'Actinidia fulvicoma', '1MAGP', 'Magnoliophyta', '1ACTF', 'Actinidiaceae'),
    ('ABISA', 'Abies sachalinensis', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('1CAHG', 'Camellia', '1MAGP', 'Magnoliophyta', '1THEF', 'Theaceae'),
    ('AILAL', 'Ailanthus altissima', '1MAGP', 'Magnoliophyta', '1SIMF', 'Simaroubaceae'),
    ('ALLTU', 'Allium tuberosum', '1MAGP', 'Magnoliophyta', '1AMYF', 'Amaryllidaceae'),
    ('SAXSS', 'Salix sp.', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('CSNSA', 'Castanea sativa', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('IUGCA', 'Juglans californica', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('PRNDV', 'Prunus davidiana', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PESGL', 'Cenchrus americanus', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('PRNCF', 'Prunus cerasifera', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CEMEL', 'Cestrum elegans', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('1CIDG', 'Citrus', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('QUEIV', 'Quercus infectoria subsp. veneris', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('ACACL', 'Acacia cultriformis', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('IUGHI', 'Juglans hindsii', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('CNMJA', 'Chaenomeles japonica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CAHJA', 'Camellia japonica', '1MAGP', 'Magnoliophyta', '1THEF', 'Theaceae'),
    ('QUEPU', 'Quercus pubescens', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('LUPLU', 'Lupinus luteus', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('CYLSM', 'Corylus sieboldiana var. mandshurica', '1MAGP', 'Magnoliophyta', '1CRLF', 'Corylaceae'),
    ('POPMA', 'Populus maximowiczii', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('ALNSA', 'Alangium salviifolium', '1MAGP', 'Magnoliophyta', '1CORF', 'Cornaceae'),
    ('GEBJA', 'Gerbera jamesonii', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('PLTOR', 'Platanus orientalis', '1MAGP', 'Magnoliophyta', '1PLTF', 'Platanaceae'),
    ('QUECA', 'Quercus calliprinos', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('SETPA', 'Setaria palmifolia', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('LYPES', 'Solanum lycopersicum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('IUGMI', 'Juglans microcarpa', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('IUGNI', 'Juglans nigra', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('CSNDE', 'Castanea dentata', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('PLTRA', 'Platanus racemosa', '1MAGP', 'Magnoliophyta', '1PLTF', 'Platanaceae'),
    ('ALNCH', 'Alangium chinense', '1MAGP', 'Magnoliophyta', '1CORF', 'Cornaceae'),
    ('ACRBU', 'Acer buergerianum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('PRNAP', 'Prunus apetala', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('AKETF', 'Akebia trifoliata', '1MAGP', 'Magnoliophyta', '1LARF', 'Lardizabalaceae'),
    ('PYUPY', 'Pyrus pyrifolia', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('GLXMA', 'Glycine max', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('AECHI', 'Aesculus hippocastanum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('FRAVE', 'Fragaria vesca', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CAHRE', 'Camellia reticulata', '1MAGP', 'Magnoliophyta', '1THEF', 'Theaceae'),
    ('ACRSA', 'Acer saccharinum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('ZEAMX', 'Zea mays', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('ABINO', 'Abies nordmanniana', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('RUDFU', 'Rudbeckia fulgida', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('AMECA', 'Amelanchier canadensis', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('BUXMS', 'Buxus sinica', '1MAGP', 'Magnoliophyta', '1BUXF', 'Buxaceae'),
    ('ADEPA', 'Adenanthera pavonina', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('PRNPN', 'Prunus persica var. nucipersica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PRNGN', 'Prunus grayana', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('QUEPN', 'Quercus pyrenaica', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('CRLGR', 'Coreopsis grandiflora', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('MORNI', 'Morus nigra', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('AELMA', 'Aegle marmelos', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('ACRPL', 'Acer platanoides', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('FEJSE', 'Acca sellowiana', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('NEROL', 'Nerium oleander', '1MAGP', 'Magnoliophyta', '1APOF', 'Apocynaceae'),
    ('ABIAL', 'Abies alba', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('1COFG', 'Coffea', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('PRNPS', 'Prunus persica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('BUXSE', 'Buxus sempervirens', '1MAGP', 'Magnoliophyta', '1BUXF', 'Buxaceae'),
    ('AGEHO', 'Ageratum houstonianum', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('CPSFR', 'Capsicum frutescens', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('ADJCI', 'Adenia cissampeloides', '1MAGP', 'Magnoliophyta', '1PASF', 'Passifloraceae'),
    ('IUGMA', 'Juglans major', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('CEAHY', 'Ceanothus hybrids', '1MAGP', 'Magnoliophyta', '1RHAF', 'Rhamnaceae'),
    ('SOLQU', 'Solanum quitoense', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('1ROSG', 'Rosa', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('AFZCO', 'Afzelia xylocarpa', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('1ALUG', 'Alnus', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('PIUNL', 'Pinus nigra subsp. laricio', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('ABFAL', 'Artocarpus altilis', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('POGMY', 'Polygala myrtifolia', '1MAGP', 'Magnoliophyta', '1POGF', 'Polygalaceae'),
    ('VITAC', 'Vitis acerifolia', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('IUGMO', 'Juglans mollis', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('BRFLA', 'Brunfelsia lactea', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('VITVI', 'Vitis vinifera', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('COFAR', 'Coffea arabica', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('ACASA', 'Acacia saligna', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('CEUAT', 'Cedrus atlantica', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('SETIT', 'Setaria italica', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('CSNOZ', 'Castanea ozarkensis', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('ANMCO', 'Anemone coronaria', '1MAGP', 'Magnoliophyta', '1RANF', 'Ranunculaceae'),
    ('CAHRU', 'Camellia japonica subsp. rusticana', '1MAGP', 'Magnoliophyta', '1THEF', 'Theaceae'),
    ('ACRRB', 'Acer rubrum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('1MUBG', 'Musa', '1MAGP', 'Magnoliophyta', '1MUSF', 'Musaceae'),
    ('LAXSI', 'Larix sibirica', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('FRAAN', 'Fragaria x ananassa', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('DDPMO', 'Dendropanax morbiferus', '1MAGP', 'Magnoliophyta', '1ARLF', 'Araliaceae'),
    ('ALLAS', 'Allium ascalonicum', '1MAGP', 'Magnoliophyta', '1AMYF', 'Amaryllidaceae'),
    ('VITBE', 'Vitis berlandieri', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('QUEIL', 'Quercus ilex', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('CSNPU', 'Castanea pumila', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('PYUUS', 'Pyrus ussuriensis', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PIUNI', 'Pinus nigra', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('HKNMA', 'Hakonechloa macra', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('1BETG', 'Betula', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('CAHSQ', 'Camellia sasanqua', '1MAGP', 'Magnoliophyta', '1THEF', 'Theaceae'),
    ('CYLSI', 'Corylus sieboldiana', '1MAGP', 'Magnoliophyta', '1CRLF', 'Corylaceae'),
    ('CYLMA', 'Corylus maxima', '1MAGP', 'Magnoliophyta', '1CRLF', 'Corylaceae'),
    ('PLTOC', 'Platanus occidentalis', '1MAGP', 'Magnoliophyta', '1PLTF', 'Platanaceae'),
    ('MABSD', 'Malus domestica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PIUCA', 'Pinus canariensis', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('PRNAV', 'Prunus avium', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PRNJP', 'Prunus japonica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('AGRRE', 'Elymus repens', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('CYLCO', 'Corylus colurna', '1MAGP', 'Magnoliophyta', '1CRLF', 'Corylaceae'),
    ('PHSVX', 'Phaseolus vulgaris', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('ACRTU', 'Acer truncatum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('ALLFI', 'Allium fistulosum', '1MAGP', 'Magnoliophyta', '1AMYF', 'Amaryllidaceae'),
    ('ALUIN', 'Alnus incana', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('PTLFR', 'Dasiphora fruticosa', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('SOLPQ', 'Solanum pectinatum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('CSNMO', 'Castanea mollissima', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('PLTHY', 'Platanus x hispanica', '1MAGP', 'Magnoliophyta', '1PLTF', 'Platanaceae'),
    ('CIDRE', 'Citrus reticulata', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('BUXSS', 'Buxus sp.', '1MAGP', 'Magnoliophyta', '1BUXF', 'Buxaceae'),
    ('PRNAM', 'Prunus americana', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ACRSC', 'Acer saccharum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('QUECE', 'Quercus cerris', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('VITCO', 'Vitis coignetiae', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('OLVEU', 'Olea europaea', '1MAGP', 'Magnoliophyta', '1OLEF', 'Oleaceae'),
    ('ACRPP', 'Acer pseudoplatanus', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('APUGV', 'Apium graveolens', '1MAGP', 'Magnoliophyta', '1UMBF', 'Apiaceae'),
    ('1CIPG', 'Carpinus', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('DIGSA', 'Digitaria sanguinalis', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('BRSJU', 'Brassica juncea', '1MAGP', 'Magnoliophyta', '1CRUF', 'Brassicaceae'),
    ('IUGAI', 'Juglans ailanthifolia', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('ACADA', 'Acacia dealbata', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('ABMES', 'Abelmoschus esculentus', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('PIUBR', 'Pinus brutia', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('PIUPL', 'Pinus pinaster', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('SOLTU', 'Solanum tuberosum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('PIUHA', 'Pinus halepensis', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('PRNCX', 'Prunus cerasifera var. pissardii', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('VTHME', 'Adonidia merrillii', '1MAGP', 'Magnoliophyta', '1PALF', 'Arecaceae'),
    ('DATCA', 'Brugmansia x candida', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('HELTU', 'Helianthus tuberosus', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('AMELA', 'Amelanchier laevis', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ACRPA', 'Acer palmatum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('ACRMO', 'Acer pictum subsp. mono', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('1MORG', 'Morus', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('AKELO', 'Akebia longiracemosa', '1MAGP', 'Magnoliophyta', '1LARF', 'Lardizabalaceae'),
    ('CIDME', 'Citrus medica', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('QUERO', 'Quercus robur', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('FIUCA', 'Ficus carica', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('SETVI', 'Setaria viridis', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('ABIHL', 'Abies holophylla', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('CPSAN', 'Capsicum annuum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('BEAVX', 'Beta vulgaris', '1MAGP', 'Magnoliophyta', '1AMAF', 'Amaranthaceae'),
    ('PRNSC', 'Prunus salicina', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('VITAM', 'Vitis amurensis', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('ANUMU', 'Annona muricata', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('CIDLI', 'Citrus x limon', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('AMEAL', 'Amelanchier alnifolia', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('TRZAX', 'Triticum aestivum', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae');

-- Names for host Annona reticulata
INSERT INTO plants_names(plant, name, language) VALUES
    ('ANURE', 'Custard apple', 'en'),
    ('ANURE', 'Bullock''s heart', 'en'),
    ('ANURE', 'Common cachiman', 'en'),
    ('ANURE', 'Corazon', 'en'),
    ('ANURE', 'Annona cuore di bue', 'it'),
    ('ANURE', 'Annona reticolata', 'it');

-- Names for host Lolium perenne
INSERT INTO plants_names(plant, name, language) VALUES
    ('LOLPE', 'Perennial ryegrass', 'en'),
    ('LOLPE', 'English ryegrass', 'en'),
    ('LOLPE', 'Loglio inglese', 'it'),
    ('LOLPE', 'Loietto inglese', 'it'),
    ('LOLPE', 'Loglierella', 'it'),
    ('LOLPE', 'Loglio comune', 'it'),
    ('LOLPE', 'Loiessa', 'it');

-- Names for host Juglans mandshurica
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGMN', 'Manchurian walnut', 'en'),
    ('IUGMN', 'Noce della Manciuria', 'it');

-- Names for host Picea glehnii
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIEGL', 'Sakhalin spruce', 'en'),
    ('PIEGL', 'Abete di Glehn', 'it');

-- Names for host Prunus domestica
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNDO', 'Plum', 'en'),
    ('PRNDO', 'European plum', 'en'),
    ('PRNDO', 'Garden plum', 'en'),
    ('PRNDO', 'Wild plum', 'en'),
    ('PRNDO', 'Susino', 'it'),
    ('PRNDO', 'Prugno', 'it'),
    ('PRNDO', 'Prugna', 'it'),
    ('PRNDO', 'Pruno', 'it');

-- Names for host Setaria verticillata
INSERT INTO plants_names(plant, name, language) VALUES
    ('SETVE', 'Whorled pigeongrass', 'en'),
    ('SETVE', 'Bristly foxtail', 'en'),
    ('SETVE', 'Rough panicgrass', 'en'),
    ('SETVE', 'Rough bristlegrass', 'en'),
    ('SETVE', 'Bur bristlegrass', 'en'),
    ('SETVE', 'Bur grass', 'en'),
    ('SETVE', 'Foxtail', 'en'),
    ('SETVE', 'Fieno stellino', 'it'),
    ('SETVE', 'Panico maggiore', 'it'),
    ('SETVE', 'Pabbio verticillato', 'it'),
    ('SETVE', 'Panicastrella', 'it'),
    ('SETVE', 'Setaria verticillata', 'it');

-- Names for host Picea abies
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIEAB', 'Norway spruce', 'en'),
    ('PIEAB', 'Christmas tree', 'en'),
    ('PIEAB', 'Common pitch fir', 'en'),
    ('PIEAB', 'Common spruce', 'en'),
    ('PIEAB', 'European spruce', 'en'),
    ('PIEAB', 'Epicea', 'it'),
    ('PIEAB', 'Pezzo', 'it'),
    ('PIEAB', 'Picella', 'it'),
    ('PIEAB', 'Picea comune', 'it'),
    ('PIEAB', 'Abete rosso', 'it'),
    ('PIEAB', 'Peccio', 'it'),
    ('PIEAB', 'Picea', 'it');

-- Names for host Poaceae
INSERT INTO plants_names(plant, name, language) VALUES
    ('1GRAF', 'Grasses', 'en');

-- Names for host Aronia melanocarpa
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABOME', 'Black chokeberry', 'en');

-- Names for host Prunus cerasus
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNCE', 'Amarello cherry', 'en'),
    ('PRNCE', 'Dwarf cherry', 'en'),
    ('PRNCE', 'Sour cherry', 'en'),
    ('PRNCE', 'Tart cherry', 'en'),
    ('PRNCE', 'Agerotto', 'it'),
    ('PRNCE', 'Ciliegio amaro', 'it'),
    ('PRNCE', 'Amarasco', 'it'),
    ('PRNCE', 'Visciolo', 'it'),
    ('PRNCE', 'Marasca', 'it'),
    ('PRNCE', 'Marena', 'it');

-- Names for host Morus bombycis
INSERT INTO plants_names(plant, name, language) VALUES
    ('MORBO', 'Aino mulberry', 'en'),
    ('MORBO', 'Japanese mulberry', 'en');

-- Names for host Lolium arundinaceum
INSERT INTO plants_names(plant, name, language) VALUES
    ('FESAR', 'Reed fescue', 'en'),
    ('FESAR', 'Tall fescue', 'en'),
    ('FESAR', 'Alta fescue', 'en'),
    ('FESAR', 'Festuca alta', 'it'),
    ('FESAR', 'Festuca arundinacea', 'it'),
    ('FESAR', 'Festuca falascona', 'it'),
    ('FESAR', 'Festuca falsa canna', 'it');

-- Names for host Brassica oleracea var. botrytis
INSERT INTO plants_names(plant, name, language) VALUES
    ('BRSOB', 'Cauliflower', 'en'),
    ('BRSOB', 'Cavolo-fiore', 'it'),
    ('BRSOB', 'Cavolfiore', 'it');

-- Names for host Oryza sativa
INSERT INTO plants_names(plant, name, language) VALUES
    ('ORYSA', 'Common rice', 'en'),
    ('ORYSA', 'Rice', 'en'),
    ('ORYSA', 'Riso comune', 'it'),
    ('ORYSA', 'Riso', 'it');

-- Names for host Corylus heterophylla
INSERT INTO plants_names(plant, name, language) VALUES
    ('CYLHE', 'Siberian filbert', 'en'),
    ('CYLHE', 'Siberian hazel', 'en'),
    ('CYLHE', 'Japanese hazel', 'en');

-- Names for host Prunus domestica subsp. insititia
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNDT', 'Bullace plum', 'en'),
    ('PRNDT', 'Damson plum', 'en'),
    ('PRNDT', 'Bullace', 'en'),
    ('PRNDT', 'Damson', 'en'),
    ('PRNDT', 'Susino di macchia', 'it'),
    ('PRNDT', 'Prugnolo da siepe', 'it'),
    ('PRNDT', 'Pruno da innesto', 'it'),
    ('PRNDT', 'Susino', 'it');

-- Names for host Echinochloa crus-galli
INSERT INTO plants_names(plant, name, language) VALUES
    ('ECHCG', 'Cockspur', 'en'),
    ('ECHCG', 'Common barnyard grass', 'en'),
    ('ECHCG', 'Cockspurgrass', 'en'),
    ('ECHCG', 'Barnyard grass', 'en'),
    ('ECHCG', 'Barnyard millet', 'en'),
    ('ECHCG', 'Cockspur grass', 'en'),
    ('ECHCG', 'Japanese millet', 'en'),
    ('ECHCG', 'Jungle rice', 'en'),
    ('ECHCG', 'Prickly grass', 'en'),
    ('ECHCG', 'Giavone', 'it'),
    ('ECHCG', 'Giavone comune', 'it'),
    ('ECHCG', 'Pabbio', 'it'),
    ('ECHCG', 'Pabbione', 'it'),
    ('ECHCG', 'Panicastrella', 'it'),
    ('ECHCG', 'Panico piede di gallo', 'it'),
    ('ECHCG', 'Piè di gallo', 'it');

-- Names for host Acer negundo
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRNE', 'Ash-leaved maple', 'en'),
    ('ACRNE', 'Box elder', 'en'),
    ('ACRNE', 'Manitoba maple', 'en'),
    ('ACRNE', 'Ash-leaf maple', 'en'),
    ('ACRNE', 'Acero americano', 'it'),
    ('ACRNE', 'Acero a foglie di frassino', 'it'),
    ('ACRNE', 'Acero negundo', 'it');

-- Names for host Abies sibirica
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABISB', 'Siberian fir', 'en'),
    ('ABISB', 'Siberian silver fir', 'en'),
    ('ABISB', 'Abete siberiano', 'it');

-- Names for host Prunus spinosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNSN', 'Blackthorn', 'en'),
    ('PRNSN', 'Sloe', 'en'),
    ('PRNSN', 'Blackthorn', 'en'),
    ('PRNSN', 'Prugno selvatico', 'it'),
    ('PRNSN', 'Prugno spinoso', 'it'),
    ('PRNSN', 'Prugnolo', 'it'),
    ('PRNSN', 'Pruno selvatico', 'it'),
    ('PRNSN', 'Pruno spinoso', 'it'),
    ('PRNSN', 'Vegro', 'it');

-- Names for host Prunus dulcis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNDU', 'Sweet almond', 'en'),
    ('PRNDU', 'Almond', 'en'),
    ('PRNDU', 'Mandorlo dolce', 'it'),
    ('PRNDU', 'Mandorlo', 'it');

-- Names for host Drymocallis glandulosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('PTLGL', 'Sticky cinquefoil', 'en');

-- Names for host Prunus armeniaca
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNAR', 'Apricot', 'en'),
    ('PRNAR', 'Albicocco', 'it'),
    ('PRNAR', 'Armellino', 'it'),
    ('PRNAR', 'Grisomolo', 'it');

-- Names for host Carica papaya
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIAPA', 'Pawpaw', 'en'),
    ('CIAPA', 'Papaw', 'en'),
    ('CIAPA', 'Papaya', 'en'),
    ('CIAPA', 'Tree melon', 'en'),
    ('CIAPA', 'Papajo', 'it'),
    ('CIAPA', 'Papaia', 'it'),
    ('CIAPA', 'Carica', 'it'),
    ('CIAPA', 'Fico delle isole', 'it');

-- Names for host Morus alba
INSERT INTO plants_names(plant, name, language) VALUES
    ('MORAL', 'White mulberry', 'en'),
    ('MORAL', 'Silkworm mulberry', 'en'),
    ('MORAL', 'Gelso bianco', 'it'),
    ('MORAL', 'Moro bianco', 'it'),
    ('MORAL', 'Gelso comune', 'it');

-- Names for host Cenchrus ciliaris
INSERT INTO plants_names(plant, name, language) VALUES
    ('PESCI', 'African foxtail', 'en'),
    ('PESCI', 'Buffelgrass', 'en'),
    ('PESCI', 'Buffalo grass', 'en'),
    ('PESCI', 'Cencro ciliare', 'it'),
    ('PESCI', 'Nappola perenne', 'it');

-- Names for host Juglans cinerea
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGCI', 'Butter nut', 'en'),
    ('IUGCI', 'White walnut', 'en'),
    ('IUGCI', 'Noce cenerino', 'it'),
    ('IUGCI', 'Noce bianco d''America', 'it');

-- Names for host Pyrus communis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PYUCO', 'Common pear', 'en'),
    ('PYUCO', 'Pear', 'en'),
    ('PYUCO', 'Pero comune', 'it');

-- Names for host Helianthus annuus
INSERT INTO plants_names(plant, name, language) VALUES
    ('HELAN', 'Common sunflower', 'en'),
    ('HELAN', 'Sunflower', 'en'),
    ('HELAN', 'Girasole', 'it'),
    ('HELAN', 'Girasole comune', 'it');

-- Names for host Abies nephrolepis
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABINE', 'East Siberian fir', 'en'),
    ('ABINE', 'Khingan fir', 'en'),
    ('ABINE', 'Manchurian fir', 'en'),
    ('ABINE', 'Abete bianco siberiano', 'it');

-- Names for host Castanea crenata
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSNCR', 'Japanese chestnut', 'en'),
    ('CSNCR', 'Castagno del Giappone', 'it'),
    ('CSNCR', 'Castagno giapponese', 'it');

-- Names for host Fatsia japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('FATJA', 'Japanese aralia', 'en'),
    ('FATJA', 'Fatsia', 'en'),
    ('FATJA', 'Formosa rice tree', 'en'),
    ('FATJA', 'Paper plant', 'en');

-- Names for host Pinus pinea
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUPN', 'Stone pine', 'en'),
    ('PIUPN', 'Umbrella pine', 'en'),
    ('PIUPN', 'Italian stone pine', 'en'),
    ('PIUPN', 'Pino domestico', 'it'),
    ('PIUPN', 'Pino da pignoli', 'it'),
    ('PIUPN', 'Italienische Steinkiefer', 'it'),
    ('PIUPN', 'Pino d''Italia', 'it');

-- Names for host Pinus sylvestris
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUSI', 'Scots pine', 'en'),
    ('PIUSI', 'Common pine', 'en'),
    ('PIUSI', 'Norway fir', 'en'),
    ('PIUSI', 'Red pine', 'en'),
    ('PIUSI', 'Redwood', 'en'),
    ('PIUSI', 'Scots fir', 'en'),
    ('PIUSI', 'Wild pine', 'en'),
    ('PIUSI', 'Pino selvatico', 'it'),
    ('PIUSI', 'Pino silvestre', 'it'),
    ('PIUSI', 'Pino comune', 'it'),
    ('PIUSI', 'Pino rosso', 'it'),
    ('PIUSI', 'Pino di Scozia', 'it');

-- Names for host Corylus avellana
INSERT INTO plants_names(plant, name, language) VALUES
    ('CYLAV', 'Common hazel', 'en'),
    ('CYLAV', 'Common hazelnut', 'en'),
    ('CYLAV', 'European filbert', 'en'),
    ('CYLAV', 'European hazel', 'en'),
    ('CYLAV', 'Cobnut', 'en'),
    ('CYLAV', 'European hazelnut', 'en'),
    ('CYLAV', 'Hazel', 'en'),
    ('CYLAV', 'Hazelnut', 'en'),
    ('CYLAV', 'Nocciolo', 'it'),
    ('CYLAV', 'Avellano comune', 'it'),
    ('CYLAV', 'Nocciolo comune', 'it');

-- Names for host Fragaria virginiana
INSERT INTO plants_names(plant, name, language) VALUES
    ('FRAVI', 'Scarlet strawberry', 'en'),
    ('FRAVI', 'Virginia strawberry', 'en'),
    ('FRAVI', 'Wild strawberry', 'en'),
    ('FRAVI', 'Fragoloni', 'it');

-- Names for host Malus sylvestris
INSERT INTO plants_names(plant, name, language) VALUES
    ('MABSY', 'Wild apple', 'en'),
    ('MABSY', 'Crab apple', 'en'),
    ('MABSY', 'Wild crab', 'en'),
    ('MABSY', 'Melo selvatico', 'it');

-- Names for host Allium cepa
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALLCE', 'Garden onion', 'en'),
    ('ALLCE', 'Scallion', 'en'),
    ('ALLCE', 'Onion', 'en'),
    ('ALLCE', 'Cipolla', 'it'),
    ('ALLCE', 'Cipollina', 'it');

-- Names for host Buxus balearica
INSERT INTO plants_names(plant, name, language) VALUES
    ('BUXBA', 'Balearic box', 'en'),
    ('BUXBA', 'Spanish box', 'en'),
    ('BUXBA', 'Bosso gentile', 'it'),
    ('BUXBA', 'Bosso delle Baleari', 'it');

-- Names for host Quercus frainetto
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUEFR', 'Italian oak', 'en'),
    ('QUEFR', 'Hungarian oak', 'en'),
    ('QUEFR', 'Quercia farnetto', 'it');

-- Names for host Alnus glutinosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALUGL', 'Black alder', 'en'),
    ('ALUGL', 'Sticky alder', 'en'),
    ('ALUGL', 'European alder', 'en'),
    ('ALUGL', 'Alder', 'en'),
    ('ALUGL', 'Common alder', 'en'),
    ('ALUGL', 'Alno ontano', 'it'),
    ('ALUGL', 'Ontano nero', 'it'),
    ('ALUGL', 'Ancetano', 'it'),
    ('ALUGL', 'Aunera', 'it'),
    ('ALUGL', 'Alno nero', 'it'),
    ('ALUGL', 'Ontano comune', 'it');

-- Names for host Browallia speciosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('BRWSP', 'Amethyst flower', 'en'),
    ('BRWSP', 'Bush violet', 'en'),
    ('BRWSP', 'Browallia', 'it'),
    ('BRWSP', 'Fior di zaffiro', 'it');

-- Names for host Larix decidua
INSERT INTO plants_names(plant, name, language) VALUES
    ('LAXDE', 'Common larch', 'en'),
    ('LAXDE', 'European larch', 'en'),
    ('LAXDE', 'Larch', 'en'),
    ('LAXDE', 'White larch', 'en'),
    ('LAXDE', 'Larice europeo', 'it'),
    ('LAXDE', 'Larice', 'it'),
    ('LAXDE', 'Larice comune', 'it');

-- Names for host Citrus x aurantium var. sinensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDSI', 'Sweet orange', 'en'),
    ('CIDSI', 'Arancio', 'it');

-- Names for host Castanea henryi
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSNHE', 'Henry''s chestnut', 'en');

-- Names for host Quercus petraea
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUEPE', 'Durmast oak', 'en'),
    ('QUEPE', 'Sessile oak', 'en'),
    ('QUEPE', 'Rovere', 'it'),
    ('QUEPE', 'Quercia comune', 'it'),
    ('QUEPE', 'Ischia', 'it'),
    ('QUEPE', 'Quercia rovere', 'it');

-- Names for host Acer pensylvanicum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRPE', 'Moose-bark maple', 'en'),
    ('ACRPE', 'Striped maple', 'en'),
    ('ACRPE', 'Moose wood', 'en'),
    ('ACRPE', 'Acero screziato', 'it');

-- Names for host Carpinus betulus
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIPBE', 'Common hornbeam', 'en'),
    ('CIPBE', 'White beech', 'en'),
    ('CIPBE', 'Hornbeam', 'en'),
    ('CIPBE', 'Carpino bianco', 'it'),
    ('CIPBE', 'Carpano', 'it'),
    ('CIPBE', 'Carpigno', 'it'),
    ('CIPBE', 'Carpino comune', 'it'),
    ('CIPBE', 'Ojaranza', 'it');

-- Names for host Buxus microphylla
INSERT INTO plants_names(plant, name, language) VALUES
    ('BUXMI', 'Little-leaf box', 'en');

-- Names for host Brassica oleracea
INSERT INTO plants_names(plant, name, language) VALUES
    ('BRSOX', 'Wild cabbage', 'en'),
    ('BRSOX', 'Cabbage', 'en'),
    ('BRSOX', 'Cavolo', 'it'),
    ('BRSOX', 'Cavolo comune', 'it');

-- Names for host Abies sachalinensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABISA', 'Hokkaido pine', 'en'),
    ('ABISA', 'Sakhalin fir', 'en'),
    ('ABISA', 'Abete di Sachalin', 'it');

-- Names for host Ailanthus altissima
INSERT INTO plants_names(plant, name, language) VALUES
    ('AILAL', 'Tree of heaven', 'en'),
    ('AILAL', 'Ailanthus', 'en'),
    ('AILAL', 'Chinese sumach', 'en'),
    ('AILAL', 'Stinking sumac', 'en'),
    ('AILAL', 'Stinking quassia', 'en'),
    ('AILAL', 'Copal tree', 'en'),
    ('AILAL', 'Sumac tree', 'en'),
    ('AILAL', 'Ailanto', 'it'),
    ('AILAL', 'Albero del cielo', 'it'),
    ('AILAL', 'Verna del Giappone', 'it'),
    ('AILAL', 'Albero di paradiso', 'it'),
    ('AILAL', 'Sommacco americano', 'it'),
    ('AILAL', 'Sommacco falso', 'it'),
    ('AILAL', 'Verna del Giappone', 'it');

-- Names for host Allium tuberosum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALLTU', 'Oriental garlic', 'en'),
    ('ALLTU', 'Chinese chives', 'en'),
    ('ALLTU', 'Garlic chives', 'en');

-- Names for host Castanea sativa
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSNSA', 'Sweet chestnut', 'en'),
    ('CSNSA', 'Spanish chestnut', 'en'),
    ('CSNSA', 'Castagno comune', 'it'),
    ('CSNSA', 'Castagno', 'it');

-- Names for host Juglans californica
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGCA', 'California walnut', 'en'),
    ('IUGCA', 'California black walnut', 'en'),
    ('IUGCA', 'Southern California walnut', 'en');

-- Names for host Prunus davidiana
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNDV', 'David''s peach', 'en'),
    ('PRNDV', 'Pesco de David', 'it');

-- Names for host Cenchrus americanus
INSERT INTO plants_names(plant, name, language) VALUES
    ('PESGL', 'Bulrush millet', 'en'),
    ('PESGL', 'Cat-tail millet', 'en'),
    ('PESGL', 'Pearl millet', 'en'),
    ('PESGL', 'Pokograss', 'en'),
    ('PESGL', 'Ornamental millet', 'en'),
    ('PESGL', 'Miglio perlato', 'it'),
    ('PESGL', 'Miglio africano', 'it'),
    ('PESGL', 'Miglio de l''India', 'it');

-- Names for host Prunus cerasifera
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNCF', 'Cherry plum', 'en'),
    ('PRNCF', 'Myrobalan plum', 'en'),
    ('PRNCF', 'Ciliegio susino', 'it'),
    ('PRNCF', 'Mirabolano', 'it');

-- Names for host Cestrum elegans
INSERT INTO plants_names(plant, name, language) VALUES
    ('CEMEL', 'Red cestrum', 'en'),
    ('CEMEL', 'Purple cestrum', 'en');

-- Names for host Acacia cultriformis
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACACL', 'Knife acacia', 'en'),
    ('ACACL', 'Knife-leaf acacia', 'en'),
    ('ACACL', 'Dogtooth wattle', 'en'),
    ('ACACL', 'Golden-glow wattle', 'en'),
    ('ACACL', 'Half-moon wattle', 'en'),
    ('ACACL', 'Knife-leaf wattle', 'en');

-- Names for host Juglans hindsii
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGHI', 'Californian black walnut', 'en'),
    ('IUGHI', 'Hinds''s black walnut', 'en'),
    ('IUGHI', 'Northern California walnut', 'en');

-- Names for host Chaenomeles japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('CNMJA', 'Japanese flowering quince', 'en'),
    ('CNMJA', 'Japonica', 'en'),
    ('CNMJA', 'Japanese quince', 'en'),
    ('CNMJA', 'Cotogno giapponese', 'it'),
    ('CNMJA', 'Nespolo del Giappone', 'it');

-- Names for host Camellia japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('CAHJA', 'Japanese camellia', 'en'),
    ('CAHJA', 'Camellia', 'en'),
    ('CAHJA', 'Camelia comune', 'it'),
    ('CAHJA', 'Camellia', 'it');

-- Names for host Quercus pubescens
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUEPU', 'Pubescent oak', 'en'),
    ('QUEPU', 'Downy oak', 'en'),
    ('QUEPU', 'Durnest', 'en'),
    ('QUEPU', 'Truffle oak', 'en'),
    ('QUEPU', 'White oak', 'en'),
    ('QUEPU', 'Quercia pubescente', 'it'),
    ('QUEPU', 'Quercia lanuginosa', 'it'),
    ('QUEPU', 'Roverella', 'it');

-- Names for host Lupinus luteus
INSERT INTO plants_names(plant, name, language) VALUES
    ('LUPLU', 'Yellow lupin', 'en'),
    ('LUPLU', 'Yellow lupine', 'en'),
    ('LUPLU', 'Lupino giallo', 'it');

-- Names for host Corylus sieboldiana var. mandshurica
INSERT INTO plants_names(plant, name, language) VALUES
    ('CYLSM', 'Manchurian filbert', 'en');

-- Names for host Populus maximowiczii
INSERT INTO plants_names(plant, name, language) VALUES
    ('POPMA', 'Japanese balsam poplar', 'en');

-- Names for host Alangium salviifolium
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALNSA', 'Sage-leaved alangium', 'en');

-- Names for host Gerbera jamesonii
INSERT INTO plants_names(plant, name, language) VALUES
    ('GEBJA', 'Baberton daisy', 'en'),
    ('GEBJA', 'African daisy', 'en'),
    ('GEBJA', 'Gerbera daisy', 'en'),
    ('GEBJA', 'Transvaal daisy', 'en');

-- Names for host Platanus orientalis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PLTOR', 'Oriental plane', 'en'),
    ('PLTOR', 'Chenar tree', 'en'),
    ('PLTOR', 'Platano d''Oriente', 'it'),
    ('PLTOR', 'Platano orientale', 'it');

-- Names for host Setaria palmifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('SETPA', 'Broad-leaved bristlegrass', 'en'),
    ('SETPA', 'Malayan palmgrass', 'en'),
    ('SETPA', 'Palmgrass', 'en');

-- Names for host Solanum lycopersicum
INSERT INTO plants_names(plant, name, language) VALUES
    ('LYPES', 'Tomato', 'en'),
    ('LYPES', 'Pomodoro', 'it');

-- Names for host Juglans microcarpa
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGMI', 'River walnut', 'en'),
    ('IUGMI', 'Texas walnut', 'en'),
    ('IUGMI', 'Little walnut', 'en'),
    ('IUGMI', 'Noce a frutti piccoli', 'it');

-- Names for host Juglans nigra
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGNI', 'Black walnut', 'en'),
    ('IUGNI', 'American walnut', 'en'),
    ('IUGNI', 'Noce nero americano', 'it'),
    ('IUGNI', 'Noce americano', 'it'),
    ('IUGNI', 'Noce nero', 'it');

-- Names for host Castanea dentata
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSNDE', 'American chestnut', 'en'),
    ('CSNDE', 'Castagno americano', 'it');

-- Names for host Platanus racemosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('PLTRA', 'California sycamore', 'en');

-- Names for host Alangium chinense
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALNCH', 'Alangio cinese', 'it');

-- Names for host Acer buergerianum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRBU', 'Trident maple', 'en'),
    ('ACRBU', 'Acero di Bürger', 'it'),
    ('ACRBU', 'Acero tridente', 'it');

-- Names for host Prunus apetala
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNAP', 'Clove cherry', 'en');

-- Names for host Akebia trifoliata
INSERT INTO plants_names(plant, name, language) VALUES
    ('AKETF', 'Three-leaf akebia', 'en');

-- Names for host Pyrus pyrifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('PYUPY', 'Oriental pear', 'en'),
    ('PYUPY', 'Sand pear', 'en'),
    ('PYUPY', 'Chinese pear', 'en'),
    ('PYUPY', 'Country pear', 'en'),
    ('PYUPY', 'Japanese pear', 'en'),
    ('PYUPY', 'Japanese wild pear', 'en');

-- Names for host Glycine max
INSERT INTO plants_names(plant, name, language) VALUES
    ('GLXMA', 'Soybean', 'en'),
    ('GLXMA', 'Soja', 'it'),
    ('GLXMA', 'Soia', 'it');

-- Names for host Aesculus hippocastanum
INSERT INTO plants_names(plant, name, language) VALUES
    ('AECHI', 'Horse chestnut', 'en'),
    ('AECHI', 'Common horse chestnut', 'en'),
    ('AECHI', 'Castagno ippocastano', 'it'),
    ('AECHI', 'Eschilo', 'it'),
    ('AECHI', 'Castagno d''India', 'it'),
    ('AECHI', 'Castagno amaro', 'it'),
    ('AECHI', 'Ippocastano', 'it');

-- Names for host Fragaria vesca
INSERT INTO plants_names(plant, name, language) VALUES
    ('FRAVE', 'Wild strawberry', 'en'),
    ('FRAVE', 'European strawberry', 'en'),
    ('FRAVE', 'Fragola selvatica', 'it'),
    ('FRAVE', 'Fragola comune', 'it');

-- Names for host Camellia reticulata
INSERT INTO plants_names(plant, name, language) VALUES
    ('CAHRE', 'Temple flower', 'en');

-- Names for host Acer saccharinum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRSA', 'Silver maple', 'en'),
    ('ACRSA', 'Acero argentato', 'it'),
    ('ACRSA', 'Acero bianco americano', 'it'),
    ('ACRSA', 'Acero del Canadà', 'it');

-- Names for host Zea mays
INSERT INTO plants_names(plant, name, language) VALUES
    ('ZEAMX', 'Maize', 'en'),
    ('ZEAMX', 'Corn', 'en'),
    ('ZEAMX', 'Indian corn', 'en'),
    ('ZEAMX', 'Sweetcorn', 'en'),
    ('ZEAMX', 'Mais comune', 'it'),
    ('ZEAMX', 'Frumentone', 'it'),
    ('ZEAMX', 'Granone', 'it'),
    ('ZEAMX', 'Granoturco', 'it'),
    ('ZEAMX', 'Granturco', 'it'),
    ('ZEAMX', 'Mais', 'it'),
    ('ZEAMX', 'Melga', 'it'),
    ('ZEAMX', 'Sorgoturco', 'it');

-- Names for host Abies nordmanniana
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABINO', 'Caucasian fir', 'en'),
    ('ABINO', 'Nordmann''s silver fir', 'en'),
    ('ABINO', 'Nordmann''s fir', 'en'),
    ('ABINO', 'Nordmann fir', 'en'),
    ('ABINO', 'Abete del Caucaso', 'it'),
    ('ABINO', 'Abete di Nordmann', 'it');

-- Names for host Amelanchier canadensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('AMECA', 'Downy serviceberry', 'en'),
    ('AMECA', 'Juneberry', 'en'),
    ('AMECA', 'Shadbush serviceberry', 'en'),
    ('AMECA', 'Thicket serviceberry', 'en'),
    ('AMECA', 'Nespolino del Canadà', 'it');

-- Names for host Buxus sinica
INSERT INTO plants_names(plant, name, language) VALUES
    ('BUXMS', 'Chinese box', 'en');

-- Names for host Adenanthera pavonina
INSERT INTO plants_names(plant, name, language) VALUES
    ('ADEPA', 'Condoriwood', 'en'),
    ('ADEPA', 'Coral pea', 'en'),
    ('ADEPA', 'Sandal bead tree', 'en'),
    ('ADEPA', 'Circassian bean tree', 'en'),
    ('ADEPA', 'Red sandalwood', 'en'),
    ('ADEPA', 'Coral wood', 'en'),
    ('ADEPA', 'Pavoncina minore', 'it'),
    ('ADEPA', 'Semi di corallo', 'it');

-- Names for host Prunus persica var. nucipersica
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNPN', 'Nectarine', 'en'),
    ('PRNPN', 'Nettarina', 'it');

-- Names for host Prunus grayana
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNGN', 'Gray''s chokecherry', 'en');

-- Names for host Quercus pyrenaica
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUEPN', 'Pyrenean oak', 'en'),
    ('QUEPN', 'Spanish oak', 'en'),
    ('QUEPN', 'Hoary oak', 'en'),
    ('QUEPN', 'Quercia lanosa', 'it'),
    ('QUEPN', 'Quercia toza', 'it'),
    ('QUEPN', 'Robollo', 'it'),
    ('QUEPN', 'Quercia dei Pirenei', 'it'),
    ('QUEPN', 'Robollo', 'it');

-- Names for host Coreopsis grandiflora
INSERT INTO plants_names(plant, name, language) VALUES
    ('CRLGR', 'Large-flowered tickseed', 'en');

-- Names for host Morus nigra
INSERT INTO plants_names(plant, name, language) VALUES
    ('MORNI', 'Black mulberry', 'en'),
    ('MORNI', 'Common mulberry', 'en'),
    ('MORNI', 'Gelso nero', 'it'),
    ('MORNI', 'Moro nero', 'it');

-- Names for host Aegle marmelos
INSERT INTO plants_names(plant, name, language) VALUES
    ('AELMA', 'Bengal quince', 'en'),
    ('AELMA', 'Indian bael', 'en'),
    ('AELMA', 'Bael fruit', 'en'),
    ('AELMA', 'Bael tree', 'en'),
    ('AELMA', 'Golden apple', 'en'),
    ('AELMA', 'Japanese bitter orange', 'en'),
    ('AELMA', 'Stone apple', 'en'),
    ('AELMA', 'Wood apple', 'en');

-- Names for host Acer platanoides
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRPL', 'Plane maple', 'en'),
    ('ACRPL', 'Norway maple', 'en'),
    ('ACRPL', 'Acero platano', 'it'),
    ('ACRPL', 'Amillacero', 'it'),
    ('ACRPL', 'Acero riccio', 'it'),
    ('ACRPL', 'Falso sicomoro', 'it'),
    ('ACRPL', 'Oppio riccio', 'it');

-- Names for host Acca sellowiana
INSERT INTO plants_names(plant, name, language) VALUES
    ('FEJSE', 'Pineapple guava', 'en');

-- Names for host Nerium oleander
INSERT INTO plants_names(plant, name, language) VALUES
    ('NEROL', 'Oleander', 'en'),
    ('NEROL', 'Rose bay', 'en'),
    ('NEROL', 'Common oleander', 'en'),
    ('NEROL', 'Oleandro', 'it'),
    ('NEROL', 'Lauro roseo', 'it'),
    ('NEROL', 'Mazza cavallo', 'it'),
    ('NEROL', 'Mazza di San Giuseppe', 'it');

-- Names for host Abies alba
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABIAL', 'Silver fir', 'en'),
    ('ABIAL', 'Swiss pine', 'en'),
    ('ABIAL', 'European silver fir', 'en'),
    ('ABIAL', 'Common fir', 'en'),
    ('ABIAL', 'White silver fir', 'en'),
    ('ABIAL', 'Abete bianco', 'it');

-- Names for host Prunus persica
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNPS', 'Peach', 'en'),
    ('PRNPS', 'Pesco', 'it'),
    ('PRNPS', 'Percoche', 'it');

-- Names for host Buxus sempervirens
INSERT INTO plants_names(plant, name, language) VALUES
    ('BUXSE', 'Common box', 'en'),
    ('BUXSE', 'Box', 'en'),
    ('BUXSE', 'Bosso', 'it'),
    ('BUXSE', 'Bossolo', 'it'),
    ('BUXSE', 'Mortella', 'it'),
    ('BUXSE', 'Bosso comune', 'it');

-- Names for host Ageratum houstonianum
INSERT INTO plants_names(plant, name, language) VALUES
    ('AGEHO', 'Blue maudlin', 'en'),
    ('AGEHO', 'Blue-top goatweed', 'en'),
    ('AGEHO', 'Large-flower ageratum', 'en'),
    ('AGEHO', 'Blue billygoat weed', 'en'),
    ('AGEHO', 'Mexican ageratum', 'en'),
    ('AGEHO', 'Blue billy-goat weed', 'en'),
    ('AGEHO', 'Flossflower', 'en'),
    ('AGEHO', 'Agerato celestino', 'it');

-- Names for host Capsicum frutescens
INSERT INTO plants_names(plant, name, language) VALUES
    ('CPSFR', 'Chilli', 'en'),
    ('CPSFR', 'Bird pepper', 'en'),
    ('CPSFR', 'Bird chilli', 'en'),
    ('CPSFR', 'Hot pepper', 'en'),
    ('CPSFR', 'Cayenne pepper', 'en'),
    ('CPSFR', 'Bird''s eye chilli', 'en'),
    ('CPSFR', 'Chilli pepper', 'en'),
    ('CPSFR', 'Peperone rabbioso', 'it'),
    ('CPSFR', 'Peperone d''India', 'it'),
    ('CPSFR', 'Pepe d''uccelo', 'it');

-- Names for host Juglans major
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGMA', 'Arizona walnut', 'en');

-- Names for host Solanum quitoense
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLQU', 'Narangillo', 'en'),
    ('SOLQU', 'Naranjilla', 'en');

-- Names for host Pinus nigra subsp. laricio
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUNL', 'Corsican pine', 'en'),
    ('PIUNL', 'Calabrian black pine', 'en'),
    ('PIUNL', 'Pino laricio', 'it'),
    ('PIUNL', 'Pino di Calabria', 'it'),
    ('PIUNL', 'Pino di Corsica', 'it'),
    ('PIUNL', 'Pino laricio di Corsica', 'it'),
    ('PIUNL', 'Pino nero di Calabria', 'it'),
    ('PIUNL', 'Pino silano', 'it');

-- Names for host Artocarpus altilis
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABFAL', 'Breadfruit', 'en'),
    ('ABFAL', 'Breadfruit tree', 'en'),
    ('ABFAL', 'Artocarpo', 'it'),
    ('ABFAL', 'Albero del pane', 'it');

-- Names for host Polygala myrtifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('POGMY', 'Sweet pea-shrub', 'en'),
    ('POGMY', 'Myrtleleaf milkwort', 'en'),
    ('POGMY', 'September bush', 'en');

-- Names for host Vitis acerifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('VITAC', 'Bush grape', 'en'),
    ('VITAC', 'Panhandle grape', 'en'),
    ('VITAC', 'Mapleleaf grape', 'en');

-- Names for host Juglans mollis
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGMO', 'Guatemala walnut', 'en');

-- Names for host Brunfelsia lactea
INSERT INTO plants_names(plant, name, language) VALUES
    ('BRFLA', 'Lady of the night', 'en'),
    ('BRFLA', 'Princess of the night', 'en');

-- Names for host Vitis vinifera
INSERT INTO plants_names(plant, name, language) VALUES
    ('VITVI', 'Grapevine', 'en'),
    ('VITVI', 'European grape', 'en'),
    ('VITVI', 'Common grapevine', 'en'),
    ('VITVI', 'Vite', 'it'),
    ('VITVI', 'Vite comune', 'it');

-- Names for host Coffea arabica
INSERT INTO plants_names(plant, name, language) VALUES
    ('COFAR', 'Arabian coffee', 'en'),
    ('COFAR', 'Coffee tree', 'en'),
    ('COFAR', 'Caffe di Levante', 'it'),
    ('COFAR', 'Arbusto del caffè', 'it');

-- Names for host Acacia saligna
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACASA', 'Port Jackson wattle', 'en'),
    ('ACASA', 'Weeping wattle', 'en'),
    ('ACASA', 'Blue-leaved wattle', 'en'),
    ('ACASA', 'Golden wreath wattle', 'en'),
    ('ACASA', 'Orange wattle', 'en'),
    ('ACASA', 'Golden willow', 'en'),
    ('ACASA', 'Coojong', 'en'),
    ('ACASA', 'Western Australian golden wattle', 'en'),
    ('ACASA', 'Acacia saligna', 'it'),
    ('ACASA', 'Mimosa a foglie blu', 'it');

-- Names for host Cedrus atlantica
INSERT INTO plants_names(plant, name, language) VALUES
    ('CEUAT', 'Atlas cedar', 'en'),
    ('CEUAT', 'Cedro dell''Atlante', 'it'),
    ('CEUAT', 'Cedro del Atlas', 'it');

-- Names for host Setaria italica
INSERT INTO plants_names(plant, name, language) VALUES
    ('SETIT', 'Foxtail millet', 'en'),
    ('SETIT', 'Italian millet', 'en'),
    ('SETIT', 'Bengal grass', 'en'),
    ('SETIT', 'Foxtail bristlegrass', 'en'),
    ('SETIT', 'Panico d''Italia', 'it'),
    ('SETIT', 'Panico degli uccelli', 'it'),
    ('SETIT', 'Miglio  degli uccelli', 'it'),
    ('SETIT', 'Pabbio coltivato', 'it'),
    ('SETIT', 'Panico', 'it'),
    ('SETIT', 'Setaria coltivata', 'it');

-- Names for host Castanea ozarkensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSNOZ', 'Ozark chestnut', 'en'),
    ('CSNOZ', 'Ozark chinkapin', 'en'),
    ('CSNOZ', 'Castagno dell''Ozark', 'it');

-- Names for host Anemone coronaria
INSERT INTO plants_names(plant, name, language) VALUES
    ('ANMCO', 'Poppy anemone', 'en'),
    ('ANMCO', 'Poppy windflower', 'en'),
    ('ANMCO', 'Crown anemone', 'en'),
    ('ANMCO', 'Anemone dei campi', 'it'),
    ('ANMCO', 'Fagottino', 'it'),
    ('ANMCO', 'Anemone dei fiorai', 'it');

-- Names for host Camellia japonica subsp. rusticana
INSERT INTO plants_names(plant, name, language) VALUES
    ('CAHRU', 'Snow camellia', 'en');

-- Names for host Acer rubrum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRRB', 'Red maple', 'en'),
    ('ACRRB', 'Soft maple', 'en'),
    ('ACRRB', 'Swamp maple', 'en'),
    ('ACRRB', 'Canadian maple', 'en'),
    ('ACRRB', 'Acero rosso', 'it');

-- Names for host Larix sibirica
INSERT INTO plants_names(plant, name, language) VALUES
    ('LAXSI', 'Siberian larch', 'en'),
    ('LAXSI', 'Larice siberiano', 'it');

-- Names for host Fragaria x ananassa
INSERT INTO plants_names(plant, name, language) VALUES
    ('FRAAN', 'Garden strawberry', 'en'),
    ('FRAAN', 'Pine strawberry', 'en'),
    ('FRAAN', 'Strawberry', 'en'),
    ('FRAAN', 'Fragola coltivata', 'it');

-- Names for host Allium ascalonicum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALLAS', 'Shallot', 'en'),
    ('ALLAS', 'Potato onion', 'en'),
    ('ALLAS', 'Scalogno', 'it');

-- Names for host Vitis berlandieri
INSERT INTO plants_names(plant, name, language) VALUES
    ('VITBE', 'Spanish grape', 'en');

-- Names for host Quercus ilex
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUEIL', 'Holm oak', 'en'),
    ('QUEIL', 'Holly oak', 'en'),
    ('QUEIL', 'Evergreen oak', 'en'),
    ('QUEIL', 'Leccio', 'it'),
    ('QUEIL', 'Quercia leccio', 'it'),
    ('QUEIL', 'Elice', 'it'),
    ('QUEIL', 'Elce', 'it');

-- Names for host Castanea pumila
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSNPU', 'Allegheny chinquapin', 'en'),
    ('CSNPU', 'American chinquapin', 'en'),
    ('CSNPU', 'Chinkapin', 'en'),
    ('CSNPU', 'Chinquapin', 'en'),
    ('CSNPU', 'Dwarf chestnut', 'en'),
    ('CSNPU', 'Trailing chinquapin', 'en'),
    ('CSNPU', 'Castagno nano', 'it');

-- Names for host Pyrus ussuriensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PYUUS', 'Amur pear', 'en'),
    ('PYUUS', 'Harbin pear', 'en'),
    ('PYUUS', 'Siberian pear', 'en'),
    ('PYUUS', 'Pero dell''Ussuri', 'it');

-- Names for host Pinus nigra
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUNI', 'Black pine', 'en'),
    ('PIUNI', 'Austrian pine', 'en'),
    ('PIUNI', 'Pino nero', 'it'),
    ('PIUNI', 'Pino d''Austria', 'it'),
    ('PIUNI', 'Pino austriaco', 'it');

-- Names for host Hakonechloa macra
INSERT INTO plants_names(plant, name, language) VALUES
    ('HKNMA', 'Hakone grass', 'en'),
    ('HKNMA', 'Japanese forest grass', 'en');

-- Names for host Camellia sasanqua
INSERT INTO plants_names(plant, name, language) VALUES
    ('CAHSQ', 'Sasanqua camellia', 'en'),
    ('CAHSQ', 'Christmas camellia', 'en'),
    ('CAHSQ', 'Camelia sasanqua', 'it'),
    ('CAHSQ', 'Camelia di Natale', 'it');

-- Names for host Corylus sieboldiana
INSERT INTO plants_names(plant, name, language) VALUES
    ('CYLSI', 'Japanese filbert', 'en');

-- Names for host Corylus maxima
INSERT INTO plants_names(plant, name, language) VALUES
    ('CYLMA', 'Giant filbert', 'en'),
    ('CYLMA', 'Lambert nut', 'en'),
    ('CYLMA', 'Filbert', 'en'),
    ('CYLMA', 'Kentish cob', 'en'),
    ('CYLMA', 'Nocciolo di Dalmazia', 'it'),
    ('CYLMA', 'Nocciolo massimo', 'it'),
    ('CYLMA', 'Nocciolo lungo', 'it');

-- Names for host Platanus occidentalis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PLTOC', 'Buttonwood', 'en'),
    ('PLTOC', 'American plane', 'en'),
    ('PLTOC', 'American sycamore', 'en'),
    ('PLTOC', 'Platano d''America', 'it'),
    ('PLTOC', 'Platano occidentale', 'it');

-- Names for host Malus domestica
INSERT INTO plants_names(plant, name, language) VALUES
    ('MABSD', 'Apple', 'en'),
    ('MABSD', 'Melo', 'it'),
    ('MABSD', 'Pomo', 'it'),
    ('MABSD', 'Melo comune', 'it');

-- Names for host Pinus canariensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUCA', 'Canary pine', 'en'),
    ('PIUCA', 'Canary Island pine', 'en'),
    ('PIUCA', 'Pino delle Canarie', 'it');

-- Names for host Prunus avium
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNAV', 'Sweet cherry', 'en'),
    ('PRNAV', 'Wild cherry', 'en'),
    ('PRNAV', 'Mazzard', 'en'),
    ('PRNAV', 'Cherry', 'en'),
    ('PRNAV', 'Gean', 'en'),
    ('PRNAV', 'Ciliegio dolce', 'it'),
    ('PRNAV', 'Ciliegio selvatico', 'it'),
    ('PRNAV', 'Ciliegio', 'it');

-- Names for host Prunus japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNJP', 'Japanese bush cherry', 'en');

-- Names for host Elymus repens
INSERT INTO plants_names(plant, name, language) VALUES
    ('AGRRE', 'Couchgrass', 'en'),
    ('AGRRE', 'Quackgrass', 'en'),
    ('AGRRE', 'Quitchgrass', 'en'),
    ('AGRRE', 'Twitchgrass', 'en'),
    ('AGRRE', 'Common couchgrass', 'en'),
    ('AGRRE', 'Common couch', 'en'),
    ('AGRRE', 'Creeping wheat grass', 'en'),
    ('AGRRE', 'Dog''s grass', 'en'),
    ('AGRRE', 'Quickgrass', 'en'),
    ('AGRRE', 'Twitch', 'en'),
    ('AGRRE', 'Agropiro comune', 'it'),
    ('AGRRE', 'Caprinella', 'it'),
    ('AGRRE', 'Gramigna', 'it'),
    ('AGRRE', 'Granaccio', 'it'),
    ('AGRRE', 'Falsa gramigna', 'it'),
    ('AGRRE', 'Dente canino', 'it'),
    ('AGRRE', 'Gramaccia', 'it'),
    ('AGRRE', 'Gramiccia', 'it'),
    ('AGRRE', 'Gramigna comune', 'it');

-- Names for host Corylus colurna
INSERT INTO plants_names(plant, name, language) VALUES
    ('CYLCO', 'Turkish filbert', 'en'),
    ('CYLCO', 'Turkish hazel', 'en'),
    ('CYLCO', 'Turkish hazel nut', 'en'),
    ('CYLCO', 'Constantinople hazel', 'en'),
    ('CYLCO', 'Nocciolo di Constantinopoli', 'it'),
    ('CYLCO', 'Colurno', 'it'),
    ('CYLCO', 'Nocciolo mediterraneo', 'it');

-- Names for host Phaseolus vulgaris
INSERT INTO plants_names(plant, name, language) VALUES
    ('PHSVX', 'Garden bean', 'en'),
    ('PHSVX', 'Dry bean', 'en'),
    ('PHSVX', 'Kidney bean', 'en'),
    ('PHSVX', 'Climbing French bean', 'en'),
    ('PHSVX', 'Climbing kidney bean', 'en'),
    ('PHSVX', 'Bush bean', 'en'),
    ('PHSVX', 'Common bean', 'en'),
    ('PHSVX', 'Field bean', 'en'),
    ('PHSVX', 'Flageolet bean', 'en'),
    ('PHSVX', 'French bean', 'en'),
    ('PHSVX', 'Green bean', 'en'),
    ('PHSVX', 'Haricot bean', 'en'),
    ('PHSVX', 'Pop bean', 'en'),
    ('PHSVX', 'Snap bean', 'en'),
    ('PHSVX', 'String bean', 'en'),
    ('PHSVX', 'Fagiolo comune', 'it'),
    ('PHSVX', 'Fagiolo rampicanto', 'it');

-- Names for host Acer truncatum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRTU', 'Shantung maple', 'en');

-- Names for host Allium fistulosum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALLFI', 'Stone leek', 'en'),
    ('ALLFI', 'Welsh onion', 'en'),
    ('ALLFI', 'Japanese bunching onion', 'en'),
    ('ALLFI', 'Green onion', 'en'),
    ('ALLFI', 'Cipolleta', 'it'),
    ('ALLFI', 'Cipolla d''inverno', 'it');

-- Names for host Alnus incana
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALUIN', 'Grey alder', 'en'),
    ('ALUIN', 'White alder', 'en'),
    ('ALUIN', 'Speckled alder', 'en'),
    ('ALUIN', 'Hoary-leaved alder', 'en'),
    ('ALUIN', 'Silver-leaved alder', 'en'),
    ('ALUIN', 'Swamp alder', 'en'),
    ('ALUIN', 'Tag alder', 'en'),
    ('ALUIN', 'Ontano bianco', 'it'),
    ('ALUIN', 'Ontano peloso', 'it'),
    ('ALUIN', 'Alno bianco', 'it');

-- Names for host Dasiphora fruticosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('PTLFR', 'Bush cinquefoil', 'en'),
    ('PTLFR', 'Golden hardhack', 'en'),
    ('PTLFR', 'Shrubby cinquefoil', 'en'),
    ('PTLFR', 'Cinquefoglie cespugliosa', 'it'),
    ('PTLFR', 'Potentilla cespugliosa', 'it');

-- Names for host Castanea mollissima
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSNMO', 'Chinese chestnut', 'en'),
    ('CSNMO', 'Castagno cinese', 'it');

-- Names for host Platanus x hispanica
INSERT INTO plants_names(plant, name, language) VALUES
    ('PLTHY', 'London plane', 'en'),
    ('PLTHY', 'Platano comune', 'it'),
    ('PLTHY', 'Platano di Spagna', 'it'),
    ('PLTHY', 'Platano ibrido', 'it');

-- Names for host Citrus reticulata
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDRE', 'Mandarin', 'en'),
    ('CIDRE', 'Clementine tree', 'en'),
    ('CIDRE', 'Clementine', 'en'),
    ('CIDRE', 'Tangerine', 'en'),
    ('CIDRE', 'Mandarino', 'it'),
    ('CIDRE', 'Clementina', 'it'),
    ('CIDRE', 'Mandarino di Tangeri', 'it');

-- Names for host Prunus americana
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNAM', 'River plum', 'en'),
    ('PRNAM', 'Goose plum', 'en'),
    ('PRNAM', 'August plum', 'en'),
    ('PRNAM', 'American wild plum', 'en'),
    ('PRNAM', 'American plum', 'en'),
    ('PRNAM', 'Armellino', 'it');

-- Names for host Acer saccharum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRSC', 'Hard maple', 'en'),
    ('ACRSC', 'Rock maple', 'en'),
    ('ACRSC', 'Sugar maple', 'en'),
    ('ACRSC', 'Rocki maple', 'en'),
    ('ACRSC', 'Acero zuccherino', 'it'),
    ('ACRSC', 'Acero da zucchero', 'it');

-- Names for host Quercus cerris
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUECE', 'Turkey oak', 'en'),
    ('QUECE', 'Quercia cerro', 'it'),
    ('QUECE', 'Cerro', 'it');

-- Names for host Vitis coignetiae
INSERT INTO plants_names(plant, name, language) VALUES
    ('VITCO', 'Crimson glory vine', 'en'),
    ('VITCO', 'Frost grape', 'en');

-- Names for host Olea europaea
INSERT INTO plants_names(plant, name, language) VALUES
    ('OLVEU', 'Olive', 'en'),
    ('OLVEU', 'Common olive', 'en'),
    ('OLVEU', 'Olivo', 'it'),
    ('OLVEU', 'Olivo', 'it'),
    ('OLVEU', 'Ulivo', 'it');

-- Names for host Acer pseudoplatanus
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRPP', 'Common sycamore', 'en'),
    ('ACRPP', 'Great maple', 'en'),
    ('ACRPP', 'Plane maple', 'en'),
    ('ACRPP', 'Sycamore', 'en'),
    ('ACRPP', 'Acero montano', 'it'),
    ('ACRPP', 'Loppione', 'it'),
    ('ACRPP', 'Falso platano', 'it'),
    ('ACRPP', 'Acero bianco', 'it'),
    ('ACRPP', 'Acero di monte', 'it'),
    ('ACRPP', 'Acerofico', 'it'),
    ('ACRPP', 'Agare', 'it'),
    ('ACRPP', 'Platano falso', 'it'),
    ('ACRPP', 'Sicomoro', 'it');

-- Names for host Apium graveolens
INSERT INTO plants_names(plant, name, language) VALUES
    ('APUGV', 'Celery', 'en'),
    ('APUGV', 'Wild celery', 'en'),
    ('APUGV', 'Apio', 'it'),
    ('APUGV', 'Sedano', 'it'),
    ('APUGV', 'Sedano coltivato', 'it'),
    ('APUGV', 'Sedano comune', 'it');

-- Names for host Digitaria sanguinalis
INSERT INTO plants_names(plant, name, language) VALUES
    ('DIGSA', 'Hairy crabgrass', 'en'),
    ('DIGSA', 'Large crabgrass', 'en'),
    ('DIGSA', 'Hairy fingergrass', 'en'),
    ('DIGSA', 'Summergrass', 'en'),
    ('DIGSA', 'Crabgrass', 'en'),
    ('DIGSA', 'Red fingergrass', 'en'),
    ('DIGSA', 'Sanguinella', 'it'),
    ('DIGSA', 'Digitaria sanguinella', 'it'),
    ('DIGSA', 'Sanguinaria', 'it'),
    ('DIGSA', 'Sanguinella comune', 'it');

-- Names for host Brassica juncea
INSERT INTO plants_names(plant, name, language) VALUES
    ('BRSJU', 'Leaf mustard', 'en'),
    ('BRSJU', 'Spinach mustard', 'en'),
    ('BRSJU', 'Brown mustard', 'en'),
    ('BRSJU', 'Tuberous-rooted mustard', 'en'),
    ('BRSJU', 'White mustard', 'en'),
    ('BRSJU', 'Chinese turnip', 'en'),
    ('BRSJU', 'India mustard', 'en'),
    ('BRSJU', 'Indian mustard', 'en'),
    ('BRSJU', 'Broad-leaf mustard', 'en'),
    ('BRSJU', 'Chinese mustard', 'en'),
    ('BRSJU', 'Japanese mustard', 'en'),
    ('BRSJU', 'Wild mustard', 'en'),
    ('BRSJU', 'Senape indiana', 'it'),
    ('BRSJU', 'Cavolo giuncoso', 'it'),
    ('BRSJU', 'Cavolo giunchiforme', 'it');

-- Names for host Juglans ailanthifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGAI', 'Japanese walnut', 'en'),
    ('IUGAI', 'Noce del Giappone', 'it');

-- Names for host Acacia dealbata
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACADA', 'Blue wattle', 'en'),
    ('ACADA', 'Mimosa', 'en'),
    ('ACADA', 'Silver green wattle', 'en'),
    ('ACADA', 'Silver wattle', 'en'),
    ('ACADA', 'Acacia bianca', 'it'),
    ('ACADA', 'Acacia dealbata', 'it'),
    ('ACADA', 'Mimosa', 'it');

-- Names for host Abelmoschus esculentus
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABMES', 'Gumbo', 'en'),
    ('ABMES', 'Lady''s fingers', 'en'),
    ('ABMES', 'Okra', 'en'),
    ('ABMES', 'Bammia d''Egitto', 'it'),
    ('ABMES', 'Corna dei greci', 'it'),
    ('ABMES', 'Gombo', 'it'),
    ('ABMES', 'Ocra', 'it');

-- Names for host Pinus brutia
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUBR', 'Brutia pine', 'en'),
    ('PIUBR', 'Calabrian pine', 'en'),
    ('PIUBR', 'Cyprus pine', 'en'),
    ('PIUBR', 'Turkish pine', 'en'),
    ('PIUBR', 'Pino calabrese', 'it'),
    ('PIUBR', 'Pino bruzio', 'it');

-- Names for host Pinus pinaster
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUPL', 'Bournemouth pine', 'en'),
    ('PIUPL', 'Cluster pine', 'en'),
    ('PIUPL', 'Maritime pine', 'en'),
    ('PIUPL', 'Seaside pine', 'en'),
    ('PIUPL', 'Pino marittimo', 'it');

-- Names for host Solanum tuberosum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLTU', 'Potato', 'en'),
    ('SOLTU', 'Pomo di terra', 'it'),
    ('SOLTU', 'Patata', 'it');

-- Names for host Pinus halepensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUHA', 'Aleppo pine', 'en'),
    ('PIUHA', 'Jerusalem pine', 'en'),
    ('PIUHA', 'Pino d''Aleppo', 'it'),
    ('PIUHA', 'Pino di Geruzalemme', 'it');

-- Names for host Prunus cerasifera var. pissardii
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNCX', 'Purple-leaved plum', 'en');

-- Names for host Adonidia merrillii
INSERT INTO plants_names(plant, name, language) VALUES
    ('VTHME', 'Manila palm', 'en'),
    ('VTHME', 'Adonidia palm', 'en'),
    ('VTHME', 'Dwarf royal palm', 'en'),
    ('VTHME', 'Christmas palm', 'en'),
    ('VTHME', 'Palma di Natal', 'it'),
    ('VTHME', 'Palma di Manila', 'it');

-- Names for host Brugmansia x candida
INSERT INTO plants_names(plant, name, language) VALUES
    ('DATCA', 'Tree datura', 'en'),
    ('DATCA', 'Moonflower', 'en'),
    ('DATCA', 'White angel''s trumpet', 'en'),
    ('DATCA', 'Stramonio candido', 'it');

-- Names for host Helianthus tuberosus
INSERT INTO plants_names(plant, name, language) VALUES
    ('HELTU', 'Jerusalem artichoke', 'en'),
    ('HELTU', 'Canada potato', 'en'),
    ('HELTU', 'Topinambur', 'it'),
    ('HELTU', 'Tartufo di canna', 'it'),
    ('HELTU', 'Elianto tuberoso', 'it'),
    ('HELTU', 'Patata di Canadà', 'it'),
    ('HELTU', 'Girasole del Canada', 'it');

-- Names for host Amelanchier laevis
INSERT INTO plants_names(plant, name, language) VALUES
    ('AMELA', 'Snowy mespilus', 'en'),
    ('AMELA', 'Allegheny serviceberry', 'en'),
    ('AMELA', 'Nespolino americano', 'it');

-- Names for host Acer palmatum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRPA', 'Japanese maple', 'en'),
    ('ACRPA', 'Smooth Japanese maple', 'en'),
    ('ACRPA', 'Acero giapponese', 'it');

-- Names for host Acer pictum subsp. mono
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRMO', 'Painted maple', 'en'),
    ('ACRMO', 'Mono maple', 'en');

-- Names for host Citrus medica
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDME', 'Citron', 'en'),
    ('CIDME', 'Buddha''s hand', 'en'),
    ('CIDME', 'Cidran', 'en'),
    ('CIDME', 'Etrog', 'en'),
    ('CIDME', 'Cedro', 'it');

-- Names for host Quercus robur
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUERO', 'Pedunculate oak', 'en'),
    ('QUERO', 'English oak', 'en'),
    ('QUERO', 'Common oak', 'en'),
    ('QUERO', 'Quercia gentile', 'it'),
    ('QUERO', 'Quercia peduncolata', 'it'),
    ('QUERO', 'Farnia', 'it'),
    ('QUERO', 'Quercia comune', 'it'),
    ('QUERO', 'Quercia farnia', 'it');

-- Names for host Ficus carica
INSERT INTO plants_names(plant, name, language) VALUES
    ('FIUCA', 'Common fig', 'en'),
    ('FIUCA', 'Fig', 'en'),
    ('FIUCA', 'Fico comune', 'it'),
    ('FIUCA', 'Fico', 'it');

-- Names for host Setaria viridis
INSERT INTO plants_names(plant, name, language) VALUES
    ('SETVI', 'Bottlegrass', 'en'),
    ('SETVI', 'Green bristlegrass', 'en'),
    ('SETVI', 'Green foxtail', 'en'),
    ('SETVI', 'Green panicgrass', 'en'),
    ('SETVI', 'Green pigeongrass', 'en'),
    ('SETVI', 'Green bristle grass', 'en'),
    ('SETVI', 'Wild foxtail millet', 'en'),
    ('SETVI', 'Panico selvatico', 'it'),
    ('SETVI', 'Panico verde', 'it'),
    ('SETVI', 'Pesarone verde', 'it'),
    ('SETVI', 'Pabbio comune', 'it'),
    ('SETVI', 'Pabbio selvatico', 'it'),
    ('SETVI', 'Panicastrella', 'it'),
    ('SETVI', 'Panico falso', 'it'),
    ('SETVI', 'Pannochiella', 'it'),
    ('SETVI', 'Pesarone', 'it'),
    ('SETVI', 'Setaria verde', 'it');

-- Names for host Abies holophylla
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABIHL', 'Manchurian fir', 'en'),
    ('ABIHL', 'Abete di Manciuria', 'it');

-- Names for host Capsicum annuum
INSERT INTO plants_names(plant, name, language) VALUES
    ('CPSAN', 'Bell pepper', 'en'),
    ('CPSAN', 'Paprika', 'en'),
    ('CPSAN', 'Red pepper', 'en'),
    ('CPSAN', 'Sweet pepper', 'en'),
    ('CPSAN', 'Chilli', 'en'),
    ('CPSAN', 'Peperone', 'it'),
    ('CPSAN', 'Pepe di Guinea', 'it'),
    ('CPSAN', 'Pimento', 'it');

-- Names for host Beta vulgaris
INSERT INTO plants_names(plant, name, language) VALUES
    ('BEAVX', 'Beet', 'en'),
    ('BEAVX', 'Bietola', 'it');

-- Names for host Prunus salicina
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNSC', 'Chinese plum', 'en'),
    ('PRNSC', 'Japanese plum', 'en');

-- Names for host Vitis amurensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('VITAM', 'Amur grape', 'en');

-- Names for host Annona muricata
INSERT INTO plants_names(plant, name, language) VALUES
    ('ANUMU', 'Soursop', 'en'),
    ('ANUMU', 'Prickly custard apple', 'en'),
    ('ANUMU', 'Annona moricata', 'it'),
    ('ANUMU', 'Annona spinosa', 'it'),
    ('ANUMU', 'Casimentaria', 'it'),
    ('ANUMU', 'Pomo di canella', 'it');

-- Names for host Citrus x limon
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDLI', 'Lemon', 'en'),
    ('CIDLI', 'Citreno', 'it'),
    ('CIDLI', 'Limone', 'it');

-- Names for host Amelanchier alnifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('AMEAL', 'Alder-leaf serviceberry', 'en'),
    ('AMEAL', 'Serviceberry', 'en'),
    ('AMEAL', 'Pacific serviceberry', 'en'),
    ('AMEAL', 'Saskatoon serviceberry', 'en');

-- Names for host Triticum aestivum
INSERT INTO plants_names(plant, name, language) VALUES
    ('TRZAX', 'Soft wheat', 'en'),
    ('TRZAX', 'Bread wheat', 'en'),
    ('TRZAX', 'Fromento tenero', 'it'),
    ('TRZAX', 'Civitella', 'it'),
    ('TRZAX', 'Frumento', 'it'),
    ('TRZAX', 'Grano tenero', 'it'),
    ('TRZAX', 'Marzuolo', 'it');

-- Hosts for XANTFR pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('XANTFR', 'FRAAN', 'm'),
    ('XANTFR', 'PTLFR', 'e'),
    ('XANTFR', 'PTLGL', 'e'),
    ('XANTFR', 'FRAVE', 'e'),
    ('XANTFR', 'FRAVI', 'e');

-- Hosts for XANTAV pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('XANTAV', 'CPSAN', 'm'),
    ('XANTAV', 'LYPES', 'm');

-- Hosts for PLASHA pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('PLASHA', 'HELAN', 'm'),
    ('PLASHA', 'AGEHO', 'h'),
    ('PLASHA', 'CRLGR', 'h'),
    ('PLASHA', 'GEBJA', 'h'),
    ('PLASHA', 'HELTU', 'h'),
    ('PLASHA', 'RUDFU', 'h');

-- Hosts for COLLAC pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('COLLAC', 'FRAAN', 'm'),
    ('COLLAC', 'ANMCO', 'h'),
    ('COLLAC', 'APUGV', 'h'),
    ('COLLAC', '1CAHG', 'h'),
    ('COLLAC', 'CPSAN', 'h'),
    ('COLLAC', 'CIAPA', 'h'),
    ('COLLAC', 'CEAHY', 'h'),
    ('COLLAC', 'COFAR', 'h'),
    ('COLLAC', 'CYLAV', 'h'),
    ('COLLAC', 'LUPLU', 'h');

-- Hosts for SCLECA pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('SCLECA', 'CAHJA', 'm'),
    ('SCLECA', '1CAHG', 'h'),
    ('SCLECA', 'CAHRU', 'h'),
    ('SCLECA', 'CAHRE', 'h'),
    ('SCLECA', 'CAHSQ', 'h');

-- Hosts for CORBMI pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('CORBMI', 'LYPES', 'm'),
    ('CORBMI', 'SOLPQ', 'h'),
    ('CORBMI', 'SOLQU', 'h'),
    ('CORBMI', 'SOLTU', 'h'),
    ('CORBMI', 'BRWSP', 'e'),
    ('CORBMI', 'DATCA', 'e'),
    ('CORBMI', 'BRFLA', 'e'),
    ('CORBMI', 'CPSAN', 'e'),
    ('CORBMI', 'CPSFR', 'e'),
    ('CORBMI', 'CEMEL', 'e');

-- Hosts for XANTPR pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('XANTPR', 'PRNAR', 'm'),
    ('XANTPR', 'PRNDU', 'm'),
    ('XANTPR', 'PRNPS', 'm'),
    ('XANTPR', 'PRNPN', 'm'),
    ('XANTPR', 'PRNSC', 'm'),
    ('XANTPR', 'PRNAP', 'h'),
    ('XANTPR', 'PRNAV', 'h'),
    ('XANTPR', 'PRNBU', 'h'),
    ('XANTPR', 'PRNCE', 'h'),
    ('XANTPR', 'PRNDV', 'h');

-- Hosts for DPHNPE pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('DPHNPE', 'BUXBA', 'm'),
    ('DPHNPE', 'BUXMI', 'm'),
    ('DPHNPE', 'BUXSE', 'm'),
    ('DPHNPE', 'BUXMS', 'm'),
    ('DPHNPE', 'BUXSS', 'm');

-- Hosts for LISSOR pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('LISSOR', 'ORYSA', 'm');

-- Hosts for DIABVI pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('DIABVI', 'ZEAMX', 'm'),
    ('DIABVI', 'PESGL', 'h'),
    ('DIABVI', 'DIGSA', 'h'),
    ('DIABVI', 'ECHCG', 'h'),
    ('DIABVI', 'AGRRE', 'h'),
    ('DIABVI', 'SETVE', 'h'),
    ('DIABVI', 'SETVI', 'h');

-- Hosts for PYRIOR pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('PYRIOR', 'ORYSA', 'm'),
    ('PYRIOR', 'TRZAX', 'm'),
    ('PYRIOR', 'PESCI', 'h'),
    ('PYRIOR', 'HKNMA', 'h'),
    ('PYRIOR', 'FESAR', 'h'),
    ('PYRIOR', 'LOLPE', 'h'),
    ('PYRIOR', '1MUBG', 'h'),
    ('PYRIOR', '1GRAF', 'h'),
    ('PYRIOR', 'SETIT', 'h'),
    ('PYRIOR', 'SETPA', 'h');

-- Hosts for ENDOPA pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('ENDOPA', 'CSNDE', 'm'),
    ('ENDOPA', 'CSNSA', 'm'),
    ('ENDOPA', '1ACRG', 'h'),
    ('ENDOPA', 'CIPBE', 'h'),
    ('ENDOPA', '1CSNG', 'h'),
    ('ENDOPA', 'CSNCR', 'h'),
    ('ENDOPA', 'CSNHE', 'h'),
    ('ENDOPA', 'CSNMO', 'h'),
    ('ENDOPA', 'CSNOZ', 'h'),
    ('ENDOPA', 'CSNPU', 'h');

-- Hosts for ERYSCY pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('ERYSCY', 'CYLAV', 'm'),
    ('ERYSCY', 'CYLCO', 'm'),
    ('ERYSCY', 'CYLHE', 'h'),
    ('ERYSCY', 'CYLMA', 'h'),
    ('ERYSCY', 'CYLSI', 'h'),
    ('ERYSCY', 'CYLSM', 'h');

-- Hosts for ERWIAM pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('ERWIAM', 'MABSD', 'm'),
    ('ERWIAM', 'PYUCO', 'm'),
    ('ERWIAM', 'PYUPY', 'm'),
    ('ERWIAM', 'PYUUS', 'm'),
    ('ERWIAM', 'AMEAL', 'h'),
    ('ERWIAM', 'AMECA', 'h'),
    ('ERWIAM', 'AMELA', 'h'),
    ('ERWIAM', 'ABOME', 'h'),
    ('ERWIAM', '1CNMG', 'h'),
    ('ERWIAM', 'CNMJA', 'h');

-- Hosts for XYLEFA pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('XYLEFA', 'CIDSI', 'm'),
    ('XYLEFA', '1COFG', 'm'),
    ('XYLEFA', 'NEROL', 'm'),
    ('XYLEFA', 'OLVEU', 'm'),
    ('XYLEFA', 'POGMY', 'm'),
    ('XYLEFA', 'PRNPS', 'm'),
    ('XYLEFA', 'VITVI', 'm'),
    ('XYLEFA', 'ACACL', 'h'),
    ('XYLEFA', 'ACADA', 'h'),
    ('XYLEFA', 'ACASA', 'h');

-- Hosts for CERAFP pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('CERAFP', 'PLTOR', 'm'),
    ('CERAFP', 'PLTHY', 'm'),
    ('CERAFP', 'PLTOC', 'h'),
    ('CERAFP', 'PLTRA', 'h');

-- Hosts for GEOHMO pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('GEOHMO', 'IUGNI', 'm'),
    ('GEOHMO', '1IUGG', 'h'),
    ('GEOHMO', 'IUGAI', 'h'),
    ('GEOHMO', 'IUGCA', 'h'),
    ('GEOHMO', 'IUGCI', 'h'),
    ('GEOHMO', 'IUGHI', 'h'),
    ('GEOHMO', 'IUGMA', 'h'),
    ('GEOHMO', 'IUGMN', 'h'),
    ('GEOHMO', 'IUGMI', 'h'),
    ('GEOHMO', 'IUGMO', 'h');

-- Hosts for ALECSN pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('ALECSN', 'CIDME', 'm'),
    ('ALECSN', 'CIDRE', 'm'),
    ('ALECSN', 'CIDSI', 'm'),
    ('ALECSN', 'CIDLI', 'm'),
    ('ALECSN', 'AILAL', 'h'),
    ('ALECSN', 'AKELO', 'h'),
    ('ALECSN', 'AKETF', 'h'),
    ('ALECSN', 'ALUFO', 'h'),
    ('ALECSN', 'ANUMU', 'h'),
    ('ALECSN', 'ANURE', 'h');

-- Hosts for AROMBU pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('AROMBU', 'PRNAM', 'm'),
    ('AROMBU', 'PRNAR', 'm'),
    ('AROMBU', 'PRNAV', 'm'),
    ('AROMBU', 'PRNCF', 'm'),
    ('AROMBU', 'PRNCX', 'm'),
    ('AROMBU', 'PRNDO', 'm'),
    ('AROMBU', 'PRNDT', 'm'),
    ('AROMBU', 'PRNDU', 'm'),
    ('AROMBU', 'PRNGN', 'm'),
    ('AROMBU', 'PRNJP', 'm');

-- Hosts for DACUDO pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('DACUDO', 'ABMES', 'h'),
    ('DACUDO', 'FEJSE', 'h'),
    ('DACUDO', 'ATIFU', 'h'),
    ('DACUDO', 'ADEPA', 'h'),
    ('DACUDO', 'ADJCI', 'h'),
    ('DACUDO', 'VTHME', 'h'),
    ('DACUDO', 'AELMA', 'h'),
    ('DACUDO', 'AFZCO', 'h'),
    ('DACUDO', 'ALNCH', 'h'),
    ('DACUDO', 'ALNSA', 'h');

-- Hosts for POPIJA pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('POPIJA', 'CYLAV', 'm'),
    ('POPIJA', 'GLXMA', 'm'),
    ('POPIJA', 'MABSD', 'm'),
    ('POPIJA', 'PHSVX', 'm'),
    ('POPIJA', 'PRNAR', 'm'),
    ('POPIJA', 'PRNAV', 'm'),
    ('POPIJA', 'PRNDO', 'm'),
    ('POPIJA', 'PRNPS', 'm'),
    ('POPIJA', 'PRNSN', 'm'),
    ('POPIJA', '1ROSG', 'm');

-- Hosts for ANOLCN pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('ANOLCN', '1ACRG', 'm'),
    ('ANOLCN', 'ACRNE', 'm'),
    ('ANOLCN', 'ACRPA', 'm'),
    ('ANOLCN', 'ACRSA', 'm'),
    ('ANOLCN', 'AECHI', 'm'),
    ('ANOLCN', '1ALUG', 'm'),
    ('ANOLCN', '1BETG', 'm'),
    ('ANOLCN', '1CIPG', 'm'),
    ('ANOLCN', '1CIDG', 'm'),
    ('ANOLCN', 'CIDRE', 'm');

-- Hosts for ANOLGL pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('ANOLGL', 'ACRBU', 'm'),
    ('ANOLGL', 'ACRNE', 'm'),
    ('ANOLGL', 'ACRPE', 'm'),
    ('ANOLGL', 'ACRMO', 'm'),
    ('ANOLGL', 'ACRPL', 'm'),
    ('ANOLGL', 'ACRPP', 'm'),
    ('ANOLGL', 'ACRRB', 'm'),
    ('ANOLGL', 'ACRSA', 'm'),
    ('ANOLGL', 'ACRSC', 'm'),
    ('ANOLGL', 'ACRTU', 'm');

-- Hosts for IPSXTY pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('IPSXTY', 'PIEAB', 'm'),
    ('IPSXTY', 'ABIAL', 'h'),
    ('IPSXTY', 'ABIHL', 'h'),
    ('IPSXTY', 'ABINE', 'h'),
    ('IPSXTY', 'ABINO', 'h'),
    ('IPSXTY', 'ABISA', 'h'),
    ('IPSXTY', 'ABISB', 'h'),
    ('IPSXTY', 'LAXDE', 'h'),
    ('IPSXTY', 'LAXSI', 'h'),
    ('IPSXTY', 'PIEGL', 'h');

-- Hosts for PSACHI pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('PSACHI', 'FIUCA', 'm'),
    ('PSACHI', '1MORG', 'm'),
    ('PSACHI', 'MORAL', 'm'),
    ('PSACHI', 'ABFAL', 'h'),
    ('PSACHI', 'DDPMO', 'h'),
    ('PSACHI', 'FATJA', 'h'),
    ('PSACHI', 'POPMA', 'h');

-- Hosts for XYLOCH pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('XYLOCH', '1MORG', 'm'),
    ('XYLOCH', 'MORAL', 'm'),
    ('XYLOCH', 'MORBO', 'm'),
    ('XYLOCH', 'MORNI', 'm'),
    ('XYLOCH', 'MABSD', 'h'),
    ('XYLOCH', 'MABSY', 'h'),
    ('XYLOCH', 'PYUSS', 'h');

-- Hosts for HYPHCU pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('HYPHCU', 'MABSD', 'm'),
    ('HYPHCU', 'MORAL', 'm'),
    ('HYPHCU', 'PRNAV', 'm'),
    ('HYPHCU', 'PRNDO', 'm'),
    ('HYPHCU', 'PYUCO', 'm'),
    ('HYPHCU', '1ACRG', 'h'),
    ('HYPHCU', 'ACRNE', 'h'),
    ('HYPHCU', 'ACRPL', 'h'),
    ('HYPHCU', 'AILAL', 'h'),
    ('HYPHCU', 'CYLAV', 'h');

-- Hosts for THAUPI pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('THAUPI', 'PIUNI', 'm'),
    ('THAUPI', 'PIUNL', 'm'),
    ('THAUPI', 'PIUSI', 'm'),
    ('THAUPI', 'CEUAT', 'h'),
    ('THAUPI', 'LAXDE', 'h'),
    ('THAUPI', 'PIUBR', 'h'),
    ('THAUPI', 'PIUCA', 'h'),
    ('THAUPI', 'PIUHA', 'h'),
    ('THAUPI', 'PIUPL', 'h'),
    ('THAUPI', 'PIUPN', 'h');

-- Hosts for THAUPR pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('THAUPR', 'QUECA', 'm'),
    ('THAUPR', 'QUECE', 'm'),
    ('THAUPR', 'QUEFR', 'm'),
    ('THAUPR', 'QUEIL', 'm'),
    ('THAUPR', 'QUEIV', 'm'),
    ('THAUPR', 'QUEPE', 'm'),
    ('THAUPR', 'QUEPU', 'm'),
    ('THAUPR', 'QUEPN', 'm'),
    ('THAUPR', 'QUERO', 'm'),
    ('THAUPR', '1ACAG', 'h');

-- Hosts for MELGGC pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('MELGGC', 'ORYSA', 'm'),
    ('MELGGC', 'ABMES', 'h'),
    ('MELGGC', 'ALLAS', 'h'),
    ('MELGGC', 'ALLCE', 'h'),
    ('MELGGC', 'ALLFI', 'h'),
    ('MELGGC', 'ALLTU', 'h'),
    ('MELGGC', 'BEAVX', 'h'),
    ('MELGGC', 'BRSJU', 'h'),
    ('MELGGC', 'BRSOX', 'h'),
    ('MELGGC', 'BRSOB', 'h');

-- Hosts for PHYP64 pathogen
INSERT INTO pathogens_hosts(pathogen, plant, host_type) VALUES
    ('PHYP64', 'VITVI', 'm'),
    ('PHYP64', 'AILAL', 'h'),
    ('PHYP64', 'ALUGL', 'h'),
    ('PHYP64', 'ALUIN', 'h'),
    ('PHYP64', 'CYLAV', 'h'),
    ('PHYP64', 'SAXSS', 'h'),
    ('PHYP64', 'VITAC', 'h'),
    ('PHYP64', 'VITAM', 'h'),
    ('PHYP64', 'VITBE', 'h'),
    ('PHYP64', 'VITCO', 'h');
