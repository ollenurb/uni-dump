\c plant_pathology;
TRUNCATE TABLE plants, pathogens_hosts, plants_names;

-- Plants found to be host to stored pathogens
INSERT INTO plants(eppo_code, name, phylum_eppo_code, phylum_name, family_eppo_code, family_name) VALUES
    ('PRNDT', 'Prunus domestica subsp. insititia', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ANUSE', 'Annona senegalensis', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('VACVG', 'Vaccinium virgatum', '1MAGP', 'Magnoliophyta', '1ERIF', 'Ericaceae'),
    ('MLQPT', 'Melicope pteleifolia', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('HPXBA', 'Haematostaphis barteri', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('HSYNI', 'Hyoscyamus niger', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('HECIT', 'Helichrysum italicum', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('FIUFI', 'Ficus fistulosa', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('MNKJA', 'Manilkara jaimiqui', '1MAGP', 'Magnoliophyta', '1SATF', 'Sapotaceae'),
    ('LAEIN', 'Lagerstroemia indica', '1MAGP', 'Magnoliophyta', '1LYTF', 'Lythraceae'),
    ('PLMFR', 'Phlomis fruticosa', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('RUBPM', 'Rubus palmatus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CSNSA', 'Castanea sativa', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('CLVVT', 'Clematis vitalba', '1MAGP', 'Magnoliophyta', '1RANF', 'Ranunculaceae'),
    ('ALNCH', 'Alangium chinense', '1MAGP', 'Magnoliophyta', '1CORF', 'Cornaceae'),
    ('DATIN', 'Datura innoxia', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('ERISU', 'Erigeron sumatrensis', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('QUEPA', 'Quercus palustris', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('SNTCH', 'Santolina chamaecyparissus', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('FIURM', 'Ficus racemosa', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('CNBCO', 'Canarium indicum', '1MAGP', 'Magnoliophyta', '1BURF', 'Burseraceae'),
    ('ACRSC', 'Acer saccharum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('KYLGR', 'Kyllinga gracillima', '1MAGP', 'Magnoliophyta', '1CYPF', 'Cyperaceae'),
    ('MNGCS', 'Mangifera casturi', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('IUGMO', 'Juglans mollis', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('SORVU', 'Sorghum bicolor', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('AELMA', 'Aegle marmelos', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('MCKAM', 'Maackia amurensis', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('CYDSS', 'Cydonia sp.', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('NIESS', 'Nierembergia sp.', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('AECHI', 'Aesculus hippocastanum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('CZSVI', 'Cytisus villosus', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('SOLST', 'Solanum stramoniifolium', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('PRESE', 'Premna serratifolia', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('1ULMG', 'Ulmus', '1MAGP', 'Magnoliophyta', '1ULMF', 'Ulmaceae'),
    ('MSPGE', 'Mespilus germanica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PTLGL', 'Drymocallis glandulosa', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PSIGU', 'Psidium guajava', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('CTTMO', 'Cotoneaster moupinensis', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('DIGSA', 'Digitaria sanguinalis', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('DOSML', 'Diospyros mollis', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('OKRMA', 'Ochreinauclea maingayi', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('CSTIC', 'Cistus creticus', '1MAGP', 'Magnoliophyta', '1CISF', 'Cistaceae'),
    ('SOLPC', 'Solanum pseudocapsicum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('1CSNG', 'Castanea', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('CSNMO', 'Castanea mollissima', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('MNGFO', 'Mangifera foetida', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('VILPA', 'Vitellaria paradoxa', '1MAGP', 'Magnoliophyta', '1SATF', 'Sapotaceae'),
    ('1ILEG', 'Ilex', '1MAGP', 'Magnoliophyta', '1AQIF', 'Aquifoliaceae'),
    ('MORBO', 'Morus bombycis', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('PIBSX', 'Pisum sativum', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('PHYHE', 'Physalis heterophylla', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('CUMSA', 'Cucumis sativus', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('MNGPA', 'Mangifera pajang', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('ALUMX', 'Alnus maximowiczii', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('ACRRB', 'Acer rubrum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('PRNSL', 'Prunus serrulata', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('TOXVE', 'Toxicodendron vernicifluum', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('PYECO', 'Pyracantha coccinea', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('BUWOP', 'Bouea oppositifolia', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('CIPBE', 'Carpinus betulus', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('LAXSI', 'Larix sibirica', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('PANMI', 'Panicum miliaceum', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('HIBTI', 'Hibiscus tiliaceus', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('BTBMO', 'Artabotrys monteiroae', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('MOMBA', 'Momordica balsamina', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('GLITR', 'Gleditsia triacanthos', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('ALBJU', 'Albizia julibrissin', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('1ACRG', 'Acer', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('HIGKU', 'Holigarna kurzii', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('PAQED', 'Passiflora edulis', '1MAGP', 'Magnoliophyta', '1PASF', 'Passifloraceae'),
    ('RUBCR', 'Rubus crataegifolius', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CTTBX', 'Cotoneaster buxifolius', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('FIUSU', 'Ficus sur', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('EYBSU', 'Erycibe subspicata', '1MAGP', 'Magnoliophyta', '1COVF', 'Convolvulaceae'),
    ('MUYKO', 'Murraya koenigii', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('SOLSE', 'Solanum seaforthianum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('SOLBI', 'Lycianthes biflora', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('CJFFL', 'x Citrofortunella floridana', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('TILAM', 'Tilia americana', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('VITRE', 'Cissus repens', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('TEMCI', 'Terminalia citrina', '1MAGP', 'Magnoliophyta', '1CMBF', 'Combretaceae'),
    ('1CCPG', 'Cercidiphyllum', '1MAGP', 'Magnoliophyta', '1CECF', 'Cercidiphyllaceae'),
    ('ABFAL', 'Artocarpus altilis', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('SAXDI', 'Salix discolor', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('PAQIN', 'Passiflora incarnata', '1MAGP', 'Magnoliophyta', '1PASF', 'Passifloraceae'),
    ('MLLJA', 'Mallotus japonicus', '1MAGP', 'Magnoliophyta', '1EUPF', 'Euphorbiaceae'),
    ('ABIAL', 'Abies alba', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('CNMJA', 'Chaenomeles japonica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CPSAN', 'Capsicum annuum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('WESRO', 'Westringia fruticosa', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('SOLAC', 'Solanum aculeatissimum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('CITLA', 'Citrullus lanatus', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('PYUCO', 'Pyrus communis', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('1QUEG', 'Quercus', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('CIDMY', 'Citrus x limon var. meyerii', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('1ERYG', 'Erysimum', '1MAGP', 'Magnoliophyta', '1CRUF', 'Brassicaceae'),
    ('PIUPL', 'Pinus pinaster', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('ACADA', 'Acacia dealbata', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('MRSCO', 'Maranthes corymbosa', '1MAGP', 'Magnoliophyta', '1CHRF', 'Chrysobalanaceae'),
    ('MNGOD', 'Mangifera odorata', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('LNIDO', 'Lansium domesticum', '1MAGP', 'Magnoliophyta', '1MELF', 'Meliaceae'),
    ('ACADC', 'Acacia decurrens', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('POPSM', 'Populus simonii', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('CYLCO', 'Corylus colurna', '1MAGP', 'Magnoliophyta', '1CRLF', 'Corylaceae'),
    ('GANMA', 'Garcinia mangostana', '1MAGP', 'Magnoliophyta', '1GUTF', 'Clusiaceae'),
    ('PRNAR', 'Prunus armeniaca', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('DATME', 'Datura metel', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('CSNDE', 'Castanea dentata', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('CIDJA', 'Citrus x limonia var. jambhiri', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('DRNRE', 'Dracaena reflexa', '1MAGP', 'Magnoliophyta', '1ASGF', 'Asparagaceae'),
    ('BUXBA', 'Buxus balearica', '1MAGP', 'Magnoliophyta', '1BUXF', 'Buxaceae'),
    ('ZELSE', 'Zelkova serrata', '1MAGP', 'Magnoliophyta', '1ULMF', 'Ulmaceae'),
    ('PAQLA', 'Passiflora laurifolia', '1MAGP', 'Magnoliophyta', '1PASF', 'Passifloraceae'),
    ('CYDOB', 'Cydonia oblonga', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('1ARLG', 'Aralia', '1MAGP', 'Magnoliophyta', '1ARLF', 'Araliaceae'),
    ('SYZME', 'Syzygium coarctatum', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('ANUGL', 'Annona glabra', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('GANAT', 'Garcinia atroviridis', '1MAGP', 'Magnoliophyta', '1GUTF', 'Clusiaceae'),
    ('MNKZA', 'Manilkara zapota', '1MAGP', 'Magnoliophyta', '1SATF', 'Sapotaceae'),
    ('SYZAR', 'Syzygium aromaticum', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('ABFOD', 'Artocarpus odoratissimus', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('ABMES', 'Abelmoschus esculentus', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('SBWAS', 'Streblus asper', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('1ATIG', 'Actinidia', '1MAGP', 'Magnoliophyta', '1ACTF', 'Actinidiaceae'),
    ('VACCO', 'Vaccinium corymbosum', '1MAGP', 'Magnoliophyta', '1ERIF', 'Ericaceae'),
    ('1SGRG', 'Sageretia', '1MAGP', 'Magnoliophyta', '1RHAF', 'Rhamnaceae'),
    ('CAHOL', 'Camellia oleifera', '1MAGP', 'Magnoliophyta', '1THEF', 'Theaceae'),
    ('1CETG', 'Celtis', '1MAGP', 'Magnoliophyta', '1CAIF', 'Cannabaceae'),
    ('ABINE', 'Abies nephrolepis', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('ERQUM', 'Eriocephalus africanus', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('PLRLA', 'Phillyrea latifolia', '1MAGP', 'Magnoliophyta', '1OLEF', 'Oleaceae'),
    ('POPBA', 'Populus balsamifera', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('FIUSE', 'Ficus septica', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('SPVPR', 'Spiraea prunifolia', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ATDGH', 'Antidesma ghaesembilla', '1MAGP', 'Magnoliophyta', '1PYLF', 'Phyllanthaceae'),
    ('PIUSI', 'Pinus sylvestris', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('CAHJA', 'Camellia japonica', '1MAGP', 'Magnoliophyta', '1THEF', 'Theaceae'),
    ('OEOBI', 'Oenothera biennis', '1MAGP', 'Magnoliophyta', '1ONAF', 'Onagraceae'),
    ('SOUAI', 'Sorbus aria', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('BCCRF', 'Baccaurea ramiflora', '1MAGP', 'Magnoliophyta', '1PYLF', 'Phyllanthaceae'),
    ('LAVST', 'Lavandula stoechas', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('WILCO', 'Willughbeia coriacea', '1MAGP', 'Magnoliophyta', '1APOF', 'Apocynaceae'),
    ('KOTPA', 'Koelreuteria paniculata', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('CRHAL', 'Cordia alba', '1MAGP', 'Magnoliophyta', '1BORF', 'Boraginaceae'),
    ('IUGNI', 'Juglans nigra', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('PYUUS', 'Pyrus ussuriensis', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CEUAT', 'Cedrus atlantica', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('VITAC', 'Vitis acerifolia', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('FIMDP', 'Fimbristylis dichotoma var. pluristriata', '1MAGP', 'Magnoliophyta', '1CYPF', 'Cyperaceae'),
    ('NEKCA', 'Neolamarckia cadamba', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('MRRVI', 'Camonea vitifolia', '1MAGP', 'Magnoliophyta', '1COVF', 'Convolvulaceae'),
    ('FIUBE', 'Ficus benjamina', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('ALUJA', 'Alnus japonica', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('RUBMI', 'Rubus microphyllus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('SOUAU', 'Sorbus aucuparia', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ULEMI', 'Ulex minor', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('QUERO', 'Quercus robur', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('CCOSP', 'Calicotome spinosa', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('FRACH', 'Fragaria chiloensis', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CLILO', 'Callicarpa longifolia', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('HEERH', 'Hedera rhombea', '1MAGP', 'Magnoliophyta', '1ARLF', 'Araliaceae'),
    ('SOLPQ', 'Solanum pectinatum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('PADOD', 'Pandanus odorifer', '1MAGP', 'Magnoliophyta', '1PANF', 'Pandanaceae'),
    ('ZIPNU', 'Ziziphus nummularia', '1MAGP', 'Magnoliophyta', '1RHAF', 'Rhamnaceae'),
    ('QUEIV', 'Quercus infectoria subsp. veneris', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('LAVDE', 'Lavandula dentata', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('POPMA', 'Populus maximowiczii', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('1RHOG', 'Rhododendron', '1MAGP', 'Magnoliophyta', '1ERIF', 'Ericaceae'),
    ('PLMIT', 'Phlomis italica', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('FATSS', 'Fatsia sp.', '1MAGP', 'Magnoliophyta', '1ARLF', 'Araliaceae'),
    ('SOLFE', 'Solanum lasiocarpum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('PTFFR', 'Pterocarya fraxinifolia', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('VIBJP', 'Viburnum japonicum', '1MAGP', 'Magnoliophyta', '1ADOF', 'Adoxaceae'),
    ('HUMLU', 'Humulus lupulus', '1MAGP', 'Magnoliophyta', '1CAIF', 'Cannabaceae'),
    ('PYUSS', 'Pyrus sp.', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('MLPEM', 'Malpighia emarginata', '1MAGP', 'Magnoliophyta', '1MALF', 'Malpighiaceae'),
    ('XXLKR', 'Xylotheca kraussiana', '1MAGP', 'Magnoliophyta', '1ACHF', 'Achariaceae'),
    ('VITHD', 'Vitis hybrids', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('AMELA', 'Amelanchier laevis', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('1CIDG', 'Citrus', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('AIIMU', 'Alpinia mutica', '1MAGP', 'Magnoliophyta', '1ZINF', 'Zingiberaceae'),
    ('ALUFI', 'Alnus firma', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('PIEAB', 'Picea abies', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('1HEEG', 'Hedera', '1MAGP', 'Magnoliophyta', '1ARLF', 'Araliaceae'),
    ('FARBE', 'Fagraea berteroana', '1MAGP', 'Magnoliophyta', '1GENF', 'Gentianaceae'),
    ('MNGLL', 'Mangifera lalijiwa', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('BRNPA', 'Broussonetia papyrifera', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('RAHWI', 'Rhaphiolepis williamtelliana', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('LYPPI', 'Solanum pimpinellifolium', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('1MEIG', 'Melia', '1MAGP', 'Magnoliophyta', '1MELF', 'Meliaceae'),
    ('CIDAF', 'Citrus x aurantiifolia', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('ABFLA', 'Artocarpus lacucha', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('ULMPA', 'Ulmus parvifolia', '1MAGP', 'Magnoliophyta', '1ULMF', 'Ulmaceae'),
    ('1CCSG', 'Cercis', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('CTTMI', 'Cotoneaster microphyllus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('VAGIN', 'Vangueria infausta', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('PRNAN', 'Prunus angustifolia', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PELGV', 'Pelargonium graveolens', '1MAGP', 'Magnoliophyta', '1GERF', 'Geraniaceae'),
    ('SOLCI', 'Solanum capsicoides', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('HKNMA', 'Hakonechloa macra', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('LURNO', 'Laurus nobilis', '1MAGP', 'Magnoliophyta', '1LAUF', 'Lauraceae'),
    ('CIDAU', 'Citrus x aurantium', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('ROSBA', 'Rosa banksiae', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ERIKA', 'Erigeron karvinskianus', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('MNGQU', 'Mangifera quadrifida', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('ZIPMU', 'Ziziphus mucronata', '1MAGP', 'Magnoliophyta', '1RHAF', 'Rhamnaceae'),
    ('ACRPA', 'Acer palmatum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('IXRJA', 'Ixora javanica', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('SYHNV', 'Strychnos nux-vomica', '1MAGP', 'Magnoliophyta', '1LOGF', 'Loganiaceae'),
    ('SAXGS', 'Salix gracilistyla', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('PIUHA', 'Pinus halepensis', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('1EIOG', 'Eriobotrya', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CIDRP', 'Citrus x tangelo', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('ACRSA', 'Acer saccharinum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('CCOVI', 'Calicotome villosa', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('1ACAG', 'Acacia', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('MUBBA', 'Musa balbisiana', '1MAGP', 'Magnoliophyta', '1MUSF', 'Musaceae'),
    ('QUECE', 'Quercus cerris', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('POPAL', 'Populus alba', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('HECSS', 'Helichrysum sp.', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('AKELO', 'Akebia longiracemosa', '1MAGP', 'Magnoliophyta', '1LARF', 'Lardizabalaceae'),
    ('MUBAC', 'Musa acuminata', '1MAGP', 'Magnoliophyta', '1MUSF', 'Musaceae'),
    ('PRNBU', 'Prunus buergeriana', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ILEAQ', 'Ilex aquifolium', '1MAGP', 'Magnoliophyta', '1AQIF', 'Aquifoliaceae'),
    ('PRNAP', 'Prunus apetala', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('POPTR', 'Populus tremula', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('SBWSS', 'Streblus sp.', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('SPXDU', 'Spondias dulcis', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('SYZFR', 'Syzygium formosanum', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('GUGFL', 'Garuga floribunda', '1MAGP', 'Magnoliophyta', '1BURF', 'Burseraceae'),
    ('MDAPU', 'Mussaenda pubescens', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('PUNGR', 'Punica granatum', '1MAGP', 'Magnoliophyta', '1LYTF', 'Lythraceae'),
    ('1FAUG', 'Fagus', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('TTHOV', 'Trichosanthes pilosa', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('IRVMA', 'Irvingia malayana', '1MAGP', 'Magnoliophyta', '1IRVF', 'Irvingiaceae'),
    ('PYUBE', 'Pyrus betulifolia', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('HXAMO', 'Hexalobus monopetalus', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('ECHCG', 'Echinochloa crus-galli', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('CSCPR', 'Crataegus x prunifolia', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CIDME', 'Citrus medica', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('ABFRI', 'Artocarpus rigidus', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('ALLAS', 'Allium ascalonicum', '1MAGP', 'Magnoliophyta', '1AMYF', 'Amaryllidaceae'),
    ('SAMNI', 'Sambucus nigra', '1MAGP', 'Magnoliophyta', '1ADOF', 'Adoxaceae'),
    ('LIQST', 'Liquidambar styraciflua', '1MAGP', 'Magnoliophyta', '1AJGF', 'Altingiaceae'),
    ('PLTOR', 'Platanus orientalis', '1MAGP', 'Magnoliophyta', '1PLTF', 'Platanaceae'),
    ('PRNCS', 'Prunus cerasoides', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('1FRXG', 'Fraxinus', '1MAGP', 'Magnoliophyta', '1OLEF', 'Oleaceae'),
    ('1IUGG', 'Juglans', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('CSNOZ', 'Castanea ozarkensis', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('1VITG', 'Vitis', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('PRNCE', 'Prunus cerasus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ARDUN', 'Arbutus unedo', '1MAGP', 'Magnoliophyta', '1ERIF', 'Ericaceae'),
    ('CJFMI', 'x Citrofortunella microcarpa', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('1PYEG', 'Pyracantha', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('LQZRU', 'Lepisanthes rubiginosa', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('EYOPE', 'Euryops pectinatus', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('CINYA', 'Cinnamomum yabunikkei', '1MAGP', 'Magnoliophyta', '1LAUF', 'Lauraceae'),
    ('CAJCA', 'Cajanus cajan', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('1AECG', 'Aesculus', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('LAVHE', 'Lavandula x heterophylla', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('CUUPE', 'Cucurbita pepo', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('MOJCI', 'Morinda citrifolia', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('1PLTG', 'Platanus', '1MAGP', 'Magnoliophyta', '1PLTF', 'Platanaceae'),
    ('VITVI', 'Vitis vinifera', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('SYZAM', 'Syzygium acuminatissimum', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('CAHRE', 'Camellia reticulata', '1MAGP', 'Magnoliophyta', '1THEF', 'Theaceae'),
    ('RUBFR', 'Rubus fruticosus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('WIKUV', 'Wikstroemia uva-ursi', '1MAGP', 'Magnoliophyta', '1THYF', 'Thymelaeaceae'),
    ('CHYCA', 'Glebionis carinata', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('PRNMM', 'Prunus mume', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PRNPC', 'Prunus pseudocerasus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CIDPA', 'Citrus x aurantium var. paradisi', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('VITPE', 'Vitis pentagona', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('EAESE', 'Elaeocarpus serratus', '1MAGP', 'Magnoliophyta', '1ELCF', 'Elaeocarpaceae'),
    ('OCIBA', 'Ocimum basilicum', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('SAXAL', 'Salix alba', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('CYGCI', 'Cymbopogon citratus', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('VITAE', 'Vitis aestivalis', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('SAJED', 'Salacca zalacca', '1MAGP', 'Magnoliophyta', '1PALF', 'Arecaceae'),
    ('PRNGN', 'Prunus grayana', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('RDEED', 'Garcinia intermedia', '1MAGP', 'Magnoliophyta', '1GUTF', 'Clusiaceae'),
    ('IPABA', 'Impatiens balsamina', '1MAGP', 'Magnoliophyta', '1BAMF', 'Balsaminaceae'),
    ('AILAL', 'Ailanthus altissima', '1MAGP', 'Magnoliophyta', '1SIMF', 'Simaroubaceae'),
    ('AJSTO', 'Antiaris toxicaria', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('SOLAV', 'Solanum aviculare', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('SOLAE', 'Solanum aethiopicum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('PSTME', 'Pseudotsuga menziesii', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('SYZBN', 'Syzygium borneense', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('INGFA', 'Inga laurina', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('TPHTR', 'Triphasia trifolia', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('ASPAC', 'Asparagus acutifolius', '1MAGP', 'Magnoliophyta', '1ASGF', 'Asparagaceae'),
    ('CYLHE', 'Corylus heterophylla', '1MAGP', 'Magnoliophyta', '1CRLF', 'Corylaceae'),
    ('BRSOB', 'Brassica oleracea var. botrytis', '1MAGP', 'Magnoliophyta', '1CRUF', 'Brassicaceae'),
    ('DATST', 'Datura stramonium', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('PLIRU', 'Plumeria rubra', '1MAGP', 'Magnoliophyta', '1APOF', 'Apocynaceae'),
    ('AMECA', 'Amelanchier canadensis', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('1PRNG', 'Prunus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('SACOF', 'Saccharum officinarum', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('ANUMO', 'Annona montana', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('PRNJP', 'Prunus japonica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('GANCE', 'Garcinia celebica', '1MAGP', 'Magnoliophyta', '1GUTF', 'Clusiaceae'),
    ('MABCO', 'Malus coronaria', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CUSLA', 'Clausena lansium', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('GMEEL', 'Gmelina elliptica', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('TRFRE', 'Trifolium repens', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('ALEFO', 'Vernicia fordii', '1MAGP', 'Magnoliophyta', '1EUPF', 'Euphorbiaceae'),
    ('PGASA', 'Phagnalon saxatile', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('SPUJU', 'Spartium junceum', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('CPPTO', 'Capparis tomentosa', '1MAGP', 'Magnoliophyta', '1CAPF', 'Capparaceae'),
    ('BETNI', 'Betula nigra', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('FOLJA', 'Fortunella japonica', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('ANUDI', 'Annona macroprophyllata', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('SYZLI', 'Syzygium lineatum', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('FIIKA', 'Filipendula kamtschatica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CSFRX', 'Donella lanceolata', '1MAGP', 'Magnoliophyta', '1SATF', 'Sapotaceae'),
    ('FRXAN', 'Fraxinus angustifolia', '1MAGP', 'Magnoliophyta', '1OLEF', 'Oleaceae'),
    ('PIUCA', 'Pinus canariensis', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('ROSID', 'Rosa indica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('COFAR', 'Coffea arabica', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('PGASS', 'Phagnalon sp.', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('POPLA', 'Populus lasiocarpa', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('PYUPY', 'Pyrus pyrifolia', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CVDCO', 'Maclura cochinchinensis', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('CMIRA', 'Campsis radicans', '1MAGP', 'Magnoliophyta', '1BIGF', 'Bignoniaceae'),
    ('DODVI', 'Dodonaea viscosa', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('IUGCI', 'Juglans cinerea', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('ILECH', 'Ilex chinensis', '1MAGP', 'Magnoliophyta', '1AQIF', 'Aquifoliaceae'),
    ('1SRQG', 'Streptocarpus', '1MAGP', 'Magnoliophyta', '1GESF', 'Gesneriaceae'),
    ('BOHVD', 'Boehmeria virgata var. densiglomerata', '1MAGP', 'Magnoliophyta', '1URTF', 'Urticaceae'),
    ('CPPSE', 'Capparis sepiaria', '1MAGP', 'Magnoliophyta', '1CAPF', 'Capparaceae'),
    ('POJCM', 'Pouteria caimito', '1MAGP', 'Magnoliophyta', '1SATF', 'Sapotaceae'),
    ('HECST', 'Helichrysum stoechas', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('BIHTR', 'Bischofia javanica', '1MAGP', 'Magnoliophyta', '1PYLF', 'Phyllanthaceae'),
    ('PRTQU', 'Parthenocissus quinquefolia', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('SOLME', 'Solanum melongena', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('PIUKO', 'Pinus koraiensis', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('KTQCU', 'Crescentia cujete', '1MAGP', 'Magnoliophyta', '1BIGF', 'Bignoniaceae'),
    ('SBHSE', 'Saba senegalensis', '1MAGP', 'Magnoliophyta', '1APOF', 'Apocynaceae'),
    ('ROBPS', 'Robinia pseudoacacia', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('MYVCO', 'Myrtus communis', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('SOLVL', 'Solanum violaceum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('1ZIPG', 'Ziziphus', '1MAGP', 'Magnoliophyta', '1RHAF', 'Rhamnaceae'),
    ('ADJCI', 'Adenia cissampeloides', '1MAGP', 'Magnoliophyta', '1PASF', 'Passifloraceae'),
    ('POJCA', 'Pouteria campechiana', '1MAGP', 'Magnoliophyta', '1SATF', 'Sapotaceae'),
    ('OSPEK', 'Dimorphotheca ecklonis', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('CORSA', 'Coriandrum sativum', '1MAGP', 'Magnoliophyta', '1UMBF', 'Apiaceae'),
    ('ABISB', 'Abies sibirica', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('MNGCL', 'Mangifera caloneura', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('SRPAN', 'Sauropus androgynus', '1MAGP', 'Magnoliophyta', '1PYLF', 'Phyllanthaceae'),
    ('CUUMA', 'Cucurbita maxima', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('POJSA', 'Pouteria sapota', '1MAGP', 'Magnoliophyta', '1SATF', 'Sapotaceae'),
    ('ICAOL', 'Icacina oliviformis', '1MAGP', 'Magnoliophyta', '1ICAF', 'Icacinaceae'),
    ('SYZNE', 'Syzygium nervosum', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('PRNAV', 'Prunus avium', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PYUBR', 'Pyrus bretschneideri', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CISSR', 'Carissa spinarum', '1MAGP', 'Magnoliophyta', '1APOF', 'Apocynaceae'),
    ('QHQMA', 'Phaleria macrocarpa', '1MAGP', 'Magnoliophyta', '1THYF', 'Thymelaeaceae'),
    ('BRWSP', 'Browallia speciosa', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('EUYJA', 'Eurya japonica', '1MAGP', 'Magnoliophyta', '1PETF', 'Pentaphylacaceae'),
    ('TEUCP', 'Teucrium capitatum', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('BNCHI', 'Benincasa hispida', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('CUMME', 'Cucumis melo', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('ALLCE', 'Allium cepa', '1MAGP', 'Magnoliophyta', '1AMYF', 'Amaryllidaceae'),
    ('ELGMU', 'Elaeagnus multiflora', '1MAGP', 'Magnoliophyta', '1ELAF', 'Elaeagnaceae'),
    ('IUGMI', 'Juglans microcarpa', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('BRSJU', 'Brassica juncea', '1MAGP', 'Magnoliophyta', '1CRUF', 'Brassicaceae'),
    ('SNAPA', 'Santalum paniculatum', '1MAGP', 'Magnoliophyta', '1SANF', 'Santalaceae'),
    ('ADEPA', 'Adenanthera pavonina', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('PIEGL', 'Picea glehnii', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('PHSAU', 'Vigna radiata', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('SEVBU', 'Atalantia buxifolia', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('TSUHE', 'Tsuga heterophylla', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('SROJA', 'Streptosolen jamesonii', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('VIGSI', 'Vigna unguiculata', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('MAFSI', 'Mammea siamensis', '1MAGP', 'Magnoliophyta', '1GUTF', 'Clusiaceae'),
    ('VINMI', 'Vinca minor', '1MAGP', 'Magnoliophyta', '1APOF', 'Apocynaceae'),
    ('LIHCH', 'Litchi chinensis', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('FIUSY', 'Ficus sycomorus', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('1MLLG', 'Mallotus', '1MAGP', 'Magnoliophyta', '1EUPF', 'Euphorbiaceae'),
    ('MXXSM', 'Myxopyrum smilacifolium', '1MAGP', 'Magnoliophyta', '1OLEF', 'Oleaceae'),
    ('CTTNG', 'Cotoneaster niger', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PSICA', 'Psidium cattleyanum', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('1SOBG', 'Sophora', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('FIUHT', 'Ficus hirta', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('CPMRE', 'Coprosma repens', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('SYZCU', 'Syzygium cumini', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('GANCS', 'Garcinia costata', '1MAGP', 'Magnoliophyta', '1GUTF', 'Clusiaceae'),
    ('CIPLA', 'Carpinus laxiflora', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('MUYPA', 'Murraya paniculata', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('CIAPA', 'Carica papaya', '1MAGP', 'Magnoliophyta', '1CAAF', 'Caricaceae'),
    ('CYLMA', 'Corylus maxima', '1MAGP', 'Magnoliophyta', '1CRLF', 'Corylaceae'),
    ('PAQFO', 'Passiflora foetida', '1MAGP', 'Magnoliophyta', '1PASF', 'Passifloraceae'),
    ('ALUSB', 'Alnus sieboldiana', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('EIACN', 'Erica cinerea', '1MAGP', 'Magnoliophyta', '1ERIF', 'Ericaceae'),
    ('GNHFA', 'Ganophyllum falcatum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('LAVLA', 'Lavandula latifolia', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('PHYLF', 'Physalis longifolia', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('GADJA', 'Gardenia jasminoides', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('VITRI', 'Vitis riparia', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('PTEAQ', 'Pteridium aquilinum', '1PTEP', 'Pteridophyta', '1DENF', 'Dennstaedtiaceae'),
    ('PLTOC', 'Platanus occidentalis', '1MAGP', 'Magnoliophyta', '1PLTF', 'Platanaceae'),
    ('SOJMA', 'Sorindeia madagascariensis', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('LYPES', 'Solanum lycopersicum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('ZIPOE', 'Ziziphus oenopolia', '1MAGP', 'Magnoliophyta', '1RHAF', 'Rhamnaceae'),
    ('STXJA', 'Styrax japonicus', '1MAGP', 'Magnoliophyta', '1STYF', 'Styracaceae'),
    ('PYUPC', 'Pyrus pyrifolia var. culta', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CBRAR', 'Careya arborea', '1MAGP', 'Magnoliophyta', '1LECF', 'Lecythidaceae'),
    ('CIOPA', 'Chionanthus parkinsonii', '1MAGP', 'Magnoliophyta', '1OLEF', 'Oleaceae'),
    ('ABFCH', 'Artocarpus chama', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('CBLIC', 'Chrysobalanus icaco', '1MAGP', 'Magnoliophyta', '1CHRF', 'Chrysobalanaceae'),
    ('LIEOX', 'Lindera oxyphylla', '1MAGP', 'Magnoliophyta', '1LAUF', 'Lauraceae'),
    ('SOLSO', 'Solanum linnaeanum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('AFZCO', 'Afzelia xylocarpa', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('HIBSY', 'Hibiscus syriacus', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('1RUMG', 'Rumex', '1MAGP', 'Magnoliophyta', '1POLF', 'Polygonaceae'),
    ('LIEPR', 'Lindera praecox', '1MAGP', 'Magnoliophyta', '1LAUF', 'Lauraceae'),
    ('1HBEG', 'Hebe', '1MAGP', 'Magnoliophyta', '1PLAF', 'Plantaginaceae'),
    ('THVPE', 'Cascabela thevetia', '1MAGP', 'Magnoliophyta', '1APOF', 'Apocynaceae'),
    ('CEMEL', 'Cestrum elegans', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('TRZAX', 'Triticum aestivum', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('INOFA', 'Inocarpus fagifer', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('1SAQG', 'Sapium', '1MAGP', 'Magnoliophyta', '1EUPF', 'Euphorbiaceae'),
    ('PIUSB', 'Pinus sibirica', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('CIDNA', 'Citrus natsudaidai', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('GENBA', 'Genista balearica', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('SOUAL', 'Sorbus alnifolia', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CTTHO', 'Cotoneaster horizontalis', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('OSPFR', 'Dimorphotheca fruticosa', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('GANCO', 'Garcinia cowa', '1MAGP', 'Magnoliophyta', '1GUTF', 'Clusiaceae'),
    ('PRNCX', 'Prunus cerasifera var. pissardii', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CSJED', 'Casimiroa edulis', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('FOLHI', 'Fortunella hindsii', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('PELFR', 'Pelargonium x fragrans', '1MAGP', 'Magnoliophyta', '1GERF', 'Geraniaceae'),
    ('HIBSS', 'Hibiscus sp.', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('SYDNO', 'Synedrella nodiflora', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('LIGSI', 'Ligustrum sinense', '1MAGP', 'Magnoliophyta', '1OLEF', 'Oleaceae'),
    ('KRZTA', 'Chukrasia tabularis', '1MAGP', 'Magnoliophyta', '1MELF', 'Meliaceae'),
    ('SAXKO', 'Salix koriyanagi', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('MUBBJ', 'Musa basjoo', '1MAGP', 'Magnoliophyta', '1MUSF', 'Musaceae'),
    ('THOCA', 'Theobroma cacao', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('ACRNE', 'Acer negundo', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('ALUFM', 'Alnus firma var. multinervis', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('KEDLE', 'Kedrostis leloja', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('POLCO', 'Fallopia convolvulus', '1MAGP', 'Magnoliophyta', '1POLF', 'Polygonaceae'),
    ('KEMGL', 'Knema globularia', '1MAGP', 'Magnoliophyta', '1MYRF', 'Myristicaceae'),
    ('ALLTU', 'Allium tuberosum', '1MAGP', 'Magnoliophyta', '1AMYF', 'Amaryllidaceae'),
    ('GNESS', 'Gnetum sp.', '1GNEP', 'Gnetophyta', '1GNEF', 'Gnetaceae'),
    ('BEAVX', 'Beta vulgaris', '1MAGP', 'Magnoliophyta', '1AMAF', 'Amaranthaceae'),
    ('SEHED', 'Sechium edule', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('CIDLI', 'Citrus x limon', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('APUGV', 'Apium graveolens', '1MAGP', 'Magnoliophyta', '1UMBF', 'Apiaceae'),
    ('ROSCH', 'Rosa chinensis', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('BETPO', 'Betula populifolia', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('PESGL', 'Cenchrus americanus', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('CSTMO', 'Cistus monspeliensis', '1MAGP', 'Magnoliophyta', '1CISF', 'Cistaceae'),
    ('MEDAR', 'Medicago arborea', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('FIURO', 'Ficus auriculata', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('1VNIG', 'Vernicia', '1MAGP', 'Magnoliophyta', '1EUPF', 'Euphorbiaceae'),
    ('VIGSQ', 'Vigna unguiculata subsp. sesquipedalis', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('RHOLH', 'Rhododendron latoucheae', '1MAGP', 'Magnoliophyta', '1ERIF', 'Ericaceae'),
    ('AMCJA', 'Ampelopsis japonica', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('CINCA', 'Cinnamomum camphora', '1MAGP', 'Magnoliophyta', '1LAUF', 'Lauraceae'),
    ('QLHLO', 'Monoon longifolium', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('1STVG', 'Stranvaesia', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ACASA', 'Acacia saligna', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('FRXPE', 'Fraxinus pennsylvanica', '1MAGP', 'Magnoliophyta', '1OLEF', 'Oleaceae'),
    ('PYECN', 'Pyracantha crenatoserrata', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PRNAM', 'Prunus americana', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ABOME', 'Aronia melanocarpa', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('DOSMN', 'Diospyros montana', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('ACRPP', 'Acer pseudoplatanus', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('MORRU', 'Morus rubra', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('GPTCO', 'Trichosanthes costata', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('1FIUG', 'Ficus', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('CSCPI', 'Crataegus pinnatifida', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('1VIBG', 'Viburnum', '1MAGP', 'Magnoliophyta', '1ADOF', 'Adoxaceae'),
    ('BETPJ', 'Betula platyphylla var. japonica', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('1CTUG', 'Catharanthus', '1MAGP', 'Magnoliophyta', '1APOF', 'Apocynaceae'),
    ('MCHZU', 'Machilus zuihoensis', '1MAGP', 'Magnoliophyta', '1LAUF', 'Lauraceae'),
    ('VICFX', 'Vicia faba', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('ORYSA', 'Oryza sativa', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('1GLIG', 'Gleditsia', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('BUXMI', 'Buxus microphylla', '1MAGP', 'Magnoliophyta', '1BUXF', 'Buxaceae'),
    ('AGEHO', 'Ageratum houstonianum', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('RHDTO', 'Rhodomyrtus tomentosa', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('SHDCE', 'Siphonodon celastrineus', '1MAGP', 'Magnoliophyta', '1CELF', 'Celastraceae'),
    ('GANPA', 'Garcinia parvifolia', '1MAGP', 'Magnoliophyta', '1GUTF', 'Clusiaceae'),
    ('1CIPG', 'Carpinus', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('QUEFR', 'Quercus frainetto', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('LQZFR', 'Lepisanthes fruticosa', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('CUFRO', 'Clusia rosea', '1MAGP', 'Magnoliophyta', '1GUTF', 'Clusiaceae'),
    ('ALEMN', 'Vernicia montana', '1MAGP', 'Magnoliophyta', '1EUPF', 'Euphorbiaceae'),
    ('FIBTI', 'Fibraurea tinctoria', '1MAGP', 'Magnoliophyta', '1MENF', 'Menispermaceae'),
    ('1CJCG', 'Citroncirus', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('MMOCO', 'Mimusops coriacea', '1MAGP', 'Magnoliophyta', '1SATF', 'Sapotaceae'),
    ('GREJU', 'Grevillea juniperina', '1MAGP', 'Magnoliophyta', '1PROF', 'Proteaceae'),
    ('LUPLU', 'Lupinus luteus', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('SOLGL', 'Solanum granuloso-leprosum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('SETVE', 'Setaria verticillata', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('OPICE', 'Opilia amentacea', '1MAGP', 'Magnoliophyta', '1OPIF', 'Opiliaceae'),
    ('SHYIN', 'Shirakiopsis indica', '1MAGP', 'Magnoliophyta', '1EUPF', 'Euphorbiaceae'),
    ('DOSDC', 'Diospyros discolor', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('PRTTR', 'Parthenocissus tricuspidata', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('IUGCA', 'Juglans californica', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('RUBRO', 'Rubus rosifolius', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('SMBGL', 'Simarouba glauca', '1MAGP', 'Magnoliophyta', '1SIMF', 'Simaroubaceae'),
    ('EPHTE', 'Euphorbia terracina', '1MAGP', 'Magnoliophyta', '1EUPF', 'Euphorbiaceae'),
    ('ABFEL', 'Artocarpus elasticus', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('MABFB', 'Malus floribunda', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('DOSDA', 'Diospyros dasyphylla', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('ALUGL', 'Alnus glutinosa', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('GENSA', 'Genista x spachiana', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('MAGSO', 'Magnolia x soulangeana', '1MAGP', 'Magnoliophyta', '1MAGF', 'Magnoliaceae'),
    ('SKOOL', 'Scolopia oldhamii', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('RUBRE', 'Rubus reflexus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('RHUJV', 'Brucea javanica', '1MAGP', 'Magnoliophyta', '1SIMF', 'Simaroubaceae'),
    ('SSAAL', 'Sassafras albidum', '1MAGP', 'Magnoliophyta', '1LAUF', 'Lauraceae'),
    ('LAVIN', 'Lavandula x intermedia', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('BCTGA', 'Bactris gasipaes', '1MAGP', 'Magnoliophyta', '1PALF', 'Arecaceae'),
    ('ACRCA', 'Acer campestre', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('LGNSI', 'Lagenaria siceraria', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('CIDDE', 'Citrus x aurantium var. deliciosa', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('1CSCG', 'Crataegus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('HIBCA', 'Hibiscus cannabinus', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('PADTE', 'Pandanus tectorius', '1MAGP', 'Magnoliophyta', '1PANF', 'Pandanaceae'),
    ('PESCI', 'Cenchrus ciliaris', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('FIUMI', 'Ficus microcarpa', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('2WOOP', 'woody plants', '2WOOP', 'woody plants', '', ''),
    ('LACSA', 'Lactuca sativa', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('WILED', 'Willughbeia edulis', '1MAGP', 'Magnoliophyta', '1APOF', 'Apocynaceae'),
    ('PRNSO', 'Prunus serotina', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('1MCKG', 'Maackia', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('RUBLH', 'Rubus leucanthus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('FIURE', 'Ficus religiosa', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('CIDCL', 'Citrus x aurantium var. clementina', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('HIBMU', 'Hibiscus mutabilis', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('SYZMA', 'Syzygium malaccense', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('POPSI', 'Populus sieboldii', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('COFCA', 'Coffea canephora', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('ACRPS', 'Acer pseudosieboldianum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('ARMCA', 'Areca catechu', '1MAGP', 'Magnoliophyta', '1PALF', 'Arecaceae'),
    ('GLXMA', 'Glycine max', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('1CYPF', 'Cyperaceae', '1MAGP', 'Magnoliophyta', '1CYPF', 'Cyperaceae'),
    ('VTHME', 'Adonidia merrillii', '1MAGP', 'Magnoliophyta', '1PALF', 'Arecaceae'),
    ('COCGR', 'Coccinia grandis', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('OLVEU', 'Olea europaea', '1MAGP', 'Magnoliophyta', '1OLEF', 'Oleaceae'),
    ('MNGLA', 'Mangifera laurina', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('OCRMA', 'Ochrosia mariannensis', '1MAGP', 'Magnoliophyta', '1APOF', 'Apocynaceae'),
    ('RHERP', 'Rheum rhaponticum', '1MAGP', 'Magnoliophyta', '1POLF', 'Polygonaceae'),
    ('DLNOB', 'Dillenia obovata', '1MAGP', 'Magnoliophyta', '1DILF', 'Dilleniaceae'),
    ('1SAMG', 'Sambucus', '1MAGP', 'Magnoliophyta', '1ADOF', 'Adoxaceae'),
    ('SAMJA', 'Sambucus javanica', '1MAGP', 'Magnoliophyta', '1ADOF', 'Adoxaceae'),
    ('1SOUG', 'Sorbus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('SEBGR', 'Sesbania grandiflora', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('ANUMU', 'Annona muricata', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('ALNSA', 'Alangium salviifolium', '1MAGP', 'Magnoliophyta', '1CORF', 'Cornaceae'),
    ('CETFO', 'Celtis tetrandra', '1MAGP', 'Magnoliophyta', '1CAIF', 'Cannabaceae'),
    ('MALSS', 'Malva sp.', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('CANOD', 'Cananga odorata', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('HELTU', 'Helianthus tuberosus', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('PRNLS', 'Prunus x lannesiana', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('LAVCY', 'Lavandula x chaytorae', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('SLCBB', 'Sclerocarya birrea', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('LAXDE', 'Larix decidua', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('KSQAX', 'Choerospondias axillaris', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('FIUPU', 'Ficus pumila', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('QUEIL', 'Quercus ilex', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('MKWTO', 'Microcos tomentosa', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('RMSOF', 'Salvia rosmarinus', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('MEEMU', 'Zehneria mucronata', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('ULMJA', 'Ulmus davidiana var. japonica', '1MAGP', 'Magnoliophyta', '1ULMF', 'Ulmaceae'),
    ('SOLMY', 'Solanum myriacanthum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('SPQOL', 'Spinacia oleracea', '1MAGP', 'Magnoliophyta', '1AMAF', 'Amaranthaceae'),
    ('MUBTR', 'Musa troglodytarum', '1MAGP', 'Magnoliophyta', '1MUSF', 'Musaceae'),
    ('PYEAN', 'Pyracantha angustifolia', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('SAXNI', 'Salix nigra', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('VIXAC', 'Vitex agnus-castus', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('1COFG', 'Coffea', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('ALUHI', 'Alnus hirsuta', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('CASSM', 'Senna siamea', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('PEUSS', 'Petunia sp.', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('IUGRE', 'Juglans regia', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('CTURO', 'Catharanthus roseus', '1MAGP', 'Magnoliophyta', '1APOF', 'Apocynaceae'),
    ('1RUBG', 'Rubus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CPSFR', 'Capsicum frutescens', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('FIUER', 'Ficus erecta', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('TOOCI', 'Toona ciliata', '1MAGP', 'Magnoliophyta', '1MELF', 'Meliaceae'),
    ('NEROL', 'Nerium oleander', '1MAGP', 'Magnoliophyta', '1APOF', 'Apocynaceae'),
    ('CMUIN', 'Calophyllum inophyllum', '1MAGP', 'Magnoliophyta', '1CMUF', 'Calophyllaceae'),
    ('ABINO', 'Abies nordmanniana', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('SOLIA', 'Solanum incanum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('1RHUG', 'Rhus', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('VITBE', 'Vitis berlandieri', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('QUESL', 'Quercus stellata', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('SOLVE', 'Solanum donianum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('PYUEL', 'Pyrus elaeagnifolia', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('MTDEX', 'Metrosideros excelsa', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('WESGL', 'Westringia glabra', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('GENSC', 'Genista scorpius', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('PRNDU', 'Prunus dulcis', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PRNSC', 'Prunus salicina', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('POLOR', 'Persicaria orientalis', '1MAGP', 'Magnoliophyta', '1POLF', 'Polygonaceae'),
    ('CODUV', 'Coccoloba uvifera', '1MAGP', 'Magnoliophyta', '1POLF', 'Polygonaceae'),
    ('BCCMO', 'Baccaurea motleyana', '1MAGP', 'Magnoliophyta', '1PYLF', 'Phyllanthaceae'),
    ('AKETF', 'Akebia trifoliata', '1MAGP', 'Magnoliophyta', '1LARF', 'Lardizabalaceae'),
    ('IRVGA', 'Irvingia gabonensis', '1MAGP', 'Magnoliophyta', '1IRVF', 'Irvingiaceae'),
    ('MABSY', 'Malus sylvestris', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('1CSOG', 'Castanopsis', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('BASFL', 'Borassus flabellifer', '1MAGP', 'Magnoliophyta', '1PALF', 'Arecaceae'),
    ('TEMBL', 'Terminalia bellirica', '1MAGP', 'Magnoliophyta', '1CMBF', 'Combretaceae'),
    ('ASPOF', 'Asparagus officinalis', '1MAGP', 'Magnoliophyta', '1ASGF', 'Asparagaceae'),
    ('ULMPU', 'Ulmus pumila', '1MAGP', 'Magnoliophyta', '1ULMF', 'Ulmaceae'),
    ('AGBPI', 'Arenga pinnata', '1MAGP', 'Magnoliophyta', '1PALF', 'Arecaceae'),
    ('PHXDA', 'Phoenix dactylifera', '1MAGP', 'Magnoliophyta', '1PALF', 'Arecaceae'),
    ('1WSTG', 'Wisteria', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('DURZI', 'Durio zibethinus', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('VIBTI', 'Viburnum tinus', '1MAGP', 'Magnoliophyta', '1ADOF', 'Adoxaceae'),
    ('PMITR', 'Citrus trifoliata', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('NIEFR', 'Nierembergia frutescens', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('1CNMG', 'Chaenomeles', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('BDIST', 'Bridelia stipularis', '1MAGP', 'Magnoliophyta', '1PYLF', 'Phyllanthaceae'),
    ('FRAVE', 'Fragaria vesca', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ZIPMA', 'Ziziphus mauritiana', '1MAGP', 'Magnoliophyta', '1RHAF', 'Rhamnaceae'),
    ('CAYJA', 'Cayratia japonica', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('CSUEQ', 'Casuarina equisetifolia', '1MAGP', 'Magnoliophyta', '1CASF', 'Casuarinaceae'),
    ('GPTLE', 'Trichosanthes scabra', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('CRLGR', 'Coreopsis grandiflora', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('ALUFO', 'Alnus formosana', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('MOMCH', 'Momordica charantia', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('SYZGR', 'Syzygium grande', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('WSTFL', 'Wisteria floribunda', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('QUECO', 'Quercus coccinea', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('XAPFL', 'Xanthophyllum flavescens', '1MAGP', 'Magnoliophyta', '1POGF', 'Polygalaceae'),
    ('VITRU', 'Vitis rupestris', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('PRNDO', 'Prunus domestica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('DOSAE', 'Diospyros areolata', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('SOLCA', 'Solanum carolinense', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('DOSKA', 'Diospyros kaki', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('CIDLO', 'Citrus x limonia', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('DOSAB', 'Diospyros abyssinica', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('MUBPA', 'Musa x paradisiaca', '1MAGP', 'Magnoliophyta', '1MUSF', 'Musaceae'),
    ('QUEPE', 'Quercus petraea', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('FIUPT', 'Ficus polita', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('CIDJU', 'Citrus x junos', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('ELGUM', 'Elaeagnus umbellata', '1MAGP', 'Magnoliophyta', '1ELAF', 'Elaeagnaceae'),
    ('MABBA', 'Malus baccata', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PIUNI', 'Pinus nigra', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('FRXAM', 'Fraxinus americana', '1MAGP', 'Magnoliophyta', '1OLEF', 'Oleaceae'),
    ('MALPU', 'Malva pusilla', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('ENTPH', 'Entada phaseoloides', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('PQKDU', 'Planchonella duclitan', '1MAGP', 'Magnoliophyta', '1SATF', 'Sapotaceae'),
    ('MOFSI', 'Monoon simiarum', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('FEJSE', 'Acca sellowiana', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('DOVHE', 'Dovyalis hebecarpa', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('CSFAL', 'Gambeya albida', '1MAGP', 'Magnoliophyta', '1SATF', 'Sapotaceae'),
    ('KAESS', 'Kaempferia sp.', '1MAGP', 'Magnoliophyta', '1ZINF', 'Zingiberaceae'),
    ('PTFRH', 'Pterocarya rhoifolia', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('ALUIN', 'Alnus incana', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('SETIT', 'Setaria italica', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('GENLU', 'Genista tricuspidata', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('NOREM', 'Noronhia emarginata', '1MAGP', 'Magnoliophyta', '1OLEF', 'Oleaceae'),
    ('1ELGG', 'Elaeagnus', '1MAGP', 'Magnoliophyta', '1ELAF', 'Elaeagnaceae'),
    ('TILCO', 'Tilia cordata', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('PMTDI', 'Pimenta dioica', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('DOSMA', 'Diospyros malabarica', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('FRAAN', 'Fragaria x ananassa', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('FESAR', 'Lolium arundinaceum', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('PAQTR', 'Passiflora tripartita', '1MAGP', 'Magnoliophyta', '1PASF', 'Passifloraceae'),
    ('FRAVI', 'Fragaria virginiana', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ERISS', 'Erigeron sp.', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('CEQSI', 'Ceratonia siliqua', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('BUXSE', 'Buxus sempervirens', '1MAGP', 'Magnoliophyta', '1BUXF', 'Buxaceae'),
    ('GENCO', 'Genista corsica', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('MESDO', 'Melastoma dodecandrum', '1MAGP', 'Magnoliophyta', '1MESF', 'Melastomataceae'),
    ('PAQCO', 'Passiflora caerulea', '1MAGP', 'Magnoliophyta', '1PASF', 'Passifloraceae'),
    ('CEAHY', 'Ceanothus hybrids', '1MAGP', 'Magnoliophyta', '1RHAF', 'Rhamnaceae'),
    ('BUXSS', 'Buxus sp.', '1MAGP', 'Magnoliophyta', '1BUXF', 'Buxaceae'),
    ('MCRTA', 'Macaranga tanarius', '1MAGP', 'Magnoliophyta', '1EUPF', 'Euphorbiaceae'),
    ('SAOSC', 'Cytisus scoparius', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('PIUEL', 'Pinus elliottii', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('DUCIN', 'Potentilla indica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('MAEDU', 'Capparis duchesnei', '1MAGP', 'Magnoliophyta', '1CAPF', 'Capparaceae'),
    ('SOLMR', 'Solanum mauritianum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('DDPMO', 'Dendropanax morbiferus', '1MAGP', 'Magnoliophyta', '1ARLF', 'Araliaceae'),
    ('PRNPH', 'Prunus phaeosticta', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('1POPG', 'Populus', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('QUESU', 'Quercus suber', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('SHFFR', 'Schoepfia fragrans', '1MAGP', 'Magnoliophyta', '1SHPF', 'Schoepfiaceae'),
    ('SYZLV', 'Syzygium levinei', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('POXDR', 'Phlox drummondii', '1MAGP', 'Magnoliophyta', '1POMF', 'Polemoniaceae'),
    ('1PTFG', 'Pterocarya', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('DOSCS', 'Diospyros castanea', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('PNAAN', 'Parinari anamensis', '1MAGP', 'Magnoliophyta', '1CHRF', 'Chrysobalanaceae'),
    ('OPUFI', 'Opuntia ficus-indica', '1MAGP', 'Magnoliophyta', '1CACF', 'Cactaceae'),
    ('ACACL', 'Acacia cultriformis', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('CSTSA', 'Cistus salviifolius', '1MAGP', 'Magnoliophyta', '1CISF', 'Cistaceae'),
    ('POPDE', 'Populus deltoides', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('RLLMU', 'Rollinia mucosa', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('MEDSA', 'Medicago sativa', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('PRNCF', 'Prunus cerasifera', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('SLEDA', 'Sloanea dasycarpa', '1MAGP', 'Magnoliophyta', '1ELCF', 'Elaeocarpaceae'),
    ('SLXVE', 'Salacia verrucosa', '1MAGP', 'Magnoliophyta', '1CELF', 'Celastraceae'),
    ('ROSMU', 'Rosa multiflora', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('1CTTG', 'Cotoneaster', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('HIBRS', 'Hibiscus rosa-sinensis', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('SYZAQ', 'Syzygium aqueum', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('ACRTG', 'Acer tegmentosum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('SORHA', 'Sorghum halepense', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('DOSSA', 'Diospyros sandwicensis', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('CCPJA', 'Cercidiphyllum japonicum', '1MAGP', 'Magnoliophyta', '1CECF', 'Cercidiphyllaceae'),
    ('SAXSS', 'Salix sp.', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('1CRWG', 'Cornus', '1MAGP', 'Magnoliophyta', '1CORF', 'Cornaceae'),
    ('PLTHY', 'Platanus x hispanica', '1MAGP', 'Magnoliophyta', '1PLTF', 'Platanaceae'),
    ('DZSCH', 'Desmos chinensis', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('EMHMA', 'Eremophila maculata', '1MAGP', 'Magnoliophyta', '1SCPF', 'Scrophulariaceae'),
    ('PQIMA', 'Palaquium maingayi', '1MAGP', 'Magnoliophyta', '1SATF', 'Sapotaceae'),
    ('WIKPH', 'Wikstroemia phillyreifolia', '1MAGP', 'Magnoliophyta', '1THYF', 'Thymelaeaceae'),
    ('NUCOR', 'Nauclea orientalis', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('BRSOX', 'Brassica oleracea', '1MAGP', 'Magnoliophyta', '1CRUF', 'Brassicaceae'),
    ('POPNI', 'Populus nigra', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('ALGOF', 'Althaea officinalis', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('SYZSA', 'Syzygium samarangense', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('SAQSE', 'Triadica sebifera', '1MAGP', 'Magnoliophyta', '1EUPF', 'Euphorbiaceae'),
    ('VITFL', 'Vitis ficifolia var. lobata', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('ANUCH', 'Annona cherimola', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('PIEJE', 'Picea jezoensis', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('CYLSM', 'Corylus sieboldiana var. mandshurica', '1MAGP', 'Magnoliophyta', '1CRLF', 'Corylaceae'),
    ('FARCE', 'Fagraea ceilanica', '1MAGP', 'Magnoliophyta', '1GENF', 'Gentianaceae'),
    ('MANES', 'Manihot esculenta', '1MAGP', 'Magnoliophyta', '1EUPF', 'Euphorbiaceae'),
    ('ARTAO', 'Artemisia arborescens', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('1CAHG', 'Camellia', '1MAGP', 'Magnoliophyta', '1THEF', 'Theaceae'),
    ('SOLQU', 'Solanum quitoense', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('DOSMO', 'Diospyros morrisiana', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('BOHZB', 'Boehmeria zollingeriana var. blinii', '1MAGP', 'Magnoliophyta', '1URTF', 'Urticaceae'),
    ('FIUHS', 'Ficus hispida', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('1ALBG', 'Albizia', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('TDDAS', 'Zanthoxylum asiaticum', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('CIDRE', 'Citrus reticulata', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('CTTDA', 'Cotoneaster dammeri', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('MBEPE', 'Maesa perlarius', '1MAGP', 'Magnoliophyta', '1PRIF', 'Primulaceae'),
    ('1LAEG', 'Lagerstroemia', '1MAGP', 'Magnoliophyta', '1LYTF', 'Lythraceae'),
    ('VITLA', 'Vitis labrusca', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('GANGR', 'Garcinia griffithii', '1MAGP', 'Magnoliophyta', '1GUTF', 'Clusiaceae'),
    ('EPHCH', 'Euphorbia chamaesyce', '1MAGP', 'Magnoliophyta', '1EUPF', 'Euphorbiaceae'),
    ('PLTRA', 'Platanus racemosa', '1MAGP', 'Magnoliophyta', '1PLTF', 'Platanaceae'),
    ('ALGRO', 'Alcea rosea', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('BEHRA', 'Berchemia racemosa', '1MAGP', 'Magnoliophyta', '1RHAF', 'Rhamnaceae'),
    ('SOLTO', 'Solanum torvum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('LQZTE', 'Lepisanthes tetraphylla', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('MUBSS', 'Musa sp.', '1MAGP', 'Magnoliophyta', '1MUSF', 'Musaceae'),
    ('CZRVG', 'Coronilla valentina subsp. glauca', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('ZEAMX', 'Zea mays', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('ROSXF', 'Rosa Cluster-flowered bush hybrids', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ABFHE', 'Artocarpus heterophyllus', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('1HIBG', 'Hibiscus', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('1GRAF', 'Poaceae', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('CCOSS', 'Calicotome sp.', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('CSCMO', 'Crataegus monogyna', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PDCSI', 'Pseudocydonia sinensis', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CJQAN', 'Cupaniopsis anacardioides', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('BCCRA', 'Baccaurea racemosa', '1MAGP', 'Magnoliophyta', '1PYLF', 'Phyllanthaceae'),
    ('NIOBI', 'Nicotiana quadrivalvis', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('ANAOC', 'Anacardium occidentale', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('1ASPG', 'Asparagus', '1MAGP', 'Magnoliophyta', '1ASGF', 'Asparagaceae'),
    ('FIUOP', 'Ficus obpyramidata', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('CSNSE', 'Castanea seguinii', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('1PIUG', 'Pinus', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('DOSMF', 'Diospyros mespiliformis', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('EAEHY', 'Elaeocarpus hygrophilus', '1MAGP', 'Magnoliophyta', '1ELCF', 'Elaeocarpaceae'),
    ('ACRPL', 'Acer platanoides', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('CTTCR', 'Cotoneaster x crispii', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CYJBE', 'Solanum betaceum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('HOSIR', 'Horsfieldia irya', '1MAGP', 'Magnoliophyta', '1MYRF', 'Myristicaceae'),
    ('ANHCO', 'Ananas comosus', '1MAGP', 'Magnoliophyta', '1BROF', 'Bromeliaceae'),
    ('TILJA', 'Tilia japonica', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('BAUCH', 'Bauhinia championii', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('1BETG', 'Betula', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('EYOCH', 'Euryops chrysanthemoides', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('KDLPI', 'Cordyla pinnata', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('EUEPB', 'Eugenia palumbis', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('SOLER', 'Solanum erianthum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('PTLFR', 'Dasiphora fruticosa', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('APTPH', 'Aphananthe philippinensis', '1MAGP', 'Magnoliophyta', '1CAIF', 'Cannabaceae'),
    ('PRNYE', 'Prunus x yedoensis', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('GANDU', 'Garcinia dulcis', '1MAGP', 'Magnoliophyta', '1GUTF', 'Clusiaceae'),
    ('XIMAM', 'Ximenia americana', '1MAGP', 'Magnoliophyta', '1OLAF', 'Olacaceae'),
    ('CZRVL', 'Coronilla valentina', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('FIUCH', 'Ficus chartacea', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('1OLVG', 'Olea', '1MAGP', 'Magnoliophyta', '1OLEF', 'Oleaceae'),
    ('PIUBR', 'Pinus brutia', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('CSTAL', 'Cistus albidus', '1MAGP', 'Magnoliophyta', '1CISF', 'Cistaceae'),
    ('DATSS', 'Datura sp.', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('1GREG', 'Grevillea', '1MAGP', 'Magnoliophyta', '1PROF', 'Proteaceae'),
    ('RHZSS', 'Rhizophora sp.', '1MAGP', 'Magnoliophyta', '1RHIF', 'Rhizophoraceae'),
    ('HYPJA', 'Hypericum japonicum', '1MAGP', 'Magnoliophyta', '1HPRF', 'Hypericaceae'),
    ('QUEAL', 'Quercus alba', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('CSNPU', 'Castanea pumila', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('1PYUG', 'Pyrus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('BGTED', 'Barringtonia edulis', '1MAGP', 'Magnoliophyta', '1LECF', 'Lecythidaceae'),
    ('ABISA', 'Abies sachalinensis', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('QUEPU', 'Quercus pubescens', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('GANVE', 'Garcinia venulosa', '1MAGP', 'Magnoliophyta', '1GUTF', 'Clusiaceae'),
    ('SOUAM', 'Sorbus americana', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('BUWGA', 'Bouea macrophylla', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('SOLTL', 'Solanum trilobatum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('CTTBU', 'Cotoneaster bullatus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ALLFI', 'Allium fistulosum', '1MAGP', 'Magnoliophyta', '1AMYF', 'Amaryllidaceae'),
    ('ULMPR', 'Ulmus procera', '1MAGP', 'Magnoliophyta', '1ULMF', 'Ulmaceae'),
    ('1ZELG', 'Zelkova', '1MAGP', 'Magnoliophyta', '1ULMF', 'Ulmaceae'),
    ('SOLAM', 'Solanum americanum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('PAQSU', 'Passiflora suberosa', '1MAGP', 'Magnoliophyta', '1PASF', 'Passifloraceae'),
    ('MORNI', 'Morus nigra', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('GENHS', 'Genista hirsuta', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('RUBUL', 'Rubus ulmifolius', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CIDLA', 'Citrus x latifolia', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('CUUMO', 'Cucurbita moschata', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('1CSUG', 'Casuarina', '1MAGP', 'Magnoliophyta', '1CASF', 'Casuarinaceae'),
    ('KRMAS', 'Crinum asiaticum', '1MAGP', 'Magnoliophyta', '1AMYF', 'Amaryllidaceae'),
    ('1VACG', 'Vaccinium', '1MAGP', 'Magnoliophyta', '1ERIF', 'Ericaceae'),
    ('1PSIG', 'Psidium', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('MEIAZ', 'Melia azedarach', '1MAGP', 'Magnoliophyta', '1MELF', 'Meliaceae'),
    ('ULEEU', 'Ulex europaeus', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('1TOOG', 'Toona', '1MAGP', 'Magnoliophyta', '1MELF', 'Meliaceae'),
    ('UVAGF', 'Uvaria grandiflora', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('MZTMA', 'Mitrephora maingayi', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('ELECO', 'Eleusine coracana', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('VITVS', 'Vitis vinifera subsp. sylvestris', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('PAQQU', 'Passiflora quadrangularis', '1MAGP', 'Magnoliophyta', '1PASF', 'Passifloraceae'),
    ('1PEBG', 'Persea', '1MAGP', 'Magnoliophyta', '1LAUF', 'Lauraceae'),
    ('SOLSC', 'Solanum scabrum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('AGBEN', 'Arenga engleri', '1MAGP', 'Magnoliophyta', '1PALF', 'Arecaceae'),
    ('TILMI', 'Tilia miqueliana', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('TRFPR', 'Trifolium pratense', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('BETPE', 'Betula pendula', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('EUEDO', 'Eugenia dombeyi', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('LOLPE', 'Lolium perenne', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('SNOKO', 'Sandoricum koetjape', '1MAGP', 'Magnoliophyta', '1MELF', 'Meliaceae'),
    ('PIUNL', 'Pinus nigra subsp. laricio', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('FIULP', 'Ficus lepicarpa', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('CSNHE', 'Castanea henryi', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('QUECA', 'Quercus calliprinos', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('AGBWE', 'Arenga westerhoutii', '1MAGP', 'Magnoliophyta', '1PALF', 'Arecaceae'),
    ('DYXPA', 'Dysoxylum parasiticum', '1MAGP', 'Magnoliophyta', '1MELF', 'Meliaceae'),
    ('PHYMI', 'Physalis minima', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('SOLNI', 'Solanum nigrum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('ZIPJU', 'Ziziphus jujuba', '1MAGP', 'Magnoliophyta', '1RHAF', 'Rhamnaceae'),
    ('MYMIN', 'Myoporum insulare', '1MAGP', 'Magnoliophyta', '1SCPF', 'Scrophulariaceae'),
    ('1FOLG', 'Fortunella', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('PIUPN', 'Pinus pinea', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('LOLMU', 'Lolium multiflorum', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('BRFLA', 'Brunfelsia lactea', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('MABSS', 'Malus sp.', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('1LIEG', 'Lindera', '1MAGP', 'Magnoliophyta', '1LAUF', 'Lauraceae'),
    ('FOLMA', 'Fortunella margarita', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('1MORG', 'Morus', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('VITDO', 'Vitis x doaniana', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('PKIGR', 'Rhodocactus grandifolius', '1MAGP', 'Magnoliophyta', '1CACF', 'Cactaceae'),
    ('SETVI', 'Setaria viridis', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('QUEVI', 'Quercus virginiana', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('LUFAE', 'Luffa aegyptiaca', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('POJVI', 'Pouteria viridis', '1MAGP', 'Magnoliophyta', '1SATF', 'Sapotaceae'),
    ('STFTE', 'Staphylea ternata', '1MAGP', 'Magnoliophyta', '1STFF', 'Staphyleaceae'),
    ('FIUSA', 'Ficus sagittata', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('BYIRA', 'Breynia racemosa', '1MAGP', 'Magnoliophyta', '1PYLF', 'Phyllanthaceae'),
    ('EIOJA', 'Eriobotrya japonica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('SBHFL', 'Saba comorensis', '1MAGP', 'Magnoliophyta', '1APOF', 'Apocynaceae'),
    ('1ALUG', 'Alnus', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('ARLCO', 'Aralia cordata', '1MAGP', 'Magnoliophyta', '1ARLF', 'Araliaceae'),
    ('STZRE', 'Strelitzia reginae', '1MAGP', 'Magnoliophyta', '1STZF', 'Strelitziaceae'),
    ('CAHSQ', 'Camellia sasanqua', '1MAGP', 'Magnoliophyta', '1THEF', 'Theaceae'),
    ('NUCLA', 'Nauclea latifolia', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('IUGHI', 'Juglans hindsii', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('PRKSP', 'Parkia speciosa', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('SETPA', 'Setaria palmifolia', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('POPNT', 'Populus nigra var. italica', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('1MABG', 'Malus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('1ROSG', 'Rosa', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CAHRU', 'Camellia japonica subsp. rusticana', '1MAGP', 'Magnoliophyta', '1THEF', 'Theaceae'),
    ('DPYPA', 'Diplocyclos palmatus', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('MNGGR', 'Mangifera griffithii', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('DOSTU', 'Diospyros tutcheri', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('PRNSN', 'Prunus spinosa', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('TEMCA', 'Terminalia catappa', '1MAGP', 'Magnoliophyta', '1CMBF', 'Combretaceae'),
    ('GANNN', 'Garcinia mannii', '1MAGP', 'Magnoliophyta', '1GUTF', 'Clusiaceae'),
    ('SPXPU', 'Spondias purpurea', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('CISCA', 'Carissa carandas', '1MAGP', 'Magnoliophyta', '1APOF', 'Apocynaceae'),
    ('QUEGU', 'Quercus glauca', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('SAXVI', 'Salix viminalis', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('SAXIG', 'Salix integra', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('DOSDH', 'Diospyros diepenhorstii', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('RUBID', 'Rubus idaeus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PHYPE', 'Physalis peruviana', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('LURSS', 'Laurus sp.', '1MAGP', 'Magnoliophyta', '1LAUF', 'Lauraceae'),
    ('LIQFO', 'Liquidambar formosana', '1MAGP', 'Magnoliophyta', '1AJGF', 'Altingiaceae'),
    ('ACRBU', 'Acer buergerianum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('DRNST', 'Dracaena steudneri', '1MAGP', 'Magnoliophyta', '1ASGF', 'Asparagaceae'),
    ('CNBAL', 'Canarium album', '1MAGP', 'Magnoliophyta', '1BURF', 'Burseraceae'),
    ('VITCH', 'Vitis x champinii', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('PTFST', 'Pterocarya stenoptera', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('BTBSI', 'Artabotrys siamensis', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('ACRPE', 'Acer pensylvanicum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('TOXQU', 'Toxicodendron pubescens', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('SPXMO', 'Spondias mombin', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('AMEAL', 'Amelanchier alnifolia', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('FIUSS', 'Ficus sp.', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('ANUSQ', 'Annona squamosa', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('DOSGN', 'Diospyros glandulosa', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('FLCRU', 'Flacourtia rukam', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('HEOEU', 'Heliotropium europaeum', '1MAGP', 'Magnoliophyta', '1BORF', 'Boraginaceae'),
    ('QUEAS', 'Quercus acutissima', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('ANURE', 'Annona reticulata', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('XYOCO', 'Xylosma congesta', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('BETPL', 'Betula platyphylla', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('HCRUN', 'Selenicereus undatus', '1MAGP', 'Magnoliophyta', '1CACF', 'Cactaceae'),
    ('CSUST', 'Allocasuarina verticillata', '1MAGP', 'Magnoliophyta', '1CASF', 'Casuarinaceae'),
    ('PRNPS', 'Prunus persica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('DOSMR', 'Diospyros maritima', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('CTRSS', 'Calotropis sp.', '1MAGP', 'Magnoliophyta', '1APOF', 'Apocynaceae'),
    ('PRKAF', 'Parkia biglobosa', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('HELAN', 'Helianthus annuus', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('MUNCA', 'Muntingia calabura', '1MAGP', 'Magnoliophyta', '1MUNF', 'Muntingiaceae'),
    ('KERJA', 'Kerria japonica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PIEOR', 'Picea orientalis', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('PHSMU', 'Vigna mungo', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('BRNKM', 'Broussonetia kaempferi', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('CSCOX', 'Crataegus laevigata', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PBOFO', 'Phoebe formosana', '1MAGP', 'Magnoliophyta', '1LAUF', 'Lauraceae'),
    ('CIDGR', 'Citrus maxima', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('LADHE', 'Landolphia heudelotii', '1MAGP', 'Magnoliophyta', '1APOF', 'Apocynaceae'),
    ('LISSA', 'Litsea salicifolia', '1MAGP', 'Magnoliophyta', '1LAUF', 'Lauraceae'),
    ('PEBAM', 'Persea americana', '1MAGP', 'Magnoliophyta', '1LAUF', 'Lauraceae'),
    ('IUGAI', 'Juglans ailanthifolia', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('SYHME', 'Strychnos mellodora', '1MAGP', 'Magnoliophyta', '1LOGF', 'Loganiaceae'),
    ('CCSSI', 'Cercis siliquastrum', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('DOSDI', 'Diospyros nigra', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('CMYJA', 'Cryptomeria japonica', '1PINP', 'Pinophyta', '1CUPF', 'Cupressaceae'),
    ('AYLHE', 'Anthyllis hermanniae', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('NTGSA', 'Nestegis sandwicensis', '1MAGP', 'Magnoliophyta', '1OLEF', 'Oleaceae'),
    ('PYLAC', 'Phyllanthus acidus', '1MAGP', 'Magnoliophyta', '1PYLF', 'Phyllanthaceae'),
    ('MOMCO', 'Momordica cochinchinensis', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('CWSAC', 'Casearia aculeata', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('PHSVX', 'Phaseolus vulgaris', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('ABIHL', 'Abies holophylla', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('QUEVB', 'Quercus variabilis', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('CXSES', 'Colocasia esculenta', '1MAGP', 'Magnoliophyta', '1ARMF', 'Araceae'),
    ('VACDA', 'Vaccinium darrowii', '1MAGP', 'Magnoliophyta', '1ERIF', 'Ericaceae'),
    ('ROSDM', 'Rosa x damascena', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('DRPFL', 'Drypetes floribunda', '1MAGP', 'Magnoliophyta', '1QTJF', 'Putranjivaceae'),
    ('CAWMI', 'Caryota mitis', '1MAGP', 'Magnoliophyta', '1PALF', 'Arecaceae'),
    ('1SAXG', 'Salix', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('POLLA', 'Persicaria lapathifolia', '1MAGP', 'Magnoliophyta', '1POLF', 'Polygonaceae'),
    ('PRNPN', 'Prunus persica var. nucipersica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CTTLU', 'Cotoneaster lucidus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('POPCN', 'Populus x canescens', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('POGMY', 'Polygala myrtifolia', '1MAGP', 'Magnoliophyta', '1POGF', 'Polygalaceae'),
    ('ROSRG', 'Rosa rugosa', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('PIAVE', 'Pistacia vera', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('LUFAC', 'Luffa acutangula', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('1LIQG', 'Liquidambar', '1MAGP', 'Magnoliophyta', '1AJGF', 'Altingiaceae'),
    ('1OSTG', 'Ostrya', '1MAGP', 'Magnoliophyta', '1BETF', 'Betulaceae'),
    ('POPCA', 'Populus x canadensis', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('GMEPH', 'Gmelina philippensis', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('HBEEL', 'Hebe elliptica', '1MAGP', 'Magnoliophyta', '1PLAF', 'Plantaginaceae'),
    ('MNGIN', 'Mangifera indica', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('ABFSE', 'Artocarpus sericicarpus', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('DATCA', 'Brugmansia x candida', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('GRWAS', 'Grewia asiatica', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('ANMCO', 'Anemone coronaria', '1MAGP', 'Magnoliophyta', '1RANF', 'Ranunculaceae'),
    ('SOLDU', 'Solanum dulcamara', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('GLWPE', 'Glycosmis pentaphylla', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('LISGU', 'Litsea glutinosa', '1MAGP', 'Magnoliophyta', '1LAUF', 'Lauraceae'),
    ('SAXCP', 'Salix caprea', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('CXEAL', 'Clethra alnifolia', '1MAGP', 'Magnoliophyta', '1CXEF', 'Clethraceae'),
    ('DIUES', 'Dioscorea esculenta', '1MAGP', 'Magnoliophyta', '1DIOF', 'Dioscoreaceae'),
    ('PIURA', 'Pinus radiata', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('CRHSS', 'Cordia sp.', '1MAGP', 'Magnoliophyta', '1BORF', 'Boraginaceae'),
    ('MHUAR', 'Myrianthus arboreus', '1MAGP', 'Magnoliophyta', '1URTF', 'Urticaceae'),
    ('ABFNI', 'Artocarpus nitidus', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('CSOSS', 'Castanopsis sp.', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('MABAC', 'Malus asiatica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('GOSSS', 'Gossypium sp.', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('PYUPS', 'Pyrus pyraster', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CCNNU', 'Cocos nucifera', '1MAGP', 'Magnoliophyta', '1PALF', 'Arecaceae'),
    ('GOCLI', 'Phyllanthus littoralis', '1MAGP', 'Magnoliophyta', '1PYLF', 'Phyllanthaceae'),
    ('CTTWT', 'Cotoneaster x watereri', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ADACN', 'Ardisia crenata', '1MAGP', 'Magnoliophyta', '1PRIF', 'Primulaceae'),
    ('ATIFU', 'Actinidia fulvicoma', '1MAGP', 'Magnoliophyta', '1ACTF', 'Actinidiaceae'),
    ('FLCIN', 'Flacourtia indica', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('POLPY', 'Persicaria pensylvanica', '1MAGP', 'Magnoliophyta', '1POLF', 'Polygonaceae'),
    ('VITCO', 'Vitis coignetiae', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('CIDNO', 'Citrus x nobilis', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('ROSCN', 'Rosa canina', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('EHTMI', 'Ehretia microphylla', '1MAGP', 'Magnoliophyta', '1BORF', 'Boraginaceae'),
    ('MLPGL', 'Malpighia glabra', '1MAGP', 'Magnoliophyta', '1MALF', 'Malpighiaceae'),
    ('FAUSY', 'Fagus sylvatica', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('CRGCA', 'Corchorus capsularis', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('SOLAT', 'Solanum atropurpureum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('SPXPI', 'Spondias pinnata', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('PAQLI', 'Passiflora ligularis', '1MAGP', 'Magnoliophyta', '1PASF', 'Passifloraceae'),
    ('PMEPI', 'Pometia pinnata', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('POPTO', 'Populus tomentosa', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('HEEHE', 'Hedera helix', '1MAGP', 'Magnoliophyta', '1ARLF', 'Araliaceae'),
    ('ACROB', 'Acer oblongum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('CIDSI', 'Citrus x aurantium var. sinensis', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('LONJA', 'Lonicera japonica', '1MAGP', 'Magnoliophyta', '1CPFF', 'Caprifoliaceae'),
    ('SLGSS', 'Salpiglossis sp.', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('ELGEB', 'Elaeagnus x submacrophylla', '1MAGP', 'Magnoliophyta', '1ELAF', 'Elaeagnaceae'),
    ('QUEPN', 'Quercus pyrenaica', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('QUEGL', 'Quercus serrata', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('GEBJA', 'Gerbera jamesonii', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('MOJRO', 'Gynochthodes umbellata', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('PIPKA', 'Piper kadsura', '1MAGP', 'Magnoliophyta', '1PIPF', 'Piperaceae'),
    ('1LIHG', 'Litchi', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('1VING', 'Vinca', '1MAGP', 'Magnoliophyta', '1APOF', 'Apocynaceae'),
    ('CIDSW', 'Citrus swinglei', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('ABFIN', 'Artocarpus integer', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('FLISS', 'Flindersia sp.', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('BCCAN', 'Baccaurea angulata', '1MAGP', 'Magnoliophyta', '1PYLF', 'Phyllanthaceae'),
    ('CYLSI', 'Corylus sieboldiana', '1MAGP', 'Magnoliophyta', '1CRLF', 'Corylaceae'),
    ('SZTSS', 'Schizanthus sp.', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('CIDAY', 'Citrus x amblycarpa', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('LQZAL', 'Lepisanthes alata', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('AGRRE', 'Elymus repens', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('GANTI', 'Garcinia xanthochymus', '1MAGP', 'Magnoliophyta', '1GUTF', 'Clusiaceae'),
    ('MMOEL', 'Mimusops elengi', '1MAGP', 'Magnoliophyta', '1SATF', 'Sapotaceae'),
    ('BUXMS', 'Buxus sinica', '1MAGP', 'Magnoliophyta', '1BUXF', 'Buxaceae'),
    ('SOLAG', 'Solanum anguivi', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('SEAVI', 'Flueggea virosa', '1MAGP', 'Magnoliophyta', '1PYLF', 'Phyllanthaceae'),
    ('NEECU', 'Nephelium cuspidatum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('SMICH', 'Smilax china', '1MAGP', 'Magnoliophyta', '1SMIF', 'Smilacaceae'),
    ('VITAM', 'Vitis amurensis', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('AVRCA', 'Averrhoa carambola', '1MAGP', 'Magnoliophyta', '1OXAF', 'Oxalidaceae'),
    ('EXAAG', 'Excoecaria agallocha', '1MAGP', 'Magnoliophyta', '1EUPF', 'Euphorbiaceae'),
    ('HNXTR', 'Heynea trijuga', '1MAGP', 'Magnoliophyta', '1MELF', 'Meliaceae'),
    ('FIUCA', 'Ficus carica', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('BGTAC', 'Barringtonia acutangula', '1MAGP', 'Magnoliophyta', '1LECF', 'Lecythidaceae'),
    ('ZEHWA', 'Zehneria wallichii', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('PYUSK', 'Pyrus x sinkiangensis', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('MORAL', 'Morus alba', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('CSFCA', 'Chrysophyllum cainito', '1MAGP', 'Magnoliophyta', '1SATF', 'Sapotaceae'),
    ('NEELA', 'Nephelium lappaceum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('CYAIL', 'Carya illinoinensis', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('MOJCO', 'Morinda coreia', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('1CTLG', 'Catalpa', '1MAGP', 'Magnoliophyta', '1BIGF', 'Bignoniaceae'),
    ('TEMCH', 'Terminalia chebula', '1MAGP', 'Magnoliophyta', '1CMBF', 'Combretaceae'),
    ('AMARE', 'Amaranthus retroflexus', '1MAGP', 'Magnoliophyta', '1AMAF', 'Amaranthaceae'),
    ('1CAJG', 'Cajanus', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('FAUCR', 'Fagus crenata', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('1ROBG', 'Robinia', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('CTTLA', 'Cotoneaster lacteus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('POPCT', 'Populus cathayana', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('IUGMA', 'Juglans major', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('FIUVR', 'Ficus virgata', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('LGOMO', 'Retama monosperma', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('CYLAV', 'Corylus avellana', '1MAGP', 'Magnoliophyta', '1CRLF', 'Corylaceae'),
    ('ZANSI', 'Zanthoxylum bungeanum', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('AVRBI', 'Averrhoa bilimbi', '1MAGP', 'Magnoliophyta', '1OXAF', 'Oxalidaceae'),
    ('BLISA', 'Blighia sapida', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('ERIBO', 'Erigeron bonariensis', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('SOLTP', 'Solanum sessiliflorum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('SAXBA', 'Salix babylonica', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('MNGCA', 'Mangifera caesia', '1MAGP', 'Magnoliophyta', '1ANAF', 'Anacardiaceae'),
    ('LAVAN', 'Lavandula angustifolia', '1MAGP', 'Magnoliophyta', '1LAMF', 'Lamiaceae'),
    ('RUDFU', 'Rudbeckia fulgida', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('PEBTH', 'Machilus thunbergii', '1MAGP', 'Magnoliophyta', '1LAUF', 'Lauraceae'),
    ('PIUCE', 'Pinus cembra', '1PINP', 'Pinophyta', '1PINF', 'Pinaceae'),
    ('1MUBG', 'Musa', '1MAGP', 'Magnoliophyta', '1MUSF', 'Musaceae'),
    ('EUEUN', 'Eugenia uniflora', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('ACRMO', 'Acer pictum subsp. mono', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('1TRZG', 'Triticum', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('ACRTU', 'Acer truncatum', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('GENEP', 'Genista ephedroides', '1MAGP', 'Magnoliophyta', '1LEGF', 'Fabaceae'),
    ('SOLMU', 'Solanum muricatum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('EYBHE', 'Erycibe henryi', '1MAGP', 'Magnoliophyta', '1COVF', 'Convolvulaceae'),
    ('CTTSA', 'Cotoneaster salicifolius', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('MABSD', 'Malus domestica', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ANUAT', 'Annona x atemoya', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('OLXSC', 'Olax scandens', '1MAGP', 'Magnoliophyta', '1OLAF', 'Olacaceae'),
    ('FATJA', 'Fatsia japonica', '1MAGP', 'Magnoliophyta', '1ARLF', 'Araliaceae'),
    ('PYUCA', 'Pyrus calleryana', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('RUBZM', 'Rubus sumatranus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('URNLO', 'Urena lobata', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae'),
    ('CONCN', 'Convolvulus cneorum', '1MAGP', 'Magnoliophyta', '1COVF', 'Convolvulaceae'),
    ('IUGMN', 'Juglans mandshurica', '1MAGP', 'Magnoliophyta', '1JUGF', 'Juglandaceae'),
    ('ABFLC', 'Artocarpus lanceifolius', '1MAGP', 'Magnoliophyta', '1MORF', 'Moraceae'),
    ('CSTIS', 'Cistus x incanus', '1MAGP', 'Magnoliophyta', '1CISF', 'Cistaceae'),
    ('DOSJA', 'Diospyros japonica', '1MAGP', 'Magnoliophyta', '1EBEF', 'Ebenaceae'),
    ('CUMPR', 'Cucumis prophetarum', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('NLTSE', 'Neolitsea sericea', '1MAGP', 'Magnoliophyta', '1LAUF', 'Lauraceae'),
    ('1KOTG', 'Koelreuteria', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('SYZJA', 'Syzygium jambos', '1MAGP', 'Magnoliophyta', '1MYTF', 'Myrtaceae'),
    ('CIDDP', 'Citrus depressa', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('1ZIIG', 'Zinnia', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('CUUMI', 'Cucurbita argyrosperma', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('PRNCM', 'Prunus campanulata', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('ELGAN', 'Elaeagnus angustifolia', '1MAGP', 'Magnoliophyta', '1ELAF', 'Elaeagnaceae'),
    ('UVAMA', 'Uvaria littoralis', '1MAGP', 'Magnoliophyta', '1ANNF', 'Annonaceae'),
    ('PRNDV', 'Prunus davidiana', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('SAXJE', 'Salix pierotii', '1MAGP', 'Magnoliophyta', '1SALF', 'Salicaceae'),
    ('ZANNI', 'Zanthoxylum nitidum', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('CITCO', 'Citrullus colocynthis', '1MAGP', 'Magnoliophyta', '1CUCF', 'Cucurbitaceae'),
    ('PYLEM', 'Phyllanthus emblica', '1MAGP', 'Magnoliophyta', '1PYLF', 'Phyllanthaceae'),
    ('AZJEX', 'Azadirachta excelsa', '1MAGP', 'Magnoliophyta', '1MELF', 'Meliaceae'),
    ('ULMAM', 'Ulmus americana', '1MAGP', 'Magnoliophyta', '1ULMF', 'Ulmaceae'),
    ('CHYFR', 'Argyranthemum frutescens', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('VACRC', 'Vaccinium reticulatum', '1MAGP', 'Magnoliophyta', '1ERIF', 'Ericaceae'),
    ('MYRRU', 'Morella rubra', '1MAGP', 'Magnoliophyta', '1MYIF', 'Myricaceae'),
    ('PRNLR', 'Prunus laurocerasus', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('CSOCS', 'Castanopsis sieboldii', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('HORVX', 'Hordeum vulgare', '1MAGP', 'Magnoliophyta', '1GRAF', 'Poaceae'),
    ('STVDA', 'Photinia davidiana', '1MAGP', 'Magnoliophyta', '1ROSF', 'Rosaceae'),
    ('KRLBR', 'Carallia brachiata', '1MAGP', 'Magnoliophyta', '1RHIF', 'Rhizophoraceae'),
    ('CIDUN', 'Citrus x aurantium var. unshiu', '1MAGP', 'Magnoliophyta', '1RUTF', 'Rutaceae'),
    ('1PRTG', 'Parthenocissus', '1MAGP', 'Magnoliophyta', '1VITF', 'Vitaceae'),
    ('CSNCR', 'Castanea crenata', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('IXRMA', 'Ixora macrothyrsa', '1MAGP', 'Magnoliophyta', '1RUBF', 'Rubiaceae'),
    ('RHAAL', 'Rhamnus alaternus', '1MAGP', 'Magnoliophyta', '1RHAF', 'Rhamnaceae'),
    ('ARTSS', 'Artemisia sp.', '1MAGP', 'Magnoliophyta', '1COMF', 'Asteraceae'),
    ('HGUMA', 'Hanguana malayana', '1MAGP', 'Magnoliophyta', '1HANF', 'Hanguanaceae'),
    ('GANSU', 'Garcinia subelliptica', '1MAGP', 'Magnoliophyta', '1GUTF', 'Clusiaceae'),
    ('BKXBA', 'Balakata baccata', '1MAGP', 'Magnoliophyta', '1EUPF', 'Euphorbiaceae'),
    ('DMCLO', 'Dimocarpus longan', '1MAGP', 'Magnoliophyta', '1SAPF', 'Sapindaceae'),
    ('HYPPE', 'Hypericum perforatum', '1MAGP', 'Magnoliophyta', '1HPRF', 'Hypericaceae'),
    ('MLORI', 'Meliosma rigida', '1MAGP', 'Magnoliophyta', '1SABF', 'Sabiaceae'),
    ('SOLTU', 'Solanum tuberosum', '1MAGP', 'Magnoliophyta', '1SOLF', 'Solanaceae'),
    ('QUERU', 'Quercus rubra', '1MAGP', 'Magnoliophyta', '1FAGF', 'Fagaceae'),
    ('ZPSVI', 'Aporosa villosa', '1MAGP', 'Magnoliophyta', '1PYLF', 'Phyllanthaceae'),
    ('GANPR', 'Garcinia prainiana', '1MAGP', 'Magnoliophyta', '1GUTF', 'Clusiaceae'),
    ('HIBPA', 'Hibiscus palustris', '1MAGP', 'Magnoliophyta', '1MAVF', 'Malvaceae');

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

-- Names for host Annona senegalensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('ANUSE', 'Wild custard apple', 'en');

-- Names for host Vaccinium virgatum
INSERT INTO plants_names(plant, name, language) VALUES
    ('VACVG', 'Rabbit-eye blueberry', 'en'),
    ('VACVG', 'Smallflower blueberry', 'en');

-- Names for host Hyoscyamus niger
INSERT INTO plants_names(plant, name, language) VALUES
    ('HSYNI', 'Black henbane', 'en'),
    ('HSYNI', 'Common henbane', 'en'),
    ('HSYNI', 'Henbane', 'en'),
    ('HSYNI', 'Guisquiamo nero', 'it'),
    ('HSYNI', 'Fava parcina', 'it'),
    ('HSYNI', 'Alterco', 'it'),
    ('HSYNI', 'Disturbo', 'it');

-- Names for host Helichrysum italicum
INSERT INTO plants_names(plant, name, language) VALUES
    ('HECIT', 'White-leaved everlasting', 'en'),
    ('HECIT', 'Curry plant', 'en'),
    ('HECIT', 'Italian everlasting', 'en'),
    ('HECIT', 'Elicriso', 'it'),
    ('HECIT', 'Perpetuini d''Italia', 'it');

-- Names for host Ficus fistulosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('FIUFI', 'Common yellow stem fig', 'en');

-- Names for host Manilkara jaimiqui
INSERT INTO plants_names(plant, name, language) VALUES
    ('MNKJA', 'Kanapalei', 'en'),
    ('MNKJA', 'Wild dilly', 'en');

-- Names for host Lagerstroemia indica
INSERT INTO plants_names(plant, name, language) VALUES
    ('LAEIN', 'Indian crape myrtle', 'en'),
    ('LAEIN', 'Cannonball', 'en'),
    ('LAEIN', 'Carrion tree', 'en'),
    ('LAEIN', 'Crepe myrtle', 'en'),
    ('LAEIN', 'June rose', 'en'),
    ('LAEIN', 'Lilac of the south', 'en'),
    ('LAEIN', 'Lagerstremia', 'it');

-- Names for host Phlomis fruticosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('PLMFR', 'Jerusalem sage', 'en'),
    ('PLMFR', 'Tree sage', 'en'),
    ('PLMFR', 'Wild mullein', 'en'),
    ('PLMFR', 'Salvione giallo', 'it'),
    ('PLMFR', 'Flomide arbustive', 'it');

-- Names for host Castanea sativa
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSNSA', 'Sweet chestnut', 'en'),
    ('CSNSA', 'Spanish chestnut', 'en'),
    ('CSNSA', 'Castagno comune', 'it'),
    ('CSNSA', 'Castagno', 'it');

-- Names for host Clematis vitalba
INSERT INTO plants_names(plant, name, language) VALUES
    ('CLVVT', 'Graybeard', 'en'),
    ('CLVVT', 'Old man''s beard', 'en'),
    ('CLVVT', 'Traveller''s joy', 'en'),
    ('CLVVT', 'Vitalba', 'it'),
    ('CLVVT', 'Viorna', 'it'),
    ('CLVVT', 'Clematide', 'it'),
    ('CLVVT', 'Clematide vitalba', 'it');

-- Names for host Alangium chinense
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALNCH', 'Alangio cinese', 'it');

-- Names for host Datura innoxia
INSERT INTO plants_names(plant, name, language) VALUES
    ('DATIN', 'Hoary thorn-apple', 'en'),
    ('DATIN', 'Sacred datura', 'en'),
    ('DATIN', 'Downy thorn-apple', 'en'),
    ('DATIN', 'Prickly burr', 'en'),
    ('DATIN', 'Angel''s trumpet', 'en'),
    ('DATIN', 'Noce metella', 'it'),
    ('DATIN', 'Stramonio metello', 'it');

-- Names for host Erigeron sumatrensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('ERISU', 'Guersey fleabane', 'en'),
    ('ERISU', 'Guernsey fleabane', 'en'),
    ('ERISU', 'Saeppola di Naudin', 'it');

-- Names for host Quercus palustris
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUEPA', 'Pin oak', 'en'),
    ('QUEPA', 'Swamp oak', 'en'),
    ('QUEPA', 'Quercia delle paludi', 'it');

-- Names for host Santolina chamaecyparissus
INSERT INTO plants_names(plant, name, language) VALUES
    ('SNTCH', 'Cypress cotton', 'en'),
    ('SNTCH', 'Lavender cotton', 'en'),
    ('SNTCH', 'Cotton lavender', 'en'),
    ('SNTCH', 'Cypress lavender cotton', 'en'),
    ('SNTCH', 'Santolina', 'it'),
    ('SNTCH', 'Crespolina', 'it'),
    ('SNTCH', 'Crespolina di Marchi', 'it');

-- Names for host Ficus racemosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('FIURM', 'Cluster fig', 'en'),
    ('FIURM', 'Gular', 'en'),
    ('FIURM', 'Red river fig', 'en');

-- Names for host Canarium indicum
INSERT INTO plants_names(plant, name, language) VALUES
    ('CNBCO', 'Elemi', 'en'),
    ('CNBCO', 'Java almond', 'en'),
    ('CNBCO', 'Kenari nut', 'en'),
    ('CNBCO', 'Canary nuts', 'en'),
    ('CNBCO', 'Elemi', 'it');

-- Names for host Acer saccharum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRSC', 'Hard maple', 'en'),
    ('ACRSC', 'Rock maple', 'en'),
    ('ACRSC', 'Sugar maple', 'en'),
    ('ACRSC', 'Rocki maple', 'en'),
    ('ACRSC', 'Acero zuccherino', 'it'),
    ('ACRSC', 'Acero da zucchero', 'it');

-- Names for host Kyllinga gracillima
INSERT INTO plants_names(plant, name, language) VALUES
    ('KYLGR', 'False green kyllinga', 'en'),
    ('KYLGR', 'Pasture spike sedge', 'en');

-- Names for host Juglans mollis
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGMO', 'Guatemala walnut', 'en');

-- Names for host Sorghum bicolor
INSERT INTO plants_names(plant, name, language) VALUES
    ('SORVU', 'Common sorghum', 'en'),
    ('SORVU', 'Grain sorghum', 'en'),
    ('SORVU', 'Great millet', 'en'),
    ('SORVU', 'Sorghum', 'en'),
    ('SORVU', 'Guinea corn', 'en'),
    ('SORVU', 'Beer sorghum', 'en'),
    ('SORVU', 'Giant millet', 'en'),
    ('SORVU', 'Millet', 'en'),
    ('SORVU', 'Sorgho', 'en'),
    ('SORVU', 'Miglio', 'it'),
    ('SORVU', 'Sorgo', 'it'),
    ('SORVU', 'Melica', 'it'),
    ('SORVU', 'Meliga', 'it'),
    ('SORVU', 'Saggina', 'it'),
    ('SORVU', 'Sorgo coltivato', 'it');

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

-- Names for host Maackia amurensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('MCKAM', 'Amur maackia', 'en'),
    ('MCKAM', 'Maackia dell''Amur', 'it');

-- Names for host Aesculus hippocastanum
INSERT INTO plants_names(plant, name, language) VALUES
    ('AECHI', 'Horse chestnut', 'en'),
    ('AECHI', 'Common horse chestnut', 'en'),
    ('AECHI', 'Castagno ippocastano', 'it'),
    ('AECHI', 'Eschilo', 'it'),
    ('AECHI', 'Castagno d''India', 'it'),
    ('AECHI', 'Castagno amaro', 'it'),
    ('AECHI', 'Ippocastano', 'it');

-- Names for host Cytisus villosus
INSERT INTO plants_names(plant, name, language) VALUES
    ('CZSVI', 'Hairy broom', 'en'),
    ('CZSVI', 'Citiso trifloro', 'it'),
    ('CZSVI', 'Citiso villoso', 'it');

-- Names for host Premna serratifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRESE', 'Buas-buas', 'en');

-- Names for host Mespilus germanica
INSERT INTO plants_names(plant, name, language) VALUES
    ('MSPGE', 'Common medlar', 'en'),
    ('MSPGE', 'Medlar', 'en'),
    ('MSPGE', 'Nespolo comune', 'it'),
    ('MSPGE', 'Nespolo volgare', 'it');

-- Names for host Drymocallis glandulosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('PTLGL', 'Sticky cinquefoil', 'en');

-- Names for host Psidium guajava
INSERT INTO plants_names(plant, name, language) VALUES
    ('PSIGU', 'Common guava', 'en'),
    ('PSIGU', 'Guava', 'en'),
    ('PSIGU', 'Yellow guava', 'en'),
    ('PSIGU', 'Guaia giallo', 'it'),
    ('PSIGU', 'Pero dell''India', 'it');

-- Names for host Cotoneaster moupinensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('CTTMO', 'Moupin cotoneaster', 'en');

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

-- Names for host Cistus creticus
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSTIC', 'Pink rockrose', 'en'),
    ('CSTIC', 'Grey cistus', 'en'),
    ('CSTIC', 'White-leaved rockrose', 'en'),
    ('CSTIC', 'Cisto di Creta', 'it');

-- Names for host Solanum pseudocapsicum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLPC', 'Coral cherry', 'en'),
    ('SOLPC', 'Jerusalem cherry', 'en'),
    ('SOLPC', 'Madeira winter cherry', 'en'),
    ('SOLPC', 'False Jerusalem cherry', 'en'),
    ('SOLPC', 'Star capsicum', 'en');

-- Names for host Castanea mollissima
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSNMO', 'Chinese chestnut', 'en'),
    ('CSNMO', 'Castagno cinese', 'it');

-- Names for host Mangifera foetida
INSERT INTO plants_names(plant, name, language) VALUES
    ('MNGFO', 'Bachang mango', 'en'),
    ('MNGFO', 'Grey mango', 'en'),
    ('MNGFO', 'Horse mango', 'en');

-- Names for host Vitellaria paradoxa
INSERT INTO plants_names(plant, name, language) VALUES
    ('VILPA', 'Shea butter nut', 'en'),
    ('VILPA', 'Bambuk butter tree', 'en'),
    ('VILPA', 'Albero del burro', 'it');

-- Names for host Morus bombycis
INSERT INTO plants_names(plant, name, language) VALUES
    ('MORBO', 'Aino mulberry', 'en'),
    ('MORBO', 'Japanese mulberry', 'en');

-- Names for host Pisum sativum
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIBSX', 'Round-seeded pea', 'en'),
    ('PIBSX', 'Garden pea', 'en'),
    ('PIBSX', 'Shelling pea', 'en'),
    ('PIBSX', 'Snap pea', 'en'),
    ('PIBSX', 'Snow pea', 'en'),
    ('PIBSX', 'English pea', 'en'),
    ('PIBSX', 'Green pea', 'en'),
    ('PIBSX', 'Field pea', 'en'),
    ('PIBSX', 'Pea', 'en'),
    ('PIBSX', 'Pisello coltivato', 'it'),
    ('PIBSX', 'Pisello', 'it');

-- Names for host Physalis heterophylla
INSERT INTO plants_names(plant, name, language) VALUES
    ('PHYHE', 'Clammy groundcherry', 'en');

-- Names for host Cucumis sativus
INSERT INTO plants_names(plant, name, language) VALUES
    ('CUMSA', 'Cucumber', 'en'),
    ('CUMSA', 'Gherkin', 'en'),
    ('CUMSA', 'Timun', 'en'),
    ('CUMSA', 'Cetriolo', 'it');

-- Names for host Acer rubrum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRRB', 'Red maple', 'en'),
    ('ACRRB', 'Soft maple', 'en'),
    ('ACRRB', 'Swamp maple', 'en'),
    ('ACRRB', 'Canadian maple', 'en'),
    ('ACRRB', 'Acero rosso', 'it');

-- Names for host Prunus serrulata
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNSL', 'Oriental cherry', 'en'),
    ('PRNSL', 'Japanese flowering cherry', 'en'),
    ('PRNSL', 'Prunus (Sato-zakura cultivars)', 'en'),
    ('PRNSL', 'Japanese cherry', 'en'),
    ('PRNSL', 'Ciliegio del Giappone', 'it');

-- Names for host Toxicodendron vernicifluum
INSERT INTO plants_names(plant, name, language) VALUES
    ('TOXVE', 'Chinese lacquer tree', 'en'),
    ('TOXVE', 'Japanese varnish tree', 'en'),
    ('TOXVE', 'Japanese lacquer tree', 'en'),
    ('TOXVE', 'Lacca giapponese', 'it');

-- Names for host Pyracantha coccinea
INSERT INTO plants_names(plant, name, language) VALUES
    ('PYECO', 'Fire thorn', 'en'),
    ('PYECO', 'Pyracantha', 'en'),
    ('PYECO', 'Scarlet fire thorn', 'en'),
    ('PYECO', 'Agazzino', 'it'),
    ('PYECO', 'Pruno gazzerino', 'it');

-- Names for host Bouea oppositifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('BUWOP', 'Burmese plum', 'en'),
    ('BUWOP', 'Marian plum', 'en'),
    ('BUWOP', 'Plum mango', 'en');

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

-- Names for host Larix sibirica
INSERT INTO plants_names(plant, name, language) VALUES
    ('LAXSI', 'Siberian larch', 'en'),
    ('LAXSI', 'Larice siberiano', 'it');

-- Names for host Panicum miliaceum
INSERT INTO plants_names(plant, name, language) VALUES
    ('PANMI', 'Broomcorn millet', 'en'),
    ('PANMI', 'Common millet', 'en'),
    ('PANMI', 'Proso millet', 'en'),
    ('PANMI', 'Wild proso millet', 'en'),
    ('PANMI', 'French millet', 'en'),
    ('PANMI', 'Millet panicgrass', 'en'),
    ('PANMI', 'True millet', 'en'),
    ('PANMI', 'Panic millet', 'en'),
    ('PANMI', 'Miglio nostrale', 'it'),
    ('PANMI', 'Panico', 'it'),
    ('PANMI', 'Miglio', 'it'),
    ('PANMI', 'Panico coltivado', 'it'),
    ('PANMI', 'Miglio coltivato', 'it'),
    ('PANMI', 'Panico coltivato', 'it'),
    ('PANMI', 'Panico migliaceo', 'it');

-- Names for host Hibiscus tiliaceus
INSERT INTO plants_names(plant, name, language) VALUES
    ('HIBTI', 'Mahoe', 'en'),
    ('HIBTI', 'Linden hibiscus', 'en'),
    ('HIBTI', 'Sea hibiscus', 'en'),
    ('HIBTI', 'Cottonwood', 'en'),
    ('HIBTI', 'Coast hibiscus', 'en'),
    ('HIBTI', 'Hau tree', 'en'),
    ('HIBTI', 'Mahoe tree', 'en'),
    ('HIBTI', 'Wild cotton tree', 'en');

-- Names for host Artabotrys monteiroae
INSERT INTO plants_names(plant, name, language) VALUES
    ('BTBMO', 'Red hook-berry', 'en');

-- Names for host Momordica balsamina
INSERT INTO plants_names(plant, name, language) VALUES
    ('MOMBA', 'Common balsam apple', 'en'),
    ('MOMBA', 'African cucumber', 'en'),
    ('MOMBA', 'Bitter melon', 'en'),
    ('MOMBA', 'Cundeamor', 'en'),
    ('MOMBA', 'Pomo balsamo', 'it'),
    ('MOMBA', 'Pomo di merviglia', 'it');

-- Names for host Gleditsia triacanthos
INSERT INTO plants_names(plant, name, language) VALUES
    ('GLITR', 'Thorny locust', 'en'),
    ('GLITR', 'Sweet locust', 'en'),
    ('GLITR', 'Honey locust', 'en'),
    ('GLITR', 'Three-thorned acacia', 'en'),
    ('GLITR', 'Gleditsia a tre spine', 'it'),
    ('GLITR', 'Spino di Giuda', 'it');

-- Names for host Albizia julibrissin
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALBJU', 'Pink siris', 'en'),
    ('ALBJU', 'Silk tree', 'en'),
    ('ALBJU', 'Silk-tree albizia', 'en'),
    ('ALBJU', 'Silk-tree mimosa', 'en'),
    ('ALBJU', 'Varay cotton', 'en'),
    ('ALBJU', 'Persian acacia', 'en'),
    ('ALBJU', 'Albero de la seta', 'it'),
    ('ALBJU', 'Gaggia arborea', 'it'),
    ('ALBJU', 'Gaggia di Constaninopoli', 'it'),
    ('ALBJU', 'Acacia de Constantinopoli', 'it');

-- Names for host Passiflora edulis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PAQED', 'Common passion fruit', 'en'),
    ('PAQED', 'Purple granadilla', 'en'),
    ('PAQED', 'Granadilla', 'en'),
    ('PAQED', 'Passion fruit', 'en'),
    ('PAQED', 'Passion-fruit vine', 'en'),
    ('PAQED', 'Granadiglia', 'it'),
    ('PAQED', 'Passiflora', 'it');

-- Names for host Rubus crataegifolius
INSERT INTO plants_names(plant, name, language) VALUES
    ('RUBCR', 'Hawthorn raspberry', 'en');

-- Names for host Cotoneaster buxifolius
INSERT INTO plants_names(plant, name, language) VALUES
    ('CTTBX', 'Box-leaved cotoneaster', 'en');

-- Names for host Murraya koenigii
INSERT INTO plants_names(plant, name, language) VALUES
    ('MUYKO', 'Curry leaf', 'en'),
    ('MUYKO', 'Curry leaf tree', 'en'),
    ('MUYKO', 'Karapincha', 'en');

-- Names for host Solanum seaforthianum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLSE', 'Potato creeper', 'en'),
    ('SOLSE', 'Star potato vine', 'en'),
    ('SOLSE', 'Brazilian nightshade', 'en'),
    ('SOLSE', 'Italian jasmine', 'en'),
    ('SOLSE', 'St Vincent''s lilac', 'en'),
    ('SOLSE', 'Purple potato vine', 'en');

-- Names for host x Citrofortunella floridana
INSERT INTO plants_names(plant, name, language) VALUES
    ('CJFFL', 'Limequat', 'en');

-- Names for host Tilia americana
INSERT INTO plants_names(plant, name, language) VALUES
    ('TILAM', 'American lime', 'en'),
    ('TILAM', 'American linden', 'en'),
    ('TILAM', 'American basswood', 'en'),
    ('TILAM', 'Tiglio americano', 'it'),
    ('TILAM', 'Tiglio nero', 'it');

-- Names for host Terminalia citrina
INSERT INTO plants_names(plant, name, language) VALUES
    ('TEMCI', 'Yellow myrobalan', 'en');

-- Names for host Artocarpus altilis
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABFAL', 'Breadfruit', 'en'),
    ('ABFAL', 'Breadfruit tree', 'en'),
    ('ABFAL', 'Artocarpo', 'it'),
    ('ABFAL', 'Albero del pane', 'it');

-- Names for host Salix discolor
INSERT INTO plants_names(plant, name, language) VALUES
    ('SAXDI', 'Large pussy willow', 'en'),
    ('SAXDI', 'Pussy willow', 'en');

-- Names for host Passiflora incarnata
INSERT INTO plants_names(plant, name, language) VALUES
    ('PAQIN', 'Apricot vine', 'en'),
    ('PAQIN', 'Maypop passionflower', 'en'),
    ('PAQIN', 'Rose-coloured passionflower', 'en'),
    ('PAQIN', 'Purple passionflower', 'en'),
    ('PAQIN', 'Granadiglia incarnata', 'it');

-- Names for host Mallotus japonicus
INSERT INTO plants_names(plant, name, language) VALUES
    ('MLLJA', 'Food wrapper plant', 'en');

-- Names for host Abies alba
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABIAL', 'Silver fir', 'en'),
    ('ABIAL', 'Swiss pine', 'en'),
    ('ABIAL', 'European silver fir', 'en'),
    ('ABIAL', 'Common fir', 'en'),
    ('ABIAL', 'White silver fir', 'en'),
    ('ABIAL', 'Abete bianco', 'it');

-- Names for host Chaenomeles japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('CNMJA', 'Japanese flowering quince', 'en'),
    ('CNMJA', 'Japonica', 'en'),
    ('CNMJA', 'Japanese quince', 'en'),
    ('CNMJA', 'Cotogno giapponese', 'it'),
    ('CNMJA', 'Nespolo del Giappone', 'it');

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

-- Names for host Westringia fruticosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('WESRO', 'Coastal rosemary', 'en'),
    ('WESRO', 'Australian rosemary', 'en');

-- Names for host Solanum aculeatissimum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLAC', 'Soda-apple nightshade', 'en'),
    ('SOLAC', 'Cockroach berry', 'en'),
    ('SOLAC', 'Devil''s apple', 'en'),
    ('SOLAC', 'Dutch eggplant', 'en'),
    ('SOLAC', 'Indian love', 'en'),
    ('SOLAC', 'Indian  nightshade', 'en');

-- Names for host Citrullus lanatus
INSERT INTO plants_names(plant, name, language) VALUES
    ('CITLA', 'Citrul', 'en'),
    ('CITLA', 'Egusi melon', 'en'),
    ('CITLA', 'Watermelon', 'en'),
    ('CITLA', 'Water melon', 'en'),
    ('CITLA', 'Anguria', 'it'),
    ('CITLA', 'Melone d''acqua', 'it'),
    ('CITLA', 'Cocomero', 'it'),
    ('CITLA', 'Pastecca', 'it');

-- Names for host Pyrus communis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PYUCO', 'Common pear', 'en'),
    ('PYUCO', 'Pear', 'en'),
    ('PYUCO', 'Pero comune', 'it');

-- Names for host Citrus x limon var. meyerii
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDMY', 'Meyer lemon', 'en');

-- Names for host Pinus pinaster
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUPL', 'Bournemouth pine', 'en'),
    ('PIUPL', 'Cluster pine', 'en'),
    ('PIUPL', 'Maritime pine', 'en'),
    ('PIUPL', 'Seaside pine', 'en'),
    ('PIUPL', 'Pino marittimo', 'it');

-- Names for host Acacia dealbata
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACADA', 'Blue wattle', 'en'),
    ('ACADA', 'Mimosa', 'en'),
    ('ACADA', 'Silver green wattle', 'en'),
    ('ACADA', 'Silver wattle', 'en'),
    ('ACADA', 'Acacia bianca', 'it'),
    ('ACADA', 'Acacia dealbata', 'it'),
    ('ACADA', 'Mimosa', 'it');

-- Names for host Maranthes corymbosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('MRSCO', 'Sea beam', 'en');

-- Names for host Mangifera odorata
INSERT INTO plants_names(plant, name, language) VALUES
    ('MNGOD', 'Kurwini mango', 'en'),
    ('MNGOD', 'Fragrant mango', 'en');

-- Names for host Lansium domesticum
INSERT INTO plants_names(plant, name, language) VALUES
    ('LNIDO', 'Langsat', 'en');

-- Names for host Acacia decurrens
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACADC', 'Black wattle', 'en'),
    ('ACADC', 'Green wattle', 'en'),
    ('ACADC', 'Sydney black wattle', 'en'),
    ('ACADC', 'Early black wattle', 'en'),
    ('ACADC', 'Acacia nera', 'it'),
    ('ACADC', 'Mimosa nera', 'it');

-- Names for host Populus simonii
INSERT INTO plants_names(plant, name, language) VALUES
    ('POPSM', 'Simon poplar', 'en'),
    ('POPSM', 'Chinese poplar', 'en'),
    ('POPSM', 'Simon''s poplar', 'en');

-- Names for host Corylus colurna
INSERT INTO plants_names(plant, name, language) VALUES
    ('CYLCO', 'Turkish filbert', 'en'),
    ('CYLCO', 'Turkish hazel', 'en'),
    ('CYLCO', 'Turkish hazel nut', 'en'),
    ('CYLCO', 'Constantinople hazel', 'en'),
    ('CYLCO', 'Nocciolo di Constantinopoli', 'it'),
    ('CYLCO', 'Colurno', 'it'),
    ('CYLCO', 'Nocciolo mediterraneo', 'it');

-- Names for host Garcinia mangostana
INSERT INTO plants_names(plant, name, language) VALUES
    ('GANMA', 'Mangosteen', 'en'),
    ('GANMA', 'Mangostano', 'it');

-- Names for host Prunus armeniaca
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNAR', 'Apricot', 'en'),
    ('PRNAR', 'Albicocco', 'it'),
    ('PRNAR', 'Armellino', 'it'),
    ('PRNAR', 'Grisomolo', 'it');

-- Names for host Datura metel
INSERT INTO plants_names(plant, name, language) VALUES
    ('DATME', 'Hindu datura', 'en'),
    ('DATME', 'Devil''s trumpet', 'en'),
    ('DATME', 'Horn-of-plenty', 'en'),
    ('DATME', 'Metel', 'en'),
    ('DATME', 'Thorn apple', 'en'),
    ('DATME', 'Tromba del diavolo', 'it');

-- Names for host Castanea dentata
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSNDE', 'American chestnut', 'en'),
    ('CSNDE', 'Castagno americano', 'it');

-- Names for host Citrus x limonia var. jambhiri
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDJA', 'Rough lemon', 'en');

-- Names for host Dracaena reflexa
INSERT INTO plants_names(plant, name, language) VALUES
    ('DRNRE', 'Pleomele', 'en'),
    ('DRNRE', 'Song of India', 'en'),
    ('DRNRE', 'Lily bamboo', 'en');

-- Names for host Buxus balearica
INSERT INTO plants_names(plant, name, language) VALUES
    ('BUXBA', 'Balearic box', 'en'),
    ('BUXBA', 'Spanish box', 'en'),
    ('BUXBA', 'Bosso gentile', 'it'),
    ('BUXBA', 'Bosso delle Baleari', 'it');

-- Names for host Zelkova serrata
INSERT INTO plants_names(plant, name, language) VALUES
    ('ZELSE', 'Saw-leaf zelkova', 'en'),
    ('ZELSE', 'Japanese zelkova', 'en'),
    ('ZELSE', 'Zelcova giapponese', 'it');

-- Names for host Passiflora laurifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('PAQLA', 'Water lemon', 'en'),
    ('PAQLA', 'Yellow granadilla', 'en'),
    ('PAQLA', 'Jamaica honeysuckle', 'en'),
    ('PAQLA', 'Belle apple', 'en'),
    ('PAQLA', 'Golden apple', 'en'),
    ('PAQLA', 'Vinegar pear', 'en'),
    ('PAQLA', 'Wild passion flower', 'en');

-- Names for host Cydonia oblonga
INSERT INTO plants_names(plant, name, language) VALUES
    ('CYDOB', 'Quince', 'en'),
    ('CYDOB', 'Cotogno', 'it'),
    ('CYDOB', 'Melocotogno', 'it'),
    ('CYDOB', 'Mela cotogna', 'it');

-- Names for host Annona glabra
INSERT INTO plants_names(plant, name, language) VALUES
    ('ANUGL', 'Alligator apple', 'en'),
    ('ANUGL', 'Pond apple', 'en'),
    ('ANUGL', 'Monkey apple', 'en'),
    ('ANUGL', 'Dog apple', 'en'),
    ('ANUGL', 'Corkwood', 'en'),
    ('ANUGL', 'Mangrove annona', 'en');

-- Names for host Garcinia atroviridis
INSERT INTO plants_names(plant, name, language) VALUES
    ('GANAT', 'Asam gelugur', 'en');

-- Names for host Manilkara zapota
INSERT INTO plants_names(plant, name, language) VALUES
    ('MNKZA', 'Sapodilla', 'en'),
    ('MNKZA', 'Sapota', 'en'),
    ('MNKZA', 'Bully tree', 'en'),
    ('MNKZA', 'Chapoti', 'en'),
    ('MNKZA', 'Chicle', 'en'),
    ('MNKZA', 'Chiku', 'en'),
    ('MNKZA', 'Marmalade plum', 'en'),
    ('MNKZA', 'Naseberry', 'en'),
    ('MNKZA', 'Noseberry', 'en'),
    ('MNKZA', 'Sapodilla plum', 'en'),
    ('MNKZA', 'Sapota', 'it');

-- Names for host Syzygium aromaticum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SYZAR', 'Clove', 'en'),
    ('SYZAR', 'Clove tree', 'en'),
    ('SYZAR', 'Zanzibar redhead', 'en'),
    ('SYZAR', 'Claventino', 'it'),
    ('SYZAR', 'Chioda di garofano', 'it'),
    ('SYZAR', 'Pianta di garofano', 'it');

-- Names for host Abelmoschus esculentus
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABMES', 'Gumbo', 'en'),
    ('ABMES', 'Lady''s fingers', 'en'),
    ('ABMES', 'Okra', 'en'),
    ('ABMES', 'Bammia d''Egitto', 'it'),
    ('ABMES', 'Corna dei greci', 'it'),
    ('ABMES', 'Gombo', 'it'),
    ('ABMES', 'Ocra', 'it');

-- Names for host Streblus asper
INSERT INTO plants_names(plant, name, language) VALUES
    ('SBWAS', 'Sandpaper tree', 'en'),
    ('SBWAS', 'Toothbrush tree', 'en');

-- Names for host Vaccinium corymbosum
INSERT INTO plants_names(plant, name, language) VALUES
    ('VACCO', 'Highbush blueberry', 'en'),
    ('VACCO', 'Swamp blueberry', 'en'),
    ('VACCO', 'High-bush blueberry', 'en');

-- Names for host Camellia oleifera
INSERT INTO plants_names(plant, name, language) VALUES
    ('CAHOL', 'Tea-oil plant', 'en'),
    ('CAHOL', 'Himalayan camellia', 'en');

-- Names for host Abies nephrolepis
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABINE', 'East Siberian fir', 'en'),
    ('ABINE', 'Khingan fir', 'en'),
    ('ABINE', 'Manchurian fir', 'en'),
    ('ABINE', 'Abete bianco siberiano', 'it');

-- Names for host Eriocephalus africanus
INSERT INTO plants_names(plant, name, language) VALUES
    ('ERQUM', 'Cape-of-Good-Hope shrub', 'en');

-- Names for host Phillyrea latifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('PLRLA', 'Broad-leaved phillyrea', 'en'),
    ('PLRLA', 'Mock privet', 'en'),
    ('PLRLA', 'Jasmine box', 'en'),
    ('PLRLA', 'Phillyrea', 'en'),
    ('PLRLA', 'Fillirea a larghe foglie', 'it'),
    ('PLRLA', 'Olivastro', 'it'),
    ('PLRLA', 'Filaria', 'it'),
    ('PLRLA', 'Fillirea a foglie larghe', 'it'),
    ('PLRLA', 'Fillirea comune', 'it'),
    ('PLRLA', 'Ilatro comune', 'it'),
    ('PLRLA', 'Lilatro', 'it');

-- Names for host Populus balsamifera
INSERT INTO plants_names(plant, name, language) VALUES
    ('POPBA', 'Balsam poplar', 'en'),
    ('POPBA', 'Hackmatack', 'en'),
    ('POPBA', 'Tacamahaca', 'en'),
    ('POPBA', 'Bam tree', 'en'),
    ('POPBA', 'Eastern balsam poplar', 'en'),
    ('POPBA', 'Pioppo balsamico', 'it');

-- Names for host Spiraea prunifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('SPVPR', 'Bridal wreath', 'en'),
    ('SPVPR', 'Bridal-wreath spiraea', 'en');

-- Names for host Antidesma ghaesembilla
INSERT INTO plants_names(plant, name, language) VALUES
    ('ATDGH', 'Black currant tree', 'en');

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

-- Names for host Camellia japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('CAHJA', 'Japanese camellia', 'en'),
    ('CAHJA', 'Camellia', 'en'),
    ('CAHJA', 'Camelia comune', 'it'),
    ('CAHJA', 'Camellia', 'it');

-- Names for host Oenothera biennis
INSERT INTO plants_names(plant, name, language) VALUES
    ('OEOBI', 'Common evening primrose', 'en'),
    ('OEOBI', 'Enagra', 'it'),
    ('OEOBI', 'Enagra commune', 'it'),
    ('OEOBI', 'Enotera comune', 'it');

-- Names for host Sorbus aria
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOUAI', 'Common whitebeam', 'en'),
    ('SOUAI', 'Whitebeam', 'en'),
    ('SOUAI', 'Farinaccio', 'it'),
    ('SOUAI', 'Sorbo montano', 'it'),
    ('SOUAI', 'Rialto', 'it');

-- Names for host Baccaurea ramiflora
INSERT INTO plants_names(plant, name, language) VALUES
    ('BCCRF', 'Burmese grape', 'en');

-- Names for host Lavandula stoechas
INSERT INTO plants_names(plant, name, language) VALUES
    ('LAVST', 'Topped lavender', 'en'),
    ('LAVST', 'French lavender', 'en'),
    ('LAVST', 'Spanish lavender', 'en'),
    ('LAVST', 'Butterfly lavender', 'en'),
    ('LAVST', 'Lavanda stecade', 'it'),
    ('LAVST', 'Lavanda di monte', 'it'),
    ('LAVST', 'Steca', 'it'),
    ('LAVST', 'Lavanda selvatica', 'it'),
    ('LAVST', 'Stecaole', 'it'),
    ('LAVST', 'Stigadosso', 'it');

-- Names for host Koelreuteria paniculata
INSERT INTO plants_names(plant, name, language) VALUES
    ('KOTPA', 'Golden rain', 'en'),
    ('KOTPA', 'Pride of India', 'en'),
    ('KOTPA', 'Chinese varnish tree', 'en'),
    ('KOTPA', 'Albero della vernice', 'it');

-- Names for host Cordia alba
INSERT INTO plants_names(plant, name, language) VALUES
    ('CRHAL', 'Jackwood', 'en'),
    ('CRHAL', 'White cordia', 'en');

-- Names for host Juglans nigra
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGNI', 'Black walnut', 'en'),
    ('IUGNI', 'American walnut', 'en'),
    ('IUGNI', 'Noce nero americano', 'it'),
    ('IUGNI', 'Noce americano', 'it'),
    ('IUGNI', 'Noce nero', 'it');

-- Names for host Pyrus ussuriensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PYUUS', 'Amur pear', 'en'),
    ('PYUUS', 'Harbin pear', 'en'),
    ('PYUUS', 'Siberian pear', 'en'),
    ('PYUUS', 'Pero dell''Ussuri', 'it');

-- Names for host Cedrus atlantica
INSERT INTO plants_names(plant, name, language) VALUES
    ('CEUAT', 'Atlas cedar', 'en'),
    ('CEUAT', 'Cedro dell''Atlante', 'it'),
    ('CEUAT', 'Cedro del Atlas', 'it');

-- Names for host Vitis acerifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('VITAC', 'Bush grape', 'en'),
    ('VITAC', 'Panhandle grape', 'en'),
    ('VITAC', 'Mapleleaf grape', 'en');

-- Names for host Neolamarckia cadamba
INSERT INTO plants_names(plant, name, language) VALUES
    ('NEKCA', 'Burflower tree', 'en'),
    ('NEKCA', 'Leichhardt pine', 'en');

-- Names for host Ficus benjamina
INSERT INTO plants_names(plant, name, language) VALUES
    ('FIUBE', 'Weeping fig', 'en'),
    ('FIUBE', 'Benjamin tree', 'en'),
    ('FIUBE', 'Benjamin''s fig', 'en'),
    ('FIUBE', 'Ficus tree', 'en'),
    ('FIUBE', 'Java fig', 'en'),
    ('FIUBE', 'Small-leaved rubber plant', 'en'),
    ('FIUBE', 'Tropical laurel', 'en'),
    ('FIUBE', 'Ficus beniamino', 'it');

-- Names for host Alnus japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALUJA', 'Japanese alder', 'en');

-- Names for host Sorbus aucuparia
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOUAU', 'Common mountain ash', 'en'),
    ('SOUAU', 'Common rowan', 'en'),
    ('SOUAU', 'Quickbeam', 'en'),
    ('SOUAU', 'Witchwood', 'en'),
    ('SOUAU', 'European mountain ash', 'en'),
    ('SOUAU', 'Mountain ash', 'en'),
    ('SOUAU', 'Rowan', 'en'),
    ('SOUAU', 'Sorbo degli uccelli', 'it'),
    ('SOUAU', 'Sorbo selvatico', 'it'),
    ('SOUAU', 'Sorbo rosso', 'it'),
    ('SOUAU', 'Sorbo corallino', 'it'),
    ('SOUAU', 'Sorbo ottobrino', 'it'),
    ('SOUAU', 'Sorbo degli ucellatori', 'it');

-- Names for host Ulex minor
INSERT INTO plants_names(plant, name, language) VALUES
    ('ULEMI', 'Dwarf gorse', 'en'),
    ('ULEMI', 'Dwarf furze', 'en'),
    ('ULEMI', 'Ginestrone nano', 'it');

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

-- Names for host Calicotome spinosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('CCOSP', 'Spiny broom', 'en'),
    ('CCOSP', 'Thorny broom', 'en'),
    ('CCOSP', 'Calicotome spinosa', 'it'),
    ('CCOSP', 'Ginestra spinosa', 'it'),
    ('CCOSP', 'Sparzio spinoso', 'it');

-- Names for host Fragaria chiloensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('FRACH', 'Sand strawberry', 'en'),
    ('FRACH', 'Beach strawberry', 'en'),
    ('FRACH', 'Chilean strawberry', 'en');

-- Names for host Callicarpa longifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('CLILO', 'Long-leaved beautyberry', 'en');

-- Names for host Hedera rhombea
INSERT INTO plants_names(plant, name, language) VALUES
    ('HEERH', 'Japanese ivy', 'en');

-- Names for host Ziziphus nummularia
INSERT INTO plants_names(plant, name, language) VALUES
    ('ZIPNU', 'Wild jujube', 'en');

-- Names for host Lavandula dentata
INSERT INTO plants_names(plant, name, language) VALUES
    ('LAVDE', 'Toothed lavender', 'en'),
    ('LAVDE', 'Fringed lavender', 'en'),
    ('LAVDE', 'Lavanda dentata', 'it');

-- Names for host Populus maximowiczii
INSERT INTO plants_names(plant, name, language) VALUES
    ('POPMA', 'Japanese balsam poplar', 'en');

-- Names for host Phlomis italica
INSERT INTO plants_names(plant, name, language) VALUES
    ('PLMIT', 'Balearic island sage', 'en');

-- Names for host Solanum lasiocarpum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLFE', 'Hairy-fruited eggplant', 'en'),
    ('SOLFE', 'Indian nightshade', 'en');

-- Names for host Pterocarya fraxinifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('PTFFR', 'Caucasian wingnut', 'en'),
    ('PTFFR', 'Pterocaria a foglie di frassino', 'it');

-- Names for host Humulus lupulus
INSERT INTO plants_names(plant, name, language) VALUES
    ('HUMLU', 'Common hop', 'en'),
    ('HUMLU', 'Hop', 'en'),
    ('HUMLU', 'Wild hop', 'en'),
    ('HUMLU', 'Luppolo', 'it'),
    ('HUMLU', 'Luppolo comune', 'it');

-- Names for host Malpighia emarginata
INSERT INTO plants_names(plant, name, language) VALUES
    ('MLPEM', 'Acerola', 'en'),
    ('MLPEM', 'Barbados cherry', 'en'),
    ('MLPEM', 'West Indian cherry', 'en');

-- Names for host Amelanchier laevis
INSERT INTO plants_names(plant, name, language) VALUES
    ('AMELA', 'Snowy mespilus', 'en'),
    ('AMELA', 'Allegheny serviceberry', 'en'),
    ('AMELA', 'Nespolino americano', 'it');

-- Names for host Alpinia mutica
INSERT INTO plants_names(plant, name, language) VALUES
    ('AIIMU', 'False cardamom', 'en');

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

-- Names for host Fagraea berteroana
INSERT INTO plants_names(plant, name, language) VALUES
    ('FARBE', 'Pua-kenikeni', 'en'),
    ('FARBE', 'Ten  cent flower', 'en');

-- Names for host Broussonetia papyrifera
INSERT INTO plants_names(plant, name, language) VALUES
    ('BRNPA', 'Paper mulberry', 'en'),
    ('BRNPA', 'Common paper mulberry', 'en'),
    ('BRNPA', 'Tapa-cloth tree', 'en'),
    ('BRNPA', 'Gelso papirifero del Giappone', 'it'),
    ('BRNPA', 'Moro da carta', 'it'),
    ('BRNPA', 'Moro della Cina', 'it'),
    ('BRNPA', 'Gelso da carta', 'it');

-- Names for host Solanum pimpinellifolium
INSERT INTO plants_names(plant, name, language) VALUES
    ('LYPPI', 'Currant tomato', 'en');

-- Names for host Citrus x aurantiifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDAF', 'Lime', 'en'),
    ('CIDAF', 'Key lime', 'en'),
    ('CIDAF', 'Mexican lime', 'en'),
    ('CIDAF', 'West Indian lime', 'en'),
    ('CIDAF', 'Lima', 'it');

-- Names for host Artocarpus lacucha
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABFLA', 'Monkey jack', 'en'),
    ('ABFLA', 'Monkey fruit', 'en');

-- Names for host Ulmus parvifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('ULMPA', 'Leather-leaf elm', 'en'),
    ('ULMPA', 'Chinese elm', 'en'),
    ('ULMPA', 'Lacebark elm', 'en'),
    ('ULMPA', 'Olmo cinese', 'it');

-- Names for host Cotoneaster microphyllus
INSERT INTO plants_names(plant, name, language) VALUES
    ('CTTMI', 'Small-leaved cotoneaster', 'en'),
    ('CTTMI', 'Rock-spray cotoneaster', 'en');

-- Names for host Prunus angustifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNAN', 'Mountain cherry', 'en'),
    ('PRNAN', 'Chickasaw plum', 'en');

-- Names for host Pelargonium graveolens
INSERT INTO plants_names(plant, name, language) VALUES
    ('PELGV', 'Rose geranium', 'en'),
    ('PELGV', 'Sweet-scented geranium', 'en');

-- Names for host Solanum capsicoides
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLCI', 'Red soda apple', 'en');

-- Names for host Hakonechloa macra
INSERT INTO plants_names(plant, name, language) VALUES
    ('HKNMA', 'Hakone grass', 'en'),
    ('HKNMA', 'Japanese forest grass', 'en');

-- Names for host Laurus nobilis
INSERT INTO plants_names(plant, name, language) VALUES
    ('LURNO', 'Sweet bay', 'en'),
    ('LURNO', 'Greek laurel', 'en'),
    ('LURNO', 'Apollo laurel', 'en'),
    ('LURNO', 'Bay', 'en'),
    ('LURNO', 'Grecian laurel', 'en'),
    ('LURNO', 'Laurel', 'en'),
    ('LURNO', 'Royal bay', 'en'),
    ('LURNO', 'Victor''s laurel', 'en'),
    ('LURNO', 'Alloro comun', 'it'),
    ('LURNO', 'Lauro comun', 'it'),
    ('LURNO', 'Alloro', 'it'),
    ('LURNO', 'Lauro', 'it');

-- Names for host Citrus x aurantium
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDAU', 'Seville orange', 'en'),
    ('CIDAU', 'Bigarade', 'en'),
    ('CIDAU', 'Bitter orange', 'en'),
    ('CIDAU', 'Sour orange', 'en'),
    ('CIDAU', 'Arancio amaro', 'it'),
    ('CIDAU', 'Melangolo', 'it');

-- Names for host Rosa banksiae
INSERT INTO plants_names(plant, name, language) VALUES
    ('ROSBA', 'Lady Banks''s rose', 'en'),
    ('ROSBA', 'Banksian rose', 'en');

-- Names for host Erigeron karvinskianus
INSERT INTO plants_names(plant, name, language) VALUES
    ('ERIKA', 'Mexican daisy', 'en'),
    ('ERIKA', 'Mexican fleabane', 'en'),
    ('ERIKA', 'Érigéron des murs', 'en'),
    ('ERIKA', 'Céspica karvinskiana', 'it');

-- Names for host Ziziphus mucronata
INSERT INTO plants_names(plant, name, language) VALUES
    ('ZIPMU', 'Shiny-leaf buffalo thorn', 'en');

-- Names for host Acer palmatum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRPA', 'Japanese maple', 'en'),
    ('ACRPA', 'Smooth Japanese maple', 'en'),
    ('ACRPA', 'Acero giapponese', 'it');

-- Names for host Ixora javanica
INSERT INTO plants_names(plant, name, language) VALUES
    ('IXRJA', 'Javanese ixora', 'en');

-- Names for host Strychnos nux-vomica
INSERT INTO plants_names(plant, name, language) VALUES
    ('SYHNV', 'Nux-vomica poison nut', 'en'),
    ('SYHNV', 'Strychnine tree', 'en'),
    ('SYHNV', 'Albero del noce vomica', 'it');

-- Names for host Salix gracilistyla
INSERT INTO plants_names(plant, name, language) VALUES
    ('SAXGS', 'Big catkin willow', 'en'),
    ('SAXGS', 'Rosegold pussy willow', 'en');

-- Names for host Pinus halepensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUHA', 'Aleppo pine', 'en'),
    ('PIUHA', 'Jerusalem pine', 'en'),
    ('PIUHA', 'Pino d''Aleppo', 'it'),
    ('PIUHA', 'Pino di Geruzalemme', 'it');

-- Names for host Citrus x tangelo
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDRP', 'Tangelo', 'en'),
    ('CIDRP', 'Mineola fruit', 'en'),
    ('CIDRP', 'Ugli fruit', 'en');

-- Names for host Acer saccharinum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRSA', 'Silver maple', 'en'),
    ('ACRSA', 'Acero argentato', 'it'),
    ('ACRSA', 'Acero bianco americano', 'it'),
    ('ACRSA', 'Acero del Canadà', 'it');

-- Names for host Calicotome villosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('CCOVI', 'Thorny broom', 'en'),
    ('CCOVI', 'Spiny broom', 'en'),
    ('CCOVI', 'Calicotome villosa', 'it'),
    ('CCOVI', 'Calicotome infesta', 'it'),
    ('CCOVI', 'Sparzio villoso', 'it');

-- Names for host Musa balbisiana
INSERT INTO plants_names(plant, name, language) VALUES
    ('MUBBA', 'Wild banana', 'en');

-- Names for host Quercus cerris
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUECE', 'Turkey oak', 'en'),
    ('QUECE', 'Quercia cerro', 'it'),
    ('QUECE', 'Cerro', 'it');

-- Names for host Populus alba
INSERT INTO plants_names(plant, name, language) VALUES
    ('POPAL', 'Silver-leaved poplar', 'en'),
    ('POPAL', 'White poplar', 'en'),
    ('POPAL', 'Abele', 'en'),
    ('POPAL', 'Pioppo bianco', 'it'),
    ('POPAL', 'Gattice', 'it');

-- Names for host Musa acuminata
INSERT INTO plants_names(plant, name, language) VALUES
    ('MUBAC', 'Dwarf banana', 'en');

-- Names for host Ilex aquifolium
INSERT INTO plants_names(plant, name, language) VALUES
    ('ILEAQ', 'Common holly', 'en'),
    ('ILEAQ', 'Variegated holly', 'en'),
    ('ILEAQ', 'English  holly', 'en'),
    ('ILEAQ', 'Holly', 'en'),
    ('ILEAQ', 'Agrifolio', 'it'),
    ('ILEAQ', 'Aquifolio', 'it'),
    ('ILEAQ', 'Agrifoglio', 'it'),
    ('ILEAQ', 'Alboro spinoso', 'it');

-- Names for host Prunus apetala
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNAP', 'Clove cherry', 'en');

-- Names for host Populus tremula
INSERT INTO plants_names(plant, name, language) VALUES
    ('POPTR', 'Trembling poplar', 'en'),
    ('POPTR', 'Aspen', 'en'),
    ('POPTR', 'European aspen', 'en'),
    ('POPTR', 'Pioppo tremulo', 'it');

-- Names for host Spondias dulcis
INSERT INTO plants_names(plant, name, language) VALUES
    ('SPXDU', 'Ambarella', 'en'),
    ('SPXDU', 'Golden apple', 'en'),
    ('SPXDU', 'Great hog plum', 'en'),
    ('SPXDU', 'Otaheite apple', 'en'),
    ('SPXDU', 'Jew-plum', 'en'),
    ('SPXDU', 'Jewish plum', 'en');

-- Names for host Punica granatum
INSERT INTO plants_names(plant, name, language) VALUES
    ('PUNGR', 'Pomegranate', 'en'),
    ('PUNGR', 'Carthaginian apple', 'en'),
    ('PUNGR', 'Granato', 'it'),
    ('PUNGR', 'Melograno', 'it'),
    ('PUNGR', 'Granata', 'it'),
    ('PUNGR', 'Pomo granato', 'it');

-- Names for host Trichosanthes pilosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('TTHOV', 'Japanese snake gourd', 'en');

-- Names for host Pyrus betulifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('PYUBE', 'Birch-leaved pear', 'en'),
    ('PYUBE', 'Pero a folglie di betulla', 'it');

-- Names for host Hexalobus monopetalus
INSERT INTO plants_names(plant, name, language) VALUES
    ('HXAMO', 'Shakama plum', 'en');

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

-- Names for host Crataegus x prunifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSCPR', 'Broad-leaved cockspurthorn', 'en');

-- Names for host Citrus medica
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDME', 'Citron', 'en'),
    ('CIDME', 'Buddha''s hand', 'en'),
    ('CIDME', 'Cidran', 'en'),
    ('CIDME', 'Etrog', 'en'),
    ('CIDME', 'Cedro', 'it');

-- Names for host Artocarpus rigidus
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABFRI', 'Monkey jackfruit', 'en');

-- Names for host Allium ascalonicum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALLAS', 'Shallot', 'en'),
    ('ALLAS', 'Potato onion', 'en'),
    ('ALLAS', 'Scalogno', 'it');

-- Names for host Sambucus nigra
INSERT INTO plants_names(plant, name, language) VALUES
    ('SAMNI', 'Black elder', 'en'),
    ('SAMNI', 'Bore tree', 'en'),
    ('SAMNI', 'Bour tree', 'en'),
    ('SAMNI', 'Common elder', 'en'),
    ('SAMNI', 'Elder', 'en'),
    ('SAMNI', 'Sambuco nero', 'it'),
    ('SAMNI', 'Sambuco comune', 'it');

-- Names for host Liquidambar styraciflua
INSERT INTO plants_names(plant, name, language) VALUES
    ('LIQST', 'Sweetgum', 'en'),
    ('LIQST', 'American sweet gum', 'en'),
    ('LIQST', 'Red gum', 'en'),
    ('LIQST', 'Liquidambra d''America', 'it'),
    ('LIQST', 'Albero dello storace', 'it'),
    ('LIQST', 'Nocino d''America', 'it');

-- Names for host Platanus orientalis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PLTOR', 'Oriental plane', 'en'),
    ('PLTOR', 'Chenar tree', 'en'),
    ('PLTOR', 'Platano d''Oriente', 'it'),
    ('PLTOR', 'Platano orientale', 'it');

-- Names for host Prunus cerasoides
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNCS', 'Wild Himalayan cherry', 'en');

-- Names for host Castanea ozarkensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSNOZ', 'Ozark chestnut', 'en'),
    ('CSNOZ', 'Ozark chinkapin', 'en'),
    ('CSNOZ', 'Castagno dell''Ozark', 'it');

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

-- Names for host Arbutus unedo
INSERT INTO plants_names(plant, name, language) VALUES
    ('ARDUN', 'Strawberry tree', 'en'),
    ('ARDUN', 'Killarney strawberry tree', 'en'),
    ('ARDUN', 'Strawberry madrone', 'en'),
    ('ARDUN', 'Irish strawberry tree', 'en'),
    ('ARDUN', 'Arbute', 'en'),
    ('ARDUN', 'Albatro', 'it'),
    ('ARDUN', 'Corbezzolo', 'it'),
    ('ARDUN', 'Arbuto', 'it'),
    ('ARDUN', 'Cocomero', 'it'),
    ('ARDUN', 'Rossetto', 'it'),
    ('ARDUN', 'Suorvo', 'it');

-- Names for host x Citrofortunella microcarpa
INSERT INTO plants_names(plant, name, language) VALUES
    ('CJFMI', 'Calamondin', 'en'),
    ('CJFMI', 'Four-season tangerine', 'en'),
    ('CJFMI', 'Panama orange', 'en'),
    ('CJFMI', 'Calamansi', 'en'),
    ('CJFMI', 'Philippine lime', 'en');

-- Names for host Euryops pectinatus
INSERT INTO plants_names(plant, name, language) VALUES
    ('EYOPE', 'Golden daisy bush', 'en'),
    ('EYOPE', 'Yellow bush daisy', 'en'),
    ('EYOPE', 'Grey-leaf euryops', 'en'),
    ('EYOPE', 'Golden euryops', 'en');

-- Names for host Cajanus cajan
INSERT INTO plants_names(plant, name, language) VALUES
    ('CAJCA', 'Cajan pea', 'en'),
    ('CAJCA', 'Pigeon pea', 'en'),
    ('CAJCA', 'Red gram', 'en'),
    ('CAJCA', 'Congo pea', 'en'),
    ('CAJCA', 'Bengal pea', 'en'),
    ('CAJCA', 'Dal', 'en'),
    ('CAJCA', 'Pisello d''Angola', 'it'),
    ('CAJCA', 'Citiso dell''India', 'it');

-- Names for host Cucurbita pepo
INSERT INTO plants_names(plant, name, language) VALUES
    ('CUUPE', 'Edible gourd', 'en'),
    ('CUUPE', 'Garden marrow', 'en'),
    ('CUUPE', 'Summer squash', 'en'),
    ('CUUPE', 'Pumpkin', 'en'),
    ('CUUPE', 'Zucca', 'it'),
    ('CUUPE', 'Cocuzza', 'it'),
    ('CUUPE', 'Zucchette', 'it'),
    ('CUUPE', 'Zucchini', 'it');

-- Names for host Morinda citrifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('MOJCI', 'Cheese fruit', 'en');

-- Names for host Vitis vinifera
INSERT INTO plants_names(plant, name, language) VALUES
    ('VITVI', 'Grapevine', 'en'),
    ('VITVI', 'European grape', 'en'),
    ('VITVI', 'Common grapevine', 'en'),
    ('VITVI', 'Vite', 'it'),
    ('VITVI', 'Vite comune', 'it');

-- Names for host Camellia reticulata
INSERT INTO plants_names(plant, name, language) VALUES
    ('CAHRE', 'Temple flower', 'en');

-- Names for host Rubus fruticosus
INSERT INTO plants_names(plant, name, language) VALUES
    ('RUBFR', 'Bramble', 'en'),
    ('RUBFR', 'European blackberry', 'en'),
    ('RUBFR', 'Blackberry', 'en'),
    ('RUBFR', 'Rogo', 'it'),
    ('RUBFR', 'Rovo', 'it'),
    ('RUBFR', 'Roveto', 'it'),
    ('RUBFR', 'Moro delle siepi', 'it'),
    ('RUBFR', 'Rovo commune', 'it');

-- Names for host Glebionis carinata
INSERT INTO plants_names(plant, name, language) VALUES
    ('CHYCA', 'Tricolor chrysanthemum', 'en'),
    ('CHYCA', 'Tricolor daisy', 'en');

-- Names for host Prunus mume
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNMM', 'Japanese apricot', 'en'),
    ('PRNMM', 'Albicocco del Giappone', 'it');

-- Names for host Prunus pseudocerasus
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNPC', 'Chinese fruiting cherry', 'en'),
    ('PRNPC', 'Chinese sour cherry', 'en');

-- Names for host Citrus x aurantium var. paradisi
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDPA', 'Grapefruit', 'en'),
    ('CIDPA', 'Pomelo', 'en'),
    ('CIDPA', 'Pompelmo', 'it');

-- Names for host Elaeocarpus serratus
INSERT INTO plants_names(plant, name, language) VALUES
    ('EAESE', 'Ceylon olive', 'en'),
    ('EAESE', 'Indian bead tree', 'en'),
    ('EAESE', 'Wild olive', 'en');

-- Names for host Ocimum basilicum
INSERT INTO plants_names(plant, name, language) VALUES
    ('OCIBA', 'Basil', 'en'),
    ('OCIBA', 'Common basil', 'en'),
    ('OCIBA', 'Sweet basil', 'en'),
    ('OCIBA', 'Basilico', 'it');

-- Names for host Salix alba
INSERT INTO plants_names(plant, name, language) VALUES
    ('SAXAL', 'White willow', 'en'),
    ('SAXAL', 'Bat willow', 'en'),
    ('SAXAL', 'Water willow', 'en'),
    ('SAXAL', 'Salice bianco', 'it'),
    ('SAXAL', 'Salcio da pertiche', 'it'),
    ('SAXAL', 'Caporniolo', 'it'),
    ('SAXAL', 'Salice comune', 'it');

-- Names for host Cymbopogon citratus
INSERT INTO plants_names(plant, name, language) VALUES
    ('CYGCI', 'West Indian lemon grass', 'en'),
    ('CYGCI', 'Lemon grass', 'en'),
    ('CYGCI', 'Citronella', 'it');

-- Names for host Vitis aestivalis
INSERT INTO plants_names(plant, name, language) VALUES
    ('VITAE', 'Summer grape', 'en'),
    ('VITAE', 'Pigeon grape', 'en'),
    ('VITAE', 'Bunch grape', 'en');

-- Names for host Salacca zalacca
INSERT INTO plants_names(plant, name, language) VALUES
    ('SAJED', 'Salak-palm', 'en'),
    ('SAJED', 'Snake fruit', 'en');

-- Names for host Prunus grayana
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNGN', 'Gray''s chokecherry', 'en');

-- Names for host Impatiens balsamina
INSERT INTO plants_names(plant, name, language) VALUES
    ('IPABA', 'Garden balsam', 'en'),
    ('IPABA', 'Rose balsam', 'en'),
    ('IPABA', 'Balsamina', 'it'),
    ('IPABA', 'Gelosia', 'it'),
    ('IPABA', 'Balsamina coltivata', 'it'),
    ('IPABA', 'Begli uomini', 'it');

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

-- Names for host Antiaris toxicaria
INSERT INTO plants_names(plant, name, language) VALUES
    ('AJSTO', 'Upas tree', 'en'),
    ('AJSTO', 'Poison tree', 'en'),
    ('AJSTO', 'Antiaris', 'en');

-- Names for host Solanum aviculare
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLAV', 'Poroporo', 'en'),
    ('SOLAV', 'Kangaroo-apple', 'en');

-- Names for host Solanum aethiopicum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLAE', 'African scarlet eggplant', 'en');

-- Names for host Pseudotsuga menziesii
INSERT INTO plants_names(plant, name, language) VALUES
    ('PSTME', 'Douglas fir', 'en'),
    ('PSTME', 'Oregon pine', 'en'),
    ('PSTME', 'British Columbian pine', 'en'),
    ('PSTME', 'Red fir', 'en'),
    ('PSTME', 'Green Douglas fir', 'en'),
    ('PSTME', 'Columbian pine', 'en'),
    ('PSTME', 'Abete di Douglas', 'it'),
    ('PSTME', 'Douglasia verde', 'it'),
    ('PSTME', 'Duglasia', 'it'),
    ('PSTME', 'Pseudotsuga', 'it');

-- Names for host Syzygium borneense
INSERT INTO plants_names(plant, name, language) VALUES
    ('SYZBN', 'Bullate eugenia', 'en');

-- Names for host Inga laurina
INSERT INTO plants_names(plant, name, language) VALUES
    ('INGFA', 'Sackysac', 'en'),
    ('INGFA', 'Spanish oak', 'en'),
    ('INGFA', 'Sweet pea', 'en');

-- Names for host Triphasia trifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('TPHTR', 'Trifoliate lime berry', 'en'),
    ('TPHTR', 'Chinese lime', 'en');

-- Names for host Asparagus acutifolius
INSERT INTO plants_names(plant, name, language) VALUES
    ('ASPAC', 'Sharp-leaved asparagus', 'en'),
    ('ASPAC', 'Lesser asparagus', 'en'),
    ('ASPAC', 'Asparago petreo', 'it'),
    ('ASPAC', 'Asparago pungente', 'it'),
    ('ASPAC', 'Asparago selvatico', 'it');

-- Names for host Corylus heterophylla
INSERT INTO plants_names(plant, name, language) VALUES
    ('CYLHE', 'Siberian filbert', 'en'),
    ('CYLHE', 'Siberian hazel', 'en'),
    ('CYLHE', 'Japanese hazel', 'en');

-- Names for host Brassica oleracea var. botrytis
INSERT INTO plants_names(plant, name, language) VALUES
    ('BRSOB', 'Cauliflower', 'en'),
    ('BRSOB', 'Cavolo-fiore', 'it'),
    ('BRSOB', 'Cavolfiore', 'it');

-- Names for host Datura stramonium
INSERT INTO plants_names(plant, name, language) VALUES
    ('DATST', 'Common thorn apple', 'en'),
    ('DATST', 'False castor-oil plant', 'en'),
    ('DATST', 'Jimsonweed', 'en'),
    ('DATST', 'Thorn apple', 'en'),
    ('DATST', 'Stramonio comune', 'it'),
    ('DATST', 'Noce spinosa', 'it'),
    ('DATST', 'Mezzettoni', 'it');

-- Names for host Plumeria rubra
INSERT INTO plants_names(plant, name, language) VALUES
    ('PLIRU', 'Red frangipani', 'en'),
    ('PLIRU', 'Frangipani', 'en'),
    ('PLIRU', 'Temple tree', 'en'),
    ('PLIRU', 'Frangipane rosso', 'it');

-- Names for host Amelanchier canadensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('AMECA', 'Downy serviceberry', 'en'),
    ('AMECA', 'Juneberry', 'en'),
    ('AMECA', 'Shadbush serviceberry', 'en'),
    ('AMECA', 'Thicket serviceberry', 'en'),
    ('AMECA', 'Nespolino del Canadà', 'it');

-- Names for host Saccharum officinarum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SACOF', 'Common sugarcane', 'en'),
    ('SACOF', 'Sugarcane', 'en'),
    ('SACOF', 'Canna da zucchero comune', 'it'),
    ('SACOF', 'Canamele', 'it'),
    ('SACOF', 'Canna da zucchero', 'it');

-- Names for host Annona montana
INSERT INTO plants_names(plant, name, language) VALUES
    ('ANUMO', 'Mountain soursop', 'en'),
    ('ANUMO', 'Wild soursop', 'en'),
    ('ANUMO', 'Fairchild''s annona', 'en');

-- Names for host Prunus japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNJP', 'Japanese bush cherry', 'en');

-- Names for host Garcinia celebica
INSERT INTO plants_names(plant, name, language) VALUES
    ('GANCE', 'Seashore mangosteen', 'en');

-- Names for host Malus coronaria
INSERT INTO plants_names(plant, name, language) VALUES
    ('MABCO', 'Sweet crab apple', 'en'),
    ('MABCO', 'Garland crab', 'en'),
    ('MABCO', 'Melo coronario', 'it');

-- Names for host Clausena lansium
INSERT INTO plants_names(plant, name, language) VALUES
    ('CUSLA', 'Wampi', 'en'),
    ('CUSLA', 'Wampee', 'en');

-- Names for host Trifolium repens
INSERT INTO plants_names(plant, name, language) VALUES
    ('TRFRE', 'White clover', 'en'),
    ('TRFRE', 'Shamrock', 'en'),
    ('TRFRE', 'Dutch clover', 'en'),
    ('TRFRE', 'Trifoglio bianco', 'it'),
    ('TRFRE', 'Trifoglio ladino', 'it');

-- Names for host Vernicia fordii
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALEFO', 'Tung-oil tree', 'en'),
    ('ALEFO', 'Chinese wood-oil tree', 'en');

-- Names for host Phagnalon saxatile
INSERT INTO plants_names(plant, name, language) VALUES
    ('PGASA', 'Coniza dei sassi', 'it');

-- Names for host Spartium junceum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SPUJU', 'Rush broom', 'en'),
    ('SPUJU', 'Weaver''s broom', 'en'),
    ('SPUJU', 'Spanish broom', 'en'),
    ('SPUJU', 'Ginestra di Spagna', 'it'),
    ('SPUJU', 'Ginestra odorosa', 'it'),
    ('SPUJU', 'Spartio', 'it'),
    ('SPUJU', 'Ginestra comune', 'it');

-- Names for host Capparis tomentosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('CPPTO', 'Woolly caper bush', 'en');

-- Names for host Betula nigra
INSERT INTO plants_names(plant, name, language) VALUES
    ('BETNI', 'River birch', 'en'),
    ('BETNI', 'Swamp birch', 'en'),
    ('BETNI', 'Black birch', 'en'),
    ('BETNI', 'Red birch', 'en'),
    ('BETNI', 'Betulla nera', 'it'),
    ('BETNI', 'Betulla rossa', 'it');

-- Names for host Fortunella japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('FOLJA', 'Cumquat', 'en'),
    ('FOLJA', 'Round kumquat', 'en'),
    ('FOLJA', 'Marumi kumquat', 'en'),
    ('FOLJA', 'Kumquat', 'en'),
    ('FOLJA', 'Kumquat a frutto tondo', 'it');

-- Names for host Annona macroprophyllata
INSERT INTO plants_names(plant, name, language) VALUES
    ('ANUDI', 'Ilama', 'en');

-- Names for host Syzygium lineatum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SYZLI', 'Common kelat', 'en'),
    ('SYZLI', 'Sea apple tree', 'en');

-- Names for host Filipendula kamtschatica
INSERT INTO plants_names(plant, name, language) VALUES
    ('FIIKA', 'Giant meadowsweet', 'en');

-- Names for host Fraxinus angustifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('FRXAN', 'Narrow-leaved ash', 'en'),
    ('FRXAN', 'Southern ash', 'en'),
    ('FRXAN', 'Frassino del sud', 'it'),
    ('FRXAN', 'Frassino delle rive', 'it'),
    ('FRXAN', 'Frassino meridionale', 'it');

-- Names for host Pinus canariensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUCA', 'Canary pine', 'en'),
    ('PIUCA', 'Canary Island pine', 'en'),
    ('PIUCA', 'Pino delle Canarie', 'it');

-- Names for host Rosa indica
INSERT INTO plants_names(plant, name, language) VALUES
    ('ROSID', 'Cyme rose', 'en');

-- Names for host Coffea arabica
INSERT INTO plants_names(plant, name, language) VALUES
    ('COFAR', 'Arabian coffee', 'en'),
    ('COFAR', 'Coffee tree', 'en'),
    ('COFAR', 'Caffe di Levante', 'it'),
    ('COFAR', 'Arbusto del caffè', 'it');

-- Names for host Populus lasiocarpa
INSERT INTO plants_names(plant, name, language) VALUES
    ('POPLA', 'Chinese necklace poplar', 'en'),
    ('POPLA', 'Pioppo della Cina', 'it');

-- Names for host Pyrus pyrifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('PYUPY', 'Oriental pear', 'en'),
    ('PYUPY', 'Sand pear', 'en'),
    ('PYUPY', 'Chinese pear', 'en'),
    ('PYUPY', 'Country pear', 'en'),
    ('PYUPY', 'Japanese pear', 'en'),
    ('PYUPY', 'Japanese wild pear', 'en');

-- Names for host Maclura cochinchinensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('CVDCO', 'Cockspur-thorn', 'en');

-- Names for host Campsis radicans
INSERT INTO plants_names(plant, name, language) VALUES
    ('CMIRA', 'Trumpet vine', 'en'),
    ('CMIRA', 'Trumpet creeper', 'en'),
    ('CMIRA', 'Hummingbird vine', 'en'),
    ('CMIRA', 'Cow itch vine', 'en'),
    ('CMIRA', 'Red trumpet vine', 'en'),
    ('CMIRA', 'Tromba del giudizio', 'it'),
    ('CMIRA', 'Tecoma di Virginia', 'it'),
    ('CMIRA', 'Gelsomino falso', 'it'),
    ('CMIRA', 'Bignonia selvatica', 'it');

-- Names for host Dodonaea viscosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('DODVI', 'Sticky hopbush', 'en'),
    ('DODVI', 'Switchsorrel', 'en'),
    ('DODVI', 'Florida hopbush', 'en'),
    ('DODVI', 'Sand olive', 'en'),
    ('DODVI', 'Broad-leaf hopbush', 'en'),
    ('DODVI', 'Native hopbush', 'en'),
    ('DODVI', 'Candlewood', 'en'),
    ('DODVI', 'Giant hopbush', 'en'),
    ('DODVI', 'Soapwood', 'en'),
    ('DODVI', 'Ake-ake', 'en'),
    ('DODVI', 'Hop-seed bush', 'en'),
    ('DODVI', 'Varnish leaf', 'en');

-- Names for host Juglans cinerea
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGCI', 'Butter nut', 'en'),
    ('IUGCI', 'White walnut', 'en'),
    ('IUGCI', 'Noce cenerino', 'it'),
    ('IUGCI', 'Noce bianco d''America', 'it');

-- Names for host Ilex chinensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('ILECH', 'Kashi holly', 'en'),
    ('ILECH', 'Peach-leaf holly', 'en');

-- Names for host Capparis sepiaria
INSERT INTO plants_names(plant, name, language) VALUES
    ('CPPSE', 'Indian caper', 'en'),
    ('CPPSE', 'Wild caper bush', 'en');

-- Names for host Helichrysum stoechas
INSERT INTO plants_names(plant, name, language) VALUES
    ('HECST', 'Shrubby everlasting', 'en'),
    ('HECST', 'Flower of gold', 'en'),
    ('HECST', 'Gold everlasting', 'en'),
    ('HECST', 'Mothwort', 'en'),
    ('HECST', 'Stocade', 'it'),
    ('HECST', 'Tignamica', 'it'),
    ('HECST', 'Perpetuini profumato', 'it');

-- Names for host Bischofia javanica
INSERT INTO plants_names(plant, name, language) VALUES
    ('BIHTR', 'Toog', 'en'),
    ('BIHTR', 'Java bishopwood', 'en'),
    ('BIHTR', 'Bishopwood', 'en');

-- Names for host Parthenocissus quinquefolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRTQU', 'Virginia creeper', 'en'),
    ('PRTQU', 'Vite del Canadà comune', 'it'),
    ('PRTQU', 'Vite vergine', 'it');

-- Names for host Solanum melongena
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLME', 'Aubergine', 'en'),
    ('SOLME', 'Eggplant', 'en'),
    ('SOLME', 'Brinjal', 'en'),
    ('SOLME', 'Melanzana', 'it'),
    ('SOLME', 'Maranziana', 'it'),
    ('SOLME', 'Mulignana', 'it'),
    ('SOLME', 'Petrociana', 'it');

-- Names for host Pinus koraiensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUKO', 'White pine', 'en'),
    ('PIUKO', 'Korean pine', 'en'),
    ('PIUKO', 'Pino coreano', 'it');

-- Names for host Crescentia cujete
INSERT INTO plants_names(plant, name, language) VALUES
    ('KTQCU', 'Calabash tree', 'en'),
    ('KTQCU', 'Gourd tree', 'en'),
    ('KTQCU', 'Albero di zucca', 'it');

-- Names for host Robinia pseudoacacia
INSERT INTO plants_names(plant, name, language) VALUES
    ('ROBPS', 'False acacia', 'en'),
    ('ROBPS', 'Black locust', 'en'),
    ('ROBPS', 'Locust', 'en'),
    ('ROBPS', 'Locust tree', 'en'),
    ('ROBPS', 'Robinia', 'en'),
    ('ROBPS', 'Acacia falsa', 'it'),
    ('ROBPS', 'Robinia pseudacacia', 'it'),
    ('ROBPS', 'Acacia cascia', 'it'),
    ('ROBPS', 'Acacia', 'it'),
    ('ROBPS', 'Falsa acacia', 'it'),
    ('ROBPS', 'Gaggia', 'it'),
    ('ROBPS', 'Robinia', 'it');

-- Names for host Myrtus communis
INSERT INTO plants_names(plant, name, language) VALUES
    ('MYVCO', 'Common myrtle', 'en'),
    ('MYVCO', 'Myrtle', 'en'),
    ('MYVCO', 'True myrtle', 'en'),
    ('MYVCO', 'Mirto comune', 'it'),
    ('MYVCO', 'Mortella', 'it'),
    ('MYVCO', 'Mirto', 'it');

-- Names for host Solanum violaceum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLVL', 'Indian nightshade', 'en');

-- Names for host Pouteria campechiana
INSERT INTO plants_names(plant, name, language) VALUES
    ('POJCA', 'Canistel', 'en'),
    ('POJCA', 'Eggfruit tree', 'en');

-- Names for host Dimorphotheca ecklonis
INSERT INTO plants_names(plant, name, language) VALUES
    ('OSPEK', 'Blue-and-white daisy-bush', 'en'),
    ('OSPEK', 'Bedding marigold', 'en'),
    ('OSPEK', 'Van Staden''s daisy', 'en'),
    ('OSPEK', 'African daisy', 'en');

-- Names for host Coriandrum sativum
INSERT INTO plants_names(plant, name, language) VALUES
    ('CORSA', 'Common coriander', 'en'),
    ('CORSA', 'Coriander', 'en'),
    ('CORSA', 'Chinese parsley', 'en'),
    ('CORSA', 'Coriandolo', 'it'),
    ('CORSA', 'Coriandolo comune', 'it'),
    ('CORSA', 'Coriandro', 'it');

-- Names for host Abies sibirica
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABISB', 'Siberian fir', 'en'),
    ('ABISB', 'Siberian silver fir', 'en'),
    ('ABISB', 'Abete siberiano', 'it');

-- Names for host Sauropus androgynus
INSERT INTO plants_names(plant, name, language) VALUES
    ('SRPAN', 'Katuk', 'en'),
    ('SRPAN', 'Star gooseberry', 'en'),
    ('SRPAN', 'Sweet leaf bush', 'en');

-- Names for host Cucurbita maxima
INSERT INTO plants_names(plant, name, language) VALUES
    ('CUUMA', 'Giant pumpkin', 'en'),
    ('CUUMA', 'Marrow', 'en'),
    ('CUUMA', 'Zucca gigante', 'it'),
    ('CUUMA', 'Popone', 'it'),
    ('CUUMA', 'Cetriolo', 'it'),
    ('CUUMA', 'Cocozza', 'it');

-- Names for host Pouteria sapota
INSERT INTO plants_names(plant, name, language) VALUES
    ('POJSA', 'Mammey sapote', 'en'),
    ('POJSA', 'Marmelade plum', 'en'),
    ('POJSA', 'Mamey', 'en'),
    ('POJSA', 'Mammee sapota', 'en');

-- Names for host Icacina oliviformis
INSERT INTO plants_names(plant, name, language) VALUES
    ('ICAOL', 'False yam', 'en');

-- Names for host Syzygium nervosum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SYZNE', 'Daly River satinash', 'en');

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

-- Names for host Pyrus bretschneideri
INSERT INTO plants_names(plant, name, language) VALUES
    ('PYUBR', 'Yali pear', 'en');

-- Names for host Carissa spinarum
INSERT INTO plants_names(plant, name, language) VALUES
    ('CISSR', 'Conkerberry', 'en'),
    ('CISSR', 'Bush plum', 'en'),
    ('CISSR', 'Simple-spined num-num', 'en');

-- Names for host Browallia speciosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('BRWSP', 'Amethyst flower', 'en'),
    ('BRWSP', 'Bush violet', 'en'),
    ('BRWSP', 'Browallia', 'it'),
    ('BRWSP', 'Fior di zaffiro', 'it');

-- Names for host Eurya japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('EUYJA', 'Wild tea', 'en');

-- Names for host Teucrium capitatum
INSERT INTO plants_names(plant, name, language) VALUES
    ('TEUCP', 'Camedrio polio', 'it'),
    ('TEUCP', 'Canutola', 'it'),
    ('TEUCP', 'Polio', 'it');

-- Names for host Benincasa hispida
INSERT INTO plants_names(plant, name, language) VALUES
    ('BNCHI', 'Wax gourd', 'en'),
    ('BNCHI', 'White gourd', 'en'),
    ('BNCHI', 'Ash pumpkin', 'en'),
    ('BNCHI', 'Chinese preserving melon', 'en'),
    ('BNCHI', 'Chinese squash', 'en'),
    ('BNCHI', 'Ash gourd', 'en'),
    ('BNCHI', 'Winter melon', 'en');

-- Names for host Cucumis melo
INSERT INTO plants_names(plant, name, language) VALUES
    ('CUMME', 'Melon', 'en'),
    ('CUMME', 'Muskmelon', 'en'),
    ('CUMME', 'Cantaloupe', 'en'),
    ('CUMME', 'Melone', 'it'),
    ('CUMME', 'Pepone', 'it'),
    ('CUMME', 'Popone', 'it');

-- Names for host Allium cepa
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALLCE', 'Garden onion', 'en'),
    ('ALLCE', 'Scallion', 'en'),
    ('ALLCE', 'Onion', 'en'),
    ('ALLCE', 'Cipolla', 'it'),
    ('ALLCE', 'Cipollina', 'it');

-- Names for host Elaeagnus multiflora
INSERT INTO plants_names(plant, name, language) VALUES
    ('ELGMU', 'Cherry elaeagnus', 'en'),
    ('ELGMU', 'Cherry silverberry', 'en'),
    ('ELGMU', 'Eleagno del Giappone', 'it');

-- Names for host Juglans microcarpa
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGMI', 'River walnut', 'en'),
    ('IUGMI', 'Texas walnut', 'en'),
    ('IUGMI', 'Little walnut', 'en'),
    ('IUGMI', 'Noce a frutti piccoli', 'it');

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

-- Names for host Picea glehnii
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIEGL', 'Sakhalin spruce', 'en'),
    ('PIEGL', 'Abete di Glehn', 'it');

-- Names for host Vigna radiata
INSERT INTO plants_names(plant, name, language) VALUES
    ('PHSAU', 'Mung bean', 'en'),
    ('PHSAU', 'Green gram', 'en'),
    ('PHSAU', 'Oregon pea', 'en'),
    ('PHSAU', 'Fagiolo mungo', 'it');

-- Names for host Atalantia buxifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('SEVBU', 'Chinese box orange', 'en');

-- Names for host Tsuga heterophylla
INSERT INTO plants_names(plant, name, language) VALUES
    ('TSUHE', 'Western hemlock', 'en'),
    ('TSUHE', 'Pacific hemlock', 'en'),
    ('TSUHE', 'Western hemlock-spruce', 'en'),
    ('TSUHE', 'Hemlock spruce', 'en'),
    ('TSUHE', 'Common hemlock', 'en'),
    ('TSUHE', 'Tsuga eterofilla', 'it'),
    ('TSUHE', 'Tsuga di California', 'it');

-- Names for host Streptosolen jamesonii
INSERT INTO plants_names(plant, name, language) VALUES
    ('SROJA', 'Firebush', 'en'),
    ('SROJA', 'Marmelade bush', 'en'),
    ('SROJA', 'Orange browallia', 'en'),
    ('SROJA', 'Yellow heliotrope', 'en');

-- Names for host Vigna unguiculata
INSERT INTO plants_names(plant, name, language) VALUES
    ('VIGSI', 'Black-eyed pea', 'en'),
    ('VIGSI', 'Common cowpea', 'en'),
    ('VIGSI', 'Southern pea', 'en'),
    ('VIGSI', 'Cowpea', 'en'),
    ('VIGSI', 'Black-eye pea', 'en'),
    ('VIGSI', 'Long bean', 'en'),
    ('VIGSI', 'Fagiolino dall''occhio', 'it'),
    ('VIGSI', 'Fagiolino piccolo', 'it'),
    ('VIGSI', 'Cornetti', 'it'),
    ('VIGSI', 'Faggiolino piccolo', 'it'),
    ('VIGSI', 'Fagiolino', 'it'),
    ('VIGSI', 'Tegoline', 'it');

-- Names for host Vinca minor
INSERT INTO plants_names(plant, name, language) VALUES
    ('VINMI', 'Common periwinkle', 'en'),
    ('VINMI', 'Lesser periwinkle', 'en'),
    ('VINMI', 'Periwinkle', 'en'),
    ('VINMI', 'Myrtle', 'en'),
    ('VINMI', 'Pervinca minore', 'it');

-- Names for host Litchi chinensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('LIHCH', 'Litchee', 'en'),
    ('LIHCH', 'Litchi', 'en'),
    ('LIHCH', 'Lychee', 'en'),
    ('LIHCH', 'Litchi', 'it');

-- Names for host Ficus sycomorus
INSERT INTO plants_names(plant, name, language) VALUES
    ('FIUSY', 'Sycomore fig', 'en'),
    ('FIUSY', 'Mulberry fig', 'en');

-- Names for host Cotoneaster niger
INSERT INTO plants_names(plant, name, language) VALUES
    ('CTTNG', 'Black-berried cotoneaster', 'en');

-- Names for host Psidium cattleyanum
INSERT INTO plants_names(plant, name, language) VALUES
    ('PSICA', 'Cherry guava', 'en'),
    ('PSICA', 'Strawberry guava', 'en');

-- Names for host Coprosma repens
INSERT INTO plants_names(plant, name, language) VALUES
    ('CPMRE', 'Looking-glass plant', 'en'),
    ('CPMRE', 'Mirror plant', 'en'),
    ('CPMRE', 'Looking-glass bush', 'en'),
    ('CPMRE', 'Mirror bush', 'en'),
    ('CPMRE', 'New Zealand laurel', 'en'),
    ('CPMRE', 'Shiny leaf', 'en'),
    ('CPMRE', 'Taupata', 'en'),
    ('CPMRE', 'Tree bedstraw', 'en');

-- Names for host Syzygium cumini
INSERT INTO plants_names(plant, name, language) VALUES
    ('SYZCU', 'Java plum', 'en'),
    ('SYZCU', 'Jamun', 'en'),
    ('SYZCU', 'Black plum', 'en'),
    ('SYZCU', 'Jambolan', 'en'),
    ('SYZCU', 'Malabar plum', 'en'),
    ('SYZCU', 'Giambolana', 'it');

-- Names for host Murraya paniculata
INSERT INTO plants_names(plant, name, language) VALUES
    ('MUYPA', 'Orange jessamine', 'en'),
    ('MUYPA', 'Satinwood', 'en'),
    ('MUYPA', 'Burmese boxwood', 'en'),
    ('MUYPA', 'Chinese boxwood', 'en'),
    ('MUYPA', 'Cosmetic bark', 'en'),
    ('MUYPA', 'Mock orange', 'en'),
    ('MUYPA', 'Orange jasmine', 'en');

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

-- Names for host Corylus maxima
INSERT INTO plants_names(plant, name, language) VALUES
    ('CYLMA', 'Giant filbert', 'en'),
    ('CYLMA', 'Lambert nut', 'en'),
    ('CYLMA', 'Filbert', 'en'),
    ('CYLMA', 'Kentish cob', 'en'),
    ('CYLMA', 'Nocciolo di Dalmazia', 'it'),
    ('CYLMA', 'Nocciolo massimo', 'it'),
    ('CYLMA', 'Nocciolo lungo', 'it');

-- Names for host Passiflora foetida
INSERT INTO plants_names(plant, name, language) VALUES
    ('PAQFO', 'Love-in-a-mist', 'en'),
    ('PAQFO', 'Red-fruit passionflower', 'en'),
    ('PAQFO', 'Running-pop', 'en'),
    ('PAQFO', 'Stinking passionflower', 'en'),
    ('PAQFO', 'Goat-scented passion flower', 'en');

-- Names for host Erica cinerea
INSERT INTO plants_names(plant, name, language) VALUES
    ('EIACN', 'Bell heather', 'en'),
    ('EIACN', 'Fine-leaved heath', 'en'),
    ('EIACN', 'Twisted heath', 'en'),
    ('EIACN', 'Scopa cinerea', 'it'),
    ('EIACN', 'Erica cinerea', 'it');

-- Names for host Ganophyllum falcatum
INSERT INTO plants_names(plant, name, language) VALUES
    ('GNHFA', 'Scaly ash', 'en');

-- Names for host Lavandula latifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('LAVLA', 'Broad-leaved lavender', 'en'),
    ('LAVLA', 'Spike lavender', 'en'),
    ('LAVLA', 'French lavender', 'en'),
    ('LAVLA', 'Spigo', 'it'),
    ('LAVLA', 'Lavanda latifoglia', 'it'),
    ('LAVLA', 'Lavandula a foglie larghe', 'it'),
    ('LAVLA', 'Lavandula latifoglia', 'it'),
    ('LAVLA', 'Spigo nardo', 'it'),
    ('LAVLA', 'Spigone', 'it');

-- Names for host Physalis longifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('PHYLF', 'Long-leaf groundcherry', 'en');

-- Names for host Gardenia jasminoides
INSERT INTO plants_names(plant, name, language) VALUES
    ('GADJA', 'Cape jasmine', 'en'),
    ('GADJA', 'Cape jessamine', 'en'),
    ('GADJA', 'Common gardenia', 'en'),
    ('GADJA', 'Gardenia', 'en');

-- Names for host Vitis riparia
INSERT INTO plants_names(plant, name, language) VALUES
    ('VITRI', 'Riverbank grape', 'en');

-- Names for host Pteridium aquilinum
INSERT INTO plants_names(plant, name, language) VALUES
    ('PTEAQ', 'Bracken', 'en'),
    ('PTEAQ', 'Bracken fern', 'en'),
    ('PTEAQ', 'Felce aquilina comune', 'it'),
    ('PTEAQ', 'Felce maggiore', 'it'),
    ('PTEAQ', 'Felce aquilina', 'it');

-- Names for host Platanus occidentalis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PLTOC', 'Buttonwood', 'en'),
    ('PLTOC', 'American plane', 'en'),
    ('PLTOC', 'American sycamore', 'en'),
    ('PLTOC', 'Platano d''America', 'it'),
    ('PLTOC', 'Platano occidentale', 'it');

-- Names for host Solanum lycopersicum
INSERT INTO plants_names(plant, name, language) VALUES
    ('LYPES', 'Tomato', 'en'),
    ('LYPES', 'Pomodoro', 'it');

-- Names for host Ziziphus oenopolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('ZIPOE', 'Jackal jujube', 'en');

-- Names for host Styrax japonicus
INSERT INTO plants_names(plant, name, language) VALUES
    ('STXJA', 'Japanese snowbell', 'en'),
    ('STXJA', 'Storace giapponese', 'it');

-- Names for host Careya arborea
INSERT INTO plants_names(plant, name, language) VALUES
    ('CBRAR', 'Patana oak', 'en'),
    ('CBRAR', 'Tummy wood', 'en'),
    ('CBRAR', 'Ceylon oak', 'en'),
    ('CBRAR', 'Kumbi', 'en'),
    ('CBRAR', 'Slow match tree', 'en'),
    ('CBRAR', 'Wild guava', 'en');

-- Names for host Artocarpus chama
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABFCH', 'Chaplash', 'en');

-- Names for host Chrysobalanus icaco
INSERT INTO plants_names(plant, name, language) VALUES
    ('CBLIC', 'Coco plum', 'en'),
    ('CBLIC', 'Icaco', 'it');

-- Names for host Solanum linnaeanum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLSO', 'Apple of Sodom', 'en'),
    ('SOLSO', 'Apple-of-Sodom nightshade', 'en'),
    ('SOLSO', 'Pomo di Sodoma', 'it'),
    ('SOLSO', 'Solano spinoso', 'it'),
    ('SOLSO', 'Morella di Sodoma', 'it'),
    ('SOLSO', 'Pomodoro selvaggio', 'it');

-- Names for host Hibiscus syriacus
INSERT INTO plants_names(plant, name, language) VALUES
    ('HIBSY', 'Shrubby althaea', 'en'),
    ('HIBSY', 'Rose of sharon', 'en'),
    ('HIBSY', 'Althaea', 'en'),
    ('HIBSY', 'Blue hibiscus', 'en'),
    ('HIBSY', 'Rose of Sharon', 'en'),
    ('HIBSY', 'Shrub althaea', 'en'),
    ('HIBSY', 'Syrian hibiscus', 'en'),
    ('HIBSY', 'Syrian ketmia', 'en'),
    ('HIBSY', 'Ibisco arborero', 'it'),
    ('HIBSY', 'Ketmia', 'it'),
    ('HIBSY', 'Dialtea', 'it'),
    ('HIBSY', 'Ibisco arboreo', 'it'),
    ('HIBSY', 'Rosa angelica', 'it');

-- Names for host Lindera praecox
INSERT INTO plants_names(plant, name, language) VALUES
    ('LIEPR', 'Spice bush', 'en');

-- Names for host Cascabela thevetia
INSERT INTO plants_names(plant, name, language) VALUES
    ('THVPE', 'Exile tree', 'en'),
    ('THVPE', 'Lucky nut', 'en'),
    ('THVPE', 'Yellow oleander', 'en'),
    ('THVPE', 'Be-still tree', 'en'),
    ('THVPE', 'Trumpet flower', 'en');

-- Names for host Cestrum elegans
INSERT INTO plants_names(plant, name, language) VALUES
    ('CEMEL', 'Red cestrum', 'en'),
    ('CEMEL', 'Purple cestrum', 'en');

-- Names for host Triticum aestivum
INSERT INTO plants_names(plant, name, language) VALUES
    ('TRZAX', 'Soft wheat', 'en'),
    ('TRZAX', 'Bread wheat', 'en'),
    ('TRZAX', 'Fromento tenero', 'it'),
    ('TRZAX', 'Civitella', 'it'),
    ('TRZAX', 'Frumento', 'it'),
    ('TRZAX', 'Grano tenero', 'it'),
    ('TRZAX', 'Marzuolo', 'it');

-- Names for host Inocarpus fagifer
INSERT INTO plants_names(plant, name, language) VALUES
    ('INOFA', 'Tahiti chestnut', 'en'),
    ('INOFA', 'Polynesian chestnut', 'en'),
    ('INOFA', 'Otaheite chestnut', 'en');

-- Names for host Pinus sibirica
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUSB', 'Siberian pine', 'en'),
    ('PIUSB', 'Siberian stone pine', 'en');

-- Names for host Citrus natsudaidai
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDNA', 'Japanese summer grapefruit', 'en'),
    ('CIDNA', 'Japanese summer orange', 'en');

-- Names for host Sorbus alnifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOUAL', 'Hornbeam-ash', 'en'),
    ('SOUAL', 'Dense-head mountain-ash', 'en');

-- Names for host Cotoneaster horizontalis
INSERT INTO plants_names(plant, name, language) VALUES
    ('CTTHO', 'Wall cotoneaster', 'en'),
    ('CTTHO', 'Rock cotoneaster', 'en'),
    ('CTTHO', 'Wallspray', 'en'),
    ('CTTHO', 'Cotognastro orizzontale', 'it');

-- Names for host Dimorphotheca fruticosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('OSPFR', 'African trailing daisy', 'en');

-- Names for host Garcinia cowa
INSERT INTO plants_names(plant, name, language) VALUES
    ('GANCO', 'Cowa mangosteen', 'en'),
    ('GANCO', 'Cowa', 'en');

-- Names for host Prunus cerasifera var. pissardii
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNCX', 'Purple-leaved plum', 'en');

-- Names for host Casimiroa edulis
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSJED', 'Casimiroa', 'en'),
    ('CSJED', 'White sapote', 'en');

-- Names for host Fortunella hindsii
INSERT INTO plants_names(plant, name, language) VALUES
    ('FOLHI', 'Dwarf kumquat', 'en');

-- Names for host Synedrella nodiflora
INSERT INTO plants_names(plant, name, language) VALUES
    ('SYDNO', 'Nodeweed', 'en'),
    ('SYDNO', 'Porterbush', 'en'),
    ('SYDNO', 'Synedrella', 'en'),
    ('SYDNO', 'Cinderella weed', 'en'),
    ('SYDNO', 'Sessile-flowered synedrella', 'en');

-- Names for host Ligustrum sinense
INSERT INTO plants_names(plant, name, language) VALUES
    ('LIGSI', 'Chinese privet', 'en'),
    ('LIGSI', 'Ligustro della Cina', 'it');

-- Names for host Chukrasia tabularis
INSERT INTO plants_names(plant, name, language) VALUES
    ('KRZTA', 'Burma almond wood', 'en'),
    ('KRZTA', 'Chickrassy', 'en'),
    ('KRZTA', 'Chittagong wood', 'en'),
    ('KRZTA', 'Indian mahogany', 'en');

-- Names for host Salix koriyanagi
INSERT INTO plants_names(plant, name, language) VALUES
    ('SAXKO', 'Koriyanagi', 'en'),
    ('SAXKO', 'Japanese basket osier', 'en');

-- Names for host Musa basjoo
INSERT INTO plants_names(plant, name, language) VALUES
    ('MUBBJ', 'Japanese fibre banana', 'en');

-- Names for host Theobroma cacao
INSERT INTO plants_names(plant, name, language) VALUES
    ('THOCA', 'Common cacao', 'en'),
    ('THOCA', 'Common cocoa', 'en'),
    ('THOCA', 'Cacao', 'en'),
    ('THOCA', 'Cacao tree', 'en'),
    ('THOCA', 'Chocolate tree', 'en'),
    ('THOCA', 'Cocoa', 'en'),
    ('THOCA', 'Albero di cacao comune', 'it');

-- Names for host Acer negundo
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRNE', 'Ash-leaved maple', 'en'),
    ('ACRNE', 'Box elder', 'en'),
    ('ACRNE', 'Manitoba maple', 'en'),
    ('ACRNE', 'Ash-leaf maple', 'en'),
    ('ACRNE', 'Acero americano', 'it'),
    ('ACRNE', 'Acero a foglie di frassino', 'it'),
    ('ACRNE', 'Acero negundo', 'it');

-- Names for host Fallopia convolvulus
INSERT INTO plants_names(plant, name, language) VALUES
    ('POLCO', 'Bearbine', 'en'),
    ('POLCO', 'Black bindweed', 'en'),
    ('POLCO', 'Black knotweed', 'en'),
    ('POLCO', 'Cornbind', 'en'),
    ('POLCO', 'Wild buckwheat', 'en'),
    ('POLCO', 'Bearbind', 'en'),
    ('POLCO', 'Convolvolo nero', 'it'),
    ('POLCO', 'Erba leprina', 'it'),
    ('POLCO', 'Poligono convolvolo', 'it');

-- Names for host Knema globularia
INSERT INTO plants_names(plant, name, language) VALUES
    ('KEMGL', 'Small-leaved nutmeg', 'en');

-- Names for host Allium tuberosum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALLTU', 'Oriental garlic', 'en'),
    ('ALLTU', 'Chinese chives', 'en'),
    ('ALLTU', 'Garlic chives', 'en');

-- Names for host Beta vulgaris
INSERT INTO plants_names(plant, name, language) VALUES
    ('BEAVX', 'Beet', 'en'),
    ('BEAVX', 'Bietola', 'it');

-- Names for host Sechium edule
INSERT INTO plants_names(plant, name, language) VALUES
    ('SEHED', 'Chayote', 'en'),
    ('SEHED', 'Christophene', 'en'),
    ('SEHED', 'Alligator pear', 'en'),
    ('SEHED', 'Chocho', 'en'),
    ('SEHED', 'Chayote', 'it');

-- Names for host Citrus x limon
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDLI', 'Lemon', 'en'),
    ('CIDLI', 'Citreno', 'it'),
    ('CIDLI', 'Limone', 'it');

-- Names for host Apium graveolens
INSERT INTO plants_names(plant, name, language) VALUES
    ('APUGV', 'Celery', 'en'),
    ('APUGV', 'Wild celery', 'en'),
    ('APUGV', 'Apio', 'it'),
    ('APUGV', 'Sedano', 'it'),
    ('APUGV', 'Sedano coltivato', 'it'),
    ('APUGV', 'Sedano comune', 'it');

-- Names for host Rosa chinensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('ROSCH', 'China rose', 'en'),
    ('ROSCH', 'Bengal rose', 'en'),
    ('ROSCH', 'Monthly rose', 'en');

-- Names for host Betula populifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('BETPO', 'Gray birch', 'en'),
    ('BETPO', 'White birch', 'en'),
    ('BETPO', 'Betulla a foglie di pioppo', 'it'),
    ('BETPO', 'Betulla grigio', 'it');

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

-- Names for host Cistus monspeliensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSTMO', 'Narrow-leaved cistus', 'en'),
    ('CSTMO', 'Cisto marino', 'it'),
    ('CSTMO', 'Cisto di Montpellier', 'it'),
    ('CSTMO', 'Imbreteno', 'it'),
    ('CSTMO', 'Muschio', 'it'),
    ('CSTMO', 'Rembrottine', 'it');

-- Names for host Medicago arborea
INSERT INTO plants_names(plant, name, language) VALUES
    ('MEDAR', 'Tree medick', 'en'),
    ('MEDAR', 'Tree alfalfa', 'en'),
    ('MEDAR', 'Erba-medica arborea', 'it'),
    ('MEDAR', 'Ginestrone', 'it');

-- Names for host Ficus auriculata
INSERT INTO plants_names(plant, name, language) VALUES
    ('FIURO', 'Imperial tree', 'en'),
    ('FIURO', 'Himalayan fig', 'en'),
    ('FIURO', 'Broad-leaved fig', 'en'),
    ('FIURO', 'Elephant ear fig', 'en'),
    ('FIURO', 'Roxburgh''s fig', 'en');

-- Names for host Vigna unguiculata subsp. sesquipedalis
INSERT INTO plants_names(plant, name, language) VALUES
    ('VIGSQ', 'Asparagus bean', 'en'),
    ('VIGSQ', 'String bean', 'en'),
    ('VIGSQ', 'Yard-long bean', 'en'),
    ('VIGSQ', 'Fagiolino asparago', 'it'),
    ('VIGSQ', 'Fagiolino a frusta', 'it'),
    ('VIGSQ', 'Fagiolino lungo', 'it');

-- Names for host Ampelopsis japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('AMCJA', 'Japanese peppervine', 'en'),
    ('AMCJA', 'Vite vergine giapponese', 'it');

-- Names for host Cinnamomum camphora
INSERT INTO plants_names(plant, name, language) VALUES
    ('CINCA', 'Camphor', 'en'),
    ('CINCA', 'Majestic beauty camphor', 'en'),
    ('CINCA', 'Camphor tree', 'en'),
    ('CINCA', 'Camphor laurel', 'en'),
    ('CINCA', 'Japanese camphor tree', 'en'),
    ('CINCA', 'Laurocanfora', 'it'),
    ('CINCA', 'Alloro canforato', 'it'),
    ('CINCA', 'Albero della confora', 'it'),
    ('CINCA', 'Albero confora', 'it');

-- Names for host Monoon longifolium
INSERT INTO plants_names(plant, name, language) VALUES
    ('QLHLO', 'Buddha tree', 'en'),
    ('QLHLO', 'Indian mast tree', 'en'),
    ('QLHLO', 'Indian fir tree', 'en'),
    ('QLHLO', 'False ashoka', 'en'),
    ('QLHLO', 'Mast tree', 'en');

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

-- Names for host Fraxinus pennsylvanica
INSERT INTO plants_names(plant, name, language) VALUES
    ('FRXPE', 'Green ash', 'en'),
    ('FRXPE', 'Red ash', 'en'),
    ('FRXPE', 'Frassino di Pensilvania', 'it');

-- Names for host Prunus americana
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNAM', 'River plum', 'en'),
    ('PRNAM', 'Goose plum', 'en'),
    ('PRNAM', 'August plum', 'en'),
    ('PRNAM', 'American wild plum', 'en'),
    ('PRNAM', 'American plum', 'en'),
    ('PRNAM', 'Armellino', 'it');

-- Names for host Aronia melanocarpa
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABOME', 'Black chokeberry', 'en');

-- Names for host Diospyros montana
INSERT INTO plants_names(plant, name, language) VALUES
    ('DOSMN', 'Mountain persimmon', 'en'),
    ('DOSMN', 'Bombay ebony', 'en');

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

-- Names for host Morus rubra
INSERT INTO plants_names(plant, name, language) VALUES
    ('MORRU', 'Red mulberry', 'en'),
    ('MORRU', 'Gelso rosso', 'it'),
    ('MORRU', 'Moro rosso', 'it');

-- Names for host Betula platyphylla var. japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('BETPJ', 'Japanese white birch', 'en'),
    ('BETPJ', 'Betulla giapponese a foglie larghe', 'it');

-- Names for host Vicia faba
INSERT INTO plants_names(plant, name, language) VALUES
    ('VICFX', 'Broad bean', 'en'),
    ('VICFX', 'Faba bean', 'en'),
    ('VICFX', 'Fava', 'it'),
    ('VICFX', 'Fava grossa', 'it'),
    ('VICFX', 'Fava maggiore', 'it');

-- Names for host Oryza sativa
INSERT INTO plants_names(plant, name, language) VALUES
    ('ORYSA', 'Common rice', 'en'),
    ('ORYSA', 'Rice', 'en'),
    ('ORYSA', 'Riso comune', 'it'),
    ('ORYSA', 'Riso', 'it');

-- Names for host Buxus microphylla
INSERT INTO plants_names(plant, name, language) VALUES
    ('BUXMI', 'Little-leaf box', 'en');

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

-- Names for host Rhodomyrtus tomentosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('RHDTO', 'Hill guava', 'en'),
    ('RHDTO', 'Hill gooseberry', 'en'),
    ('RHDTO', 'Downy rose myrtle', 'en'),
    ('RHDTO', 'Isenberg bush', 'en'),
    ('RHDTO', 'Rose myrtle', 'en');

-- Names for host Garcinia parvifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('GANPA', 'Kundong', 'en');

-- Names for host Quercus frainetto
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUEFR', 'Italian oak', 'en'),
    ('QUEFR', 'Hungarian oak', 'en'),
    ('QUEFR', 'Quercia farnetto', 'it');

-- Names for host Clusia rosea
INSERT INTO plants_names(plant, name, language) VALUES
    ('CUFRO', 'Autograph tree', 'en'),
    ('CUFRO', 'Balsam apple', 'en'),
    ('CUFRO', 'Balsam fig', 'en'),
    ('CUFRO', 'Pitch apple', 'en'),
    ('CUFRO', 'Scotch attorney', 'en');

-- Names for host Vernicia montana
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALEMN', 'Mu-oil tree', 'en');

-- Names for host Grevillea juniperina
INSERT INTO plants_names(plant, name, language) VALUES
    ('GREJU', 'Juniper grevillea', 'en'),
    ('GREJU', 'Juniper-leaf grevillea', 'en'),
    ('GREJU', 'Prickly spider-flower', 'en');

-- Names for host Lupinus luteus
INSERT INTO plants_names(plant, name, language) VALUES
    ('LUPLU', 'Yellow lupin', 'en'),
    ('LUPLU', 'Yellow lupine', 'en'),
    ('LUPLU', 'Lupino giallo', 'it');

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

-- Names for host Diospyros discolor
INSERT INTO plants_names(plant, name, language) VALUES
    ('DOSDC', 'Mabolo', 'en'),
    ('DOSDC', 'Velvet apple', 'en'),
    ('DOSDC', 'Velvet persimmon', 'en'),
    ('DOSDC', 'Butterfruit', 'en'),
    ('DOSDC', 'Mabolo', 'it');

-- Names for host Parthenocissus tricuspidata
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRTTR', 'Boston ivy', 'en'),
    ('PRTTR', 'Japanese ivy', 'en'),
    ('PRTTR', 'Vita vergine del Giappone', 'it');

-- Names for host Juglans californica
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGCA', 'California walnut', 'en'),
    ('IUGCA', 'California black walnut', 'en'),
    ('IUGCA', 'Southern California walnut', 'en');

-- Names for host Rubus rosifolius
INSERT INTO plants_names(plant, name, language) VALUES
    ('RUBRO', 'Native raspberry', 'en'),
    ('RUBRO', 'Cape bramble', 'en'),
    ('RUBRO', 'Mauritius raspberry', 'en');

-- Names for host Simarouba glauca
INSERT INTO plants_names(plant, name, language) VALUES
    ('SMBGL', 'Bitterwood', 'en'),
    ('SMBGL', 'Paradise tree', 'en');

-- Names for host Euphorbia terracina
INSERT INTO plants_names(plant, name, language) VALUES
    ('EPHTE', 'False caper', 'en'),
    ('EPHTE', 'Geraldton carnationweed', 'en'),
    ('EPHTE', 'Euforbia di Terracina', 'it');

-- Names for host Malus floribunda
INSERT INTO plants_names(plant, name, language) VALUES
    ('MABFB', 'Japanese flowering crab apple', 'en'),
    ('MABFB', 'Showy crab apple', 'en'),
    ('MABFB', 'Japanese crab', 'en'),
    ('MABFB', 'Melo giapponese', 'it');

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

-- Names for host Genista x spachiana
INSERT INTO plants_names(plant, name, language) VALUES
    ('GENSA', 'Leafy broom', 'en'),
    ('GENSA', 'Easter broom', 'en');

-- Names for host Magnolia x soulangeana
INSERT INTO plants_names(plant, name, language) VALUES
    ('MAGSO', 'Magnolia (Soulangeana hybrids)', 'en');

-- Names for host Brucea javanica
INSERT INTO plants_names(plant, name, language) VALUES
    ('RHUJV', 'Java brucea', 'en');

-- Names for host Sassafras albidum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SSAAL', 'Common sassafras', 'en'),
    ('SSAAL', 'Sassafras', 'en'),
    ('SSAAL', 'White sassafras', 'en'),
    ('SSAAL', 'Sassafrasso comune', 'it');

-- Names for host Lavandula x intermedia
INSERT INTO plants_names(plant, name, language) VALUES
    ('LAVIN', 'Hybrid lavender', 'en');

-- Names for host Bactris gasipaes
INSERT INTO plants_names(plant, name, language) VALUES
    ('BCTGA', 'Peach palm', 'en'),
    ('BCTGA', 'Spiny-club palm', 'en'),
    ('BCTGA', 'Pewa', 'en'),
    ('BCTGA', 'Pejibave palm', 'en'),
    ('BCTGA', 'Pijuayo', 'it'),
    ('BCTGA', 'Pupunha', 'it'),
    ('BCTGA', 'Chontaduro', 'it'),
    ('BCTGA', 'Chotaduro', 'it'),
    ('BCTGA', 'Palma da pesca', 'it');

-- Names for host Acer campestre
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRCA', 'Common maple', 'en'),
    ('ACRCA', 'Field maple', 'en'),
    ('ACRCA', 'Hedge maple', 'en'),
    ('ACRCA', 'Maser', 'en'),
    ('ACRCA', 'Acero campestre', 'it'),
    ('ACRCA', 'Oppio', 'it'),
    ('ACRCA', 'Testucchio', 'it'),
    ('ACRCA', 'Acero oppio', 'it'),
    ('ACRCA', 'Chioppo', 'it'),
    ('ACRCA', 'Loppio', 'it'),
    ('ACRCA', 'Testuccio', 'it');

-- Names for host Lagenaria siceraria
INSERT INTO plants_names(plant, name, language) VALUES
    ('LGNSI', 'Bottle gourd', 'en'),
    ('LGNSI', 'Calabash gourd', 'en'),
    ('LGNSI', 'Cucuzzi', 'en'),
    ('LGNSI', 'Spaghetti squash', 'en'),
    ('LGNSI', 'White-flowered gourd', 'en'),
    ('LGNSI', 'Chinese squash', 'en'),
    ('LGNSI', 'Monkey apple', 'en'),
    ('LGNSI', 'Zucca bottiglia', 'it'),
    ('LGNSI', 'Zucca lunga', 'it'),
    ('LGNSI', 'Zucca da vino', 'it'),
    ('LGNSI', 'Cocozza', 'it'),
    ('LGNSI', 'Zucca da farina', 'it');

-- Names for host Citrus x aurantium var. deliciosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDDE', 'Tangerine tree', 'en'),
    ('CIDDE', 'Chios mandarin', 'en'),
    ('CIDDE', 'Willowleaf mandarin', 'en'),
    ('CIDDE', 'Mediterranean mandarin', 'en'),
    ('CIDDE', 'Mandarino di Tangeri', 'it'),
    ('CIDDE', 'Tangerino', 'it'),
    ('CIDDE', 'Clementina', 'it');

-- Names for host Hibiscus cannabinus
INSERT INTO plants_names(plant, name, language) VALUES
    ('HIBCA', 'Kenaf', 'en'),
    ('HIBCA', 'Deccan hemp', 'en'),
    ('HIBCA', 'Bombay hemp', 'en');

-- Names for host Pandanus tectorius
INSERT INTO plants_names(plant, name, language) VALUES
    ('PADTE', 'Textile screwpine', 'en'),
    ('PADTE', 'Pandang', 'en'),
    ('PADTE', 'Pandanus palm', 'en'),
    ('PADTE', 'Seashore screwpine', 'en'),
    ('PADTE', 'Variegated screwpine', 'en'),
    ('PADTE', 'Walking tree', 'en'),
    ('PADTE', 'Ananasso della Cina', 'it');

-- Names for host Cenchrus ciliaris
INSERT INTO plants_names(plant, name, language) VALUES
    ('PESCI', 'African foxtail', 'en'),
    ('PESCI', 'Buffelgrass', 'en'),
    ('PESCI', 'Buffalo grass', 'en'),
    ('PESCI', 'Cencro ciliare', 'it'),
    ('PESCI', 'Nappola perenne', 'it');

-- Names for host Ficus microcarpa
INSERT INTO plants_names(plant, name, language) VALUES
    ('FIUMI', 'Laurel fig', 'en'),
    ('FIUMI', 'Chinese banyan', 'en'),
    ('FIUMI', 'Curtain fig', 'en'),
    ('FIUMI', 'Glossy-leaf fig', 'en'),
    ('FIUMI', 'Indian laurel', 'en'),
    ('FIUMI', 'Malay banyan', 'en');

-- Names for host Lactuca sativa
INSERT INTO plants_names(plant, name, language) VALUES
    ('LACSA', 'Lettuce', 'en'),
    ('LACSA', 'Salad', 'en'),
    ('LACSA', 'Garden lettuce', 'en'),
    ('LACSA', 'Lattuga', 'it'),
    ('LACSA', 'Amarulla', 'it'),
    ('LACSA', 'Insalata', 'it'),
    ('LACSA', 'Lattuca', 'it'),
    ('LACSA', 'Lattuga coltivata', 'it');

-- Names for host Prunus serotina
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNSO', 'Black cherry', 'en'),
    ('PRNSO', 'Rum cherry', 'en'),
    ('PRNSO', 'Whisky cherry', 'en'),
    ('PRNSO', 'Pruno tardivo', 'it'),
    ('PRNSO', 'Ciliegio tardivo', 'it'),
    ('PRNSO', 'Ciliego americano', 'it'),
    ('PRNSO', 'Pruno autunnale', 'it');

-- Names for host Ficus religiosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('FIURE', 'Bo', 'en'),
    ('FIURE', 'Peepul', 'en'),
    ('FIURE', 'Sacred fig', 'en'),
    ('FIURE', 'Bodhi tree', 'en'),
    ('FIURE', 'Bo tree', 'en'),
    ('FIURE', 'Holy fig tree', 'en'),
    ('FIURE', 'Fico del diavolo', 'it');

-- Names for host Citrus x aurantium var. clementina
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDCL', 'Clementine', 'en'),
    ('CIDCL', 'Clementina', 'it');

-- Names for host Hibiscus mutabilis
INSERT INTO plants_names(plant, name, language) VALUES
    ('HIBMU', 'Confederate rose', 'en'),
    ('HIBMU', 'Cotton rose', 'en'),
    ('HIBMU', 'Cotton rose mallow', 'en'),
    ('HIBMU', 'Confederate rose mallow', 'en');

-- Names for host Syzygium malaccense
INSERT INTO plants_names(plant, name, language) VALUES
    ('SYZMA', 'Pomerac', 'en'),
    ('SYZMA', 'Malay apple', 'en'),
    ('SYZMA', 'Long-fruited rose apple', 'en'),
    ('SYZMA', 'Kelat oil', 'en'),
    ('SYZMA', 'Mountain apple', 'en'),
    ('SYZMA', 'Ohia', 'en'),
    ('SYZMA', 'Otaheite apple', 'en');

-- Names for host Populus sieboldii
INSERT INTO plants_names(plant, name, language) VALUES
    ('POPSI', 'Japanese aspen', 'en');

-- Names for host Coffea canephora
INSERT INTO plants_names(plant, name, language) VALUES
    ('COFCA', 'Robusta coffee', 'en'),
    ('COFCA', 'Congo coffee', 'en'),
    ('COFCA', 'Caffè robusta', 'it');

-- Names for host Acer pseudosieboldianum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRPS', 'Korean maple', 'en'),
    ('ACRPS', 'Purple-bloom maple', 'en'),
    ('ACRPS', 'Acero di Corea', 'it');

-- Names for host Areca catechu
INSERT INTO plants_names(plant, name, language) VALUES
    ('ARMCA', 'Areca-nut palm', 'en'),
    ('ARMCA', 'Betel-nut palm', 'en'),
    ('ARMCA', 'Avellana d''India', 'it'),
    ('ARMCA', 'Palma catechu', 'it'),
    ('ARMCA', 'Areca', 'it');

-- Names for host Glycine max
INSERT INTO plants_names(plant, name, language) VALUES
    ('GLXMA', 'Soybean', 'en'),
    ('GLXMA', 'Soja', 'it'),
    ('GLXMA', 'Soia', 'it');

-- Names for host Adonidia merrillii
INSERT INTO plants_names(plant, name, language) VALUES
    ('VTHME', 'Manila palm', 'en'),
    ('VTHME', 'Adonidia palm', 'en'),
    ('VTHME', 'Dwarf royal palm', 'en'),
    ('VTHME', 'Christmas palm', 'en'),
    ('VTHME', 'Palma di Natal', 'it'),
    ('VTHME', 'Palma di Manila', 'it');

-- Names for host Coccinia grandis
INSERT INTO plants_names(plant, name, language) VALUES
    ('COCGR', 'Scarlet-fruited ivy gourd', 'en'),
    ('COCGR', 'Kovai fruit', 'en'),
    ('COCGR', 'Ivy gourd', 'en'),
    ('COCGR', 'Scarlet gourd', 'en');

-- Names for host Olea europaea
INSERT INTO plants_names(plant, name, language) VALUES
    ('OLVEU', 'Olive', 'en'),
    ('OLVEU', 'Common olive', 'en'),
    ('OLVEU', 'Olivo', 'it'),
    ('OLVEU', 'Olivo', 'it'),
    ('OLVEU', 'Ulivo', 'it');

-- Names for host Ochrosia mariannensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('OCRMA', 'Fago', 'en');

-- Names for host Rheum rhaponticum
INSERT INTO plants_names(plant, name, language) VALUES
    ('RHERP', 'False rhubarb', 'en');

-- Names for host Sambucus javanica
INSERT INTO plants_names(plant, name, language) VALUES
    ('SAMJA', 'Chinese elder', 'en');

-- Names for host Sesbania grandiflora
INSERT INTO plants_names(plant, name, language) VALUES
    ('SEBGR', 'Agati sesbania', 'en'),
    ('SEBGR', 'Scarlet wistaria', 'en'),
    ('SEBGR', 'Baby booties', 'en'),
    ('SEBGR', 'Humming bird tree', 'en'),
    ('SEBGR', 'Vegetable hummingbird', 'en'),
    ('SEBGR', 'Sesbania', 'it');

-- Names for host Annona muricata
INSERT INTO plants_names(plant, name, language) VALUES
    ('ANUMU', 'Soursop', 'en'),
    ('ANUMU', 'Prickly custard apple', 'en'),
    ('ANUMU', 'Annona moricata', 'it'),
    ('ANUMU', 'Annona spinosa', 'it'),
    ('ANUMU', 'Casimentaria', 'it'),
    ('ANUMU', 'Pomo di canella', 'it');

-- Names for host Alangium salviifolium
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALNSA', 'Sage-leaved alangium', 'en');

-- Names for host Cananga odorata
INSERT INTO plants_names(plant, name, language) VALUES
    ('CANOD', 'Macassar-oil tree', 'en'),
    ('CANOD', 'Perfume tree', 'en'),
    ('CANOD', 'Ylang-ylang', 'en'),
    ('CANOD', 'Dwarf ylang-ylang tree', 'en'),
    ('CANOD', 'Ylang-ylang tree', 'en');

-- Names for host Helianthus tuberosus
INSERT INTO plants_names(plant, name, language) VALUES
    ('HELTU', 'Jerusalem artichoke', 'en'),
    ('HELTU', 'Canada potato', 'en'),
    ('HELTU', 'Topinambur', 'it'),
    ('HELTU', 'Tartufo di canna', 'it'),
    ('HELTU', 'Elianto tuberoso', 'it'),
    ('HELTU', 'Patata di Canadà', 'it'),
    ('HELTU', 'Girasole del Canada', 'it');

-- Names for host Sclerocarya birrea
INSERT INTO plants_names(plant, name, language) VALUES
    ('SLCBB', 'Cider tree', 'en'),
    ('SLCBB', 'Marula', 'en');

-- Names for host Larix decidua
INSERT INTO plants_names(plant, name, language) VALUES
    ('LAXDE', 'Common larch', 'en'),
    ('LAXDE', 'European larch', 'en'),
    ('LAXDE', 'Larch', 'en'),
    ('LAXDE', 'White larch', 'en'),
    ('LAXDE', 'Larice europeo', 'it'),
    ('LAXDE', 'Larice', 'it'),
    ('LAXDE', 'Larice comune', 'it');

-- Names for host Ficus pumila
INSERT INTO plants_names(plant, name, language) VALUES
    ('FIUPU', 'Creeping fig', 'en'),
    ('FIUPU', 'Climbing fig', 'en'),
    ('FIUPU', 'Fico rampicante', 'it');

-- Names for host Quercus ilex
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUEIL', 'Holm oak', 'en'),
    ('QUEIL', 'Holly oak', 'en'),
    ('QUEIL', 'Evergreen oak', 'en'),
    ('QUEIL', 'Leccio', 'it'),
    ('QUEIL', 'Quercia leccio', 'it'),
    ('QUEIL', 'Elice', 'it'),
    ('QUEIL', 'Elce', 'it');

-- Names for host Salvia rosmarinus
INSERT INTO plants_names(plant, name, language) VALUES
    ('RMSOF', 'Garden rosemary', 'en'),
    ('RMSOF', 'Moorwort', 'en'),
    ('RMSOF', 'Rosemary', 'en'),
    ('RMSOF', 'Romerino comune', 'it'),
    ('RMSOF', 'Rosmarino comune', 'it'),
    ('RMSOF', 'Rosmarino', 'it');

-- Names for host Ulmus davidiana var. japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('ULMJA', 'Japanese elm', 'en');

-- Names for host Spinacia oleracea
INSERT INTO plants_names(plant, name, language) VALUES
    ('SPQOL', 'Spinach', 'en'),
    ('SPQOL', 'Spinacio', 'it'),
    ('SPQOL', 'Spinacio comune', 'it');

-- Names for host Musa troglodytarum
INSERT INTO plants_names(plant, name, language) VALUES
    ('MUBTR', 'Red flowering Thai banana', 'en'),
    ('MUBTR', 'Red torch banana', 'en');

-- Names for host Pyracantha angustifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('PYEAN', 'Narrow-leaf firethorn', 'en'),
    ('PYEAN', 'Orange firethorn', 'en'),
    ('PYEAN', 'Yellow firethorn', 'en');

-- Names for host Salix nigra
INSERT INTO plants_names(plant, name, language) VALUES
    ('SAXNI', 'Black willow', 'en'),
    ('SAXNI', 'Salice nero d''America', 'it');

-- Names for host Vitex agnus-castus
INSERT INTO plants_names(plant, name, language) VALUES
    ('VIXAC', 'Monk''s pepper', 'en'),
    ('VIXAC', 'Lilac chaste tree', 'en'),
    ('VIXAC', 'Abraham''s balm', 'en'),
    ('VIXAC', 'Chasteberry', 'en'),
    ('VIXAC', 'Chaste tree', 'en'),
    ('VIXAC', 'Five-leaf chaste tree', 'en'),
    ('VIXAC', 'Hemp tree', 'en'),
    ('VIXAC', 'Vitex', 'en'),
    ('VIXAC', 'Agno-casto', 'it'),
    ('VIXAC', 'Aino', 'it'),
    ('VIXAC', 'Lágano', 'it'),
    ('VIXAC', 'Pepe falso', 'it');

-- Names for host Alnus hirsuta
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALUHI', 'Manchurian alder', 'en');

-- Names for host Senna siamea
INSERT INTO plants_names(plant, name, language) VALUES
    ('CASSM', 'Kassod', 'en'),
    ('CASSM', 'Cassia tree', 'en'),
    ('CASSM', 'Siamese cassia', 'en');

-- Names for host Juglans regia
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGRE', 'Common walnut', 'en'),
    ('IUGRE', 'Persian walnut', 'en'),
    ('IUGRE', 'Walnut', 'en'),
    ('IUGRE', 'Noce comune', 'it'),
    ('IUGRE', 'Noce', 'it');

-- Names for host Catharanthus roseus
INSERT INTO plants_names(plant, name, language) VALUES
    ('CTURO', 'Pink periwinkle', 'en'),
    ('CTURO', 'Madagascar periwinkle', 'en'),
    ('CTURO', 'Madagascar rosy periwinkle', 'en'),
    ('CTURO', 'Cayenne jasmine', 'en'),
    ('CTURO', 'Rosy periwinkle', 'en'),
    ('CTURO', 'Tonga', 'en');

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

-- Names for host Toona ciliata
INSERT INTO plants_names(plant, name, language) VALUES
    ('TOOCI', 'Red toon', 'en'),
    ('TOOCI', 'Burma cedar', 'en'),
    ('TOOCI', 'Australian red cedar', 'en'),
    ('TOOCI', 'Indian cedar', 'en'),
    ('TOOCI', 'Indian mahogany', 'en'),
    ('TOOCI', 'Moulmein cedar', 'en'),
    ('TOOCI', 'Queensland red cedar', 'en'),
    ('TOOCI', 'Toon', 'en'),
    ('TOOCI', 'Toona', 'en');

-- Names for host Nerium oleander
INSERT INTO plants_names(plant, name, language) VALUES
    ('NEROL', 'Oleander', 'en'),
    ('NEROL', 'Rose bay', 'en'),
    ('NEROL', 'Common oleander', 'en'),
    ('NEROL', 'Oleandro', 'it'),
    ('NEROL', 'Lauro roseo', 'it'),
    ('NEROL', 'Mazza cavallo', 'it'),
    ('NEROL', 'Mazza di San Giuseppe', 'it');

-- Names for host Calophyllum inophyllum
INSERT INTO plants_names(plant, name, language) VALUES
    ('CMUIN', 'Indiapoon beauty-leaf', 'en'),
    ('CMUIN', 'Mastwood beauty-leaf', 'en'),
    ('CMUIN', 'Kamani', 'en'),
    ('CMUIN', 'Poon', 'en'),
    ('CMUIN', 'Beach calophyllum', 'en'),
    ('CMUIN', 'Dilo oil tree', 'en'),
    ('CMUIN', 'Dingkaran', 'en'),
    ('CMUIN', 'Alexandrian laurel', 'en'),
    ('CMUIN', 'Borneo mahogony', 'en'),
    ('CMUIN', 'Beauty leaf', 'en'),
    ('CMUIN', 'Indian laurel', 'en');

-- Names for host Abies nordmanniana
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABINO', 'Caucasian fir', 'en'),
    ('ABINO', 'Nordmann''s silver fir', 'en'),
    ('ABINO', 'Nordmann''s fir', 'en'),
    ('ABINO', 'Nordmann fir', 'en'),
    ('ABINO', 'Abete del Caucaso', 'it'),
    ('ABINO', 'Abete di Nordmann', 'it');

-- Names for host Solanum incanum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLIA', 'Grey bitter-apple', 'en'),
    ('SOLIA', 'Thorn-apple', 'en'),
    ('SOLIA', 'Bitter-tomato', 'en');

-- Names for host Vitis berlandieri
INSERT INTO plants_names(plant, name, language) VALUES
    ('VITBE', 'Spanish grape', 'en');

-- Names for host Quercus stellata
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUESL', 'Post oak', 'en');

-- Names for host Solanum donianum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLVE', 'Potato tree', 'en'),
    ('SOLVE', 'Canary nightshade', 'en');

-- Names for host Metrosideros excelsa
INSERT INTO plants_names(plant, name, language) VALUES
    ('MTDEX', 'New Zealand Christmas tree', 'en'),
    ('MTDEX', 'Pōhutukawa', 'en');

-- Names for host Westringia glabra
INSERT INTO plants_names(plant, name, language) VALUES
    ('WESGL', 'Violet westringia', 'en');

-- Names for host Genista scorpius
INSERT INTO plants_names(plant, name, language) VALUES
    ('GENSC', 'Scorpion broom', 'en'),
    ('GENSC', 'Ginestra scorpione', 'it');

-- Names for host Prunus dulcis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNDU', 'Sweet almond', 'en'),
    ('PRNDU', 'Almond', 'en'),
    ('PRNDU', 'Mandorlo dolce', 'it'),
    ('PRNDU', 'Mandorlo', 'it');

-- Names for host Prunus salicina
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNSC', 'Chinese plum', 'en'),
    ('PRNSC', 'Japanese plum', 'en');

-- Names for host Persicaria orientalis
INSERT INTO plants_names(plant, name, language) VALUES
    ('POLOR', 'Eastern knotgrass', 'en'),
    ('POLOR', 'Prince''s feather', 'en'),
    ('POLOR', 'Princess feather', 'en'),
    ('POLOR', 'Kiss me over the garden gate', 'en'),
    ('POLOR', 'Prince''s feather smartweed', 'en'),
    ('POLOR', 'Poligono orientale', 'it');

-- Names for host Coccoloba uvifera
INSERT INTO plants_names(plant, name, language) VALUES
    ('CODUV', 'Common sea grape', 'en'),
    ('CODUV', 'Jamaica kino', 'en'),
    ('CODUV', 'Platter leaf', 'en'),
    ('CODUV', 'Sea grape', 'en');

-- Names for host Baccaurea motleyana
INSERT INTO plants_names(plant, name, language) VALUES
    ('BCCMO', 'Rambai', 'en');

-- Names for host Akebia trifoliata
INSERT INTO plants_names(plant, name, language) VALUES
    ('AKETF', 'Three-leaf akebia', 'en');

-- Names for host Irvingia gabonensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('IRVGA', 'Wild mango', 'en'),
    ('IRVGA', 'Dica', 'it');

-- Names for host Malus sylvestris
INSERT INTO plants_names(plant, name, language) VALUES
    ('MABSY', 'Wild apple', 'en'),
    ('MABSY', 'Crab apple', 'en'),
    ('MABSY', 'Wild crab', 'en'),
    ('MABSY', 'Melo selvatico', 'it');

-- Names for host Borassus flabellifer
INSERT INTO plants_names(plant, name, language) VALUES
    ('BASFL', 'Brab', 'en'),
    ('BASFL', 'Toddy palm', 'en'),
    ('BASFL', 'Sugar palm', 'en'),
    ('BASFL', 'Cambodian palm', 'en'),
    ('BASFL', 'Asian Palmyra palm', 'en'),
    ('BASFL', 'Palmyra palm', 'en'),
    ('BASFL', 'Black palm', 'en'),
    ('BASFL', 'Lontar palm', 'en'),
    ('BASFL', 'Sea coconut', 'en'),
    ('BASFL', 'Wine palm', 'en'),
    ('BASFL', 'Palma da ventagli', 'it'),
    ('BASFL', 'Palma di Palmyra', 'it');

-- Names for host Terminalia bellirica
INSERT INTO plants_names(plant, name, language) VALUES
    ('TEMBL', 'Bahera', 'en'),
    ('TEMBL', 'Bastard myrobalan', 'en'),
    ('TEMBL', 'Beleric', 'en');

-- Names for host Asparagus officinalis
INSERT INTO plants_names(plant, name, language) VALUES
    ('ASPOF', 'Asparagus', 'en'),
    ('ASPOF', 'Garden asparagus', 'en'),
    ('ASPOF', 'Wild asparagus', 'en'),
    ('ASPOF', 'Asparagio', 'it'),
    ('ASPOF', 'Spaghero', 'it'),
    ('ASPOF', 'Asparago comune', 'it');

-- Names for host Ulmus pumila
INSERT INTO plants_names(plant, name, language) VALUES
    ('ULMPU', 'Dwarf Asiatic elm', 'en'),
    ('ULMPU', 'Siberian elm', 'en'),
    ('ULMPU', 'Olmo sibiriano', 'it');

-- Names for host Arenga pinnata
INSERT INTO plants_names(plant, name, language) VALUES
    ('AGBPI', 'Sagwine', 'en'),
    ('AGBPI', 'Sugar palm', 'en'),
    ('AGBPI', 'Gomuti  palm', 'en'),
    ('AGBPI', 'Palma arenga', 'it'),
    ('AGBPI', 'Palma dello zucchero', 'it'),
    ('AGBPI', 'Palma saccarifera', 'it');

-- Names for host Phoenix dactylifera
INSERT INTO plants_names(plant, name, language) VALUES
    ('PHXDA', 'Common date palm', 'en'),
    ('PHXDA', 'Date palm', 'en'),
    ('PHXDA', 'Palma del dattero comune', 'it'),
    ('PHXDA', 'Dattero', 'it'),
    ('PHXDA', 'Dattolo', 'it'),
    ('PHXDA', 'Palmo da datteri', 'it');

-- Names for host Durio zibethinus
INSERT INTO plants_names(plant, name, language) VALUES
    ('DURZI', 'Durian', 'en'),
    ('DURZI', 'Durie', 'it');

-- Names for host Viburnum tinus
INSERT INTO plants_names(plant, name, language) VALUES
    ('VIBTI', 'Laurustinus', 'en'),
    ('VIBTI', 'Viburno tino', 'it'),
    ('VIBTI', 'Alloro-tino', 'it'),
    ('VIBTI', 'Dentaggine', 'it'),
    ('VIBTI', 'Laurentino', 'it'),
    ('VIBTI', 'Laurotino', 'it'),
    ('VIBTI', 'Lentaggine', 'it'),
    ('VIBTI', 'Timo', 'it');

-- Names for host Citrus trifoliata
INSERT INTO plants_names(plant, name, language) VALUES
    ('PMITR', 'Trifoliate orange', 'en'),
    ('PMITR', 'Golden apple', 'en'),
    ('PMITR', 'Hardy orange', 'en'),
    ('PMITR', 'Egle', 'it');

-- Names for host Nierembergia frutescens
INSERT INTO plants_names(plant, name, language) VALUES
    ('NIEFR', 'Tall cup-flower', 'en');

-- Names for host Fragaria vesca
INSERT INTO plants_names(plant, name, language) VALUES
    ('FRAVE', 'Wild strawberry', 'en'),
    ('FRAVE', 'European strawberry', 'en'),
    ('FRAVE', 'Fragola selvatica', 'it'),
    ('FRAVE', 'Fragola comune', 'it');

-- Names for host Ziziphus mauritiana
INSERT INTO plants_names(plant, name, language) VALUES
    ('ZIPMA', 'Ber', 'en'),
    ('ZIPMA', 'Indian jujube', 'en');

-- Names for host Cayratia japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('CAYJA', 'Sorrel vine', 'en');

-- Names for host Casuarina equisetifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSUEQ', 'Horse-tail beefwood', 'en'),
    ('CSUEQ', 'Bull oak', 'en'),
    ('CSUEQ', 'Common ironwood', 'en'),
    ('CSUEQ', 'Common ru', 'en'),
    ('CSUEQ', 'Horse-tail tree', 'en'),
    ('CSUEQ', 'Australian oak', 'en'),
    ('CSUEQ', 'Australian pine', 'en'),
    ('CSUEQ', 'Australian pine', 'en'),
    ('CSUEQ', 'Beach sea-oak', 'en'),
    ('CSUEQ', 'Beefwood', 'en'),
    ('CSUEQ', 'Ironwood', 'en'),
    ('CSUEQ', 'She-oak', 'en'),
    ('CSUEQ', 'Whistling pine', 'en'),
    ('CSUEQ', 'Casuarina', 'it'),
    ('CSUEQ', 'Albero del ferro', 'it'),
    ('CSUEQ', 'Casuarina comune', 'it'),
    ('CSUEQ', 'Pino australiano', 'it');

-- Names for host Coreopsis grandiflora
INSERT INTO plants_names(plant, name, language) VALUES
    ('CRLGR', 'Large-flowered tickseed', 'en');

-- Names for host Momordica charantia
INSERT INTO plants_names(plant, name, language) VALUES
    ('MOMCH', 'Balsam pear', 'en'),
    ('MOMCH', 'Bitter balsam apple', 'en'),
    ('MOMCH', 'Bitter gourd', 'en'),
    ('MOMCH', 'Bitter melon', 'en'),
    ('MOMCH', 'Paria', 'en'),
    ('MOMCH', 'Balsam apple', 'en'),
    ('MOMCH', 'Pomo balsamo', 'it');

-- Names for host Syzygium grande
INSERT INTO plants_names(plant, name, language) VALUES
    ('SYZGR', 'Sea apple', 'en');

-- Names for host Wisteria floribunda
INSERT INTO plants_names(plant, name, language) VALUES
    ('WSTFL', 'Japanese wisteria', 'en'),
    ('WSTFL', 'Glicine del Giappone', 'it');

-- Names for host Quercus coccinea
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUECO', 'Scarlet oak', 'en'),
    ('QUECO', 'Quercia della cocciniglia', 'it'),
    ('QUECO', 'Quercia scarlatta d''America', 'it'),
    ('QUECO', 'Quercia scarlatta', 'it');

-- Names for host Vitis rupestris
INSERT INTO plants_names(plant, name, language) VALUES
    ('VITRU', 'Mountain grape', 'en'),
    ('VITRU', 'Sand grape', 'en'),
    ('VITRU', 'Frost grape', 'en'),
    ('VITRU', 'Riverbank grape', 'en');

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

-- Names for host Solanum carolinense
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLCA', 'Bull nettle', 'en'),
    ('SOLCA', 'Horse nettle', 'en'),
    ('SOLCA', 'Carolina horse nettle', 'en'),
    ('SOLCA', 'Sand brier', 'en'),
    ('SOLCA', 'Morella della Carolina', 'it');

-- Names for host Diospyros kaki
INSERT INTO plants_names(plant, name, language) VALUES
    ('DOSKA', 'Kaki plum', 'en'),
    ('DOSKA', 'Chinese date plum', 'en'),
    ('DOSKA', 'Chinese persimmon', 'en'),
    ('DOSKA', 'Japanese persimmon', 'en'),
    ('DOSKA', 'Kaki', 'en'),
    ('DOSKA', 'Persimmon', 'en'),
    ('DOSKA', 'Kaki', 'it'),
    ('DOSKA', 'Cachi', 'it'),
    ('DOSKA', 'Loto del Giappone', 'it');

-- Names for host Citrus x limonia
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDLO', 'Canton lemon', 'en'),
    ('CIDLO', 'Mandarin lime', 'en'),
    ('CIDLO', 'Rangpur lime', 'en');

-- Names for host Musa x paradisiaca
INSERT INTO plants_names(plant, name, language) VALUES
    ('MUBPA', 'Common banana', 'en'),
    ('MUBPA', 'Banana', 'en'),
    ('MUBPA', 'Plantain', 'en'),
    ('MUBPA', 'Bananano comune', 'it'),
    ('MUBPA', 'Banano', 'it');

-- Names for host Quercus petraea
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUEPE', 'Durmast oak', 'en'),
    ('QUEPE', 'Sessile oak', 'en'),
    ('QUEPE', 'Rovere', 'it'),
    ('QUEPE', 'Quercia comune', 'it'),
    ('QUEPE', 'Ischia', 'it'),
    ('QUEPE', 'Quercia rovere', 'it');

-- Names for host Citrus x junos
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDJU', 'Japanese citron', 'en'),
    ('CIDJU', 'Yuzu', 'en'),
    ('CIDJU', 'Yuzù', 'it');

-- Names for host Elaeagnus umbellata
INSERT INTO plants_names(plant, name, language) VALUES
    ('ELGUM', 'Autumn olive', 'en'),
    ('ELGUM', 'Autumn elaeagnus', 'en'),
    ('ELGUM', 'Japanese silverberry', 'en'),
    ('ELGUM', 'Spreading oleaster', 'en'),
    ('ELGUM', 'Umbellata oleaster', 'en');

-- Names for host Malus baccata
INSERT INTO plants_names(plant, name, language) VALUES
    ('MABBA', 'Siberian crab apple', 'en'),
    ('MABBA', 'Siberian crab', 'en'),
    ('MABBA', 'Melo di Siberia', 'it');

-- Names for host Pinus nigra
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUNI', 'Black pine', 'en'),
    ('PIUNI', 'Austrian pine', 'en'),
    ('PIUNI', 'Pino nero', 'it'),
    ('PIUNI', 'Pino d''Austria', 'it'),
    ('PIUNI', 'Pino austriaco', 'it');

-- Names for host Fraxinus americana
INSERT INTO plants_names(plant, name, language) VALUES
    ('FRXAM', 'Cane ash', 'en'),
    ('FRXAM', 'White ash', 'en'),
    ('FRXAM', 'Frassino bianco americano', 'it');

-- Names for host Malva pusilla
INSERT INTO plants_names(plant, name, language) VALUES
    ('MALPU', 'Low mallow', 'en'),
    ('MALPU', 'Round-leaved mallow', 'en'),
    ('MALPU', 'Small mallow', 'en'),
    ('MALPU', 'Dwarf mallow', 'en'),
    ('MALPU', 'Small-flowered mallow', 'en'),
    ('MALPU', 'Malva piccola', 'it'),
    ('MALPU', 'Malva boreale', 'it');

-- Names for host Entada phaseoloides
INSERT INTO plants_names(plant, name, language) VALUES
    ('ENTPH', 'Swordbean', 'en'),
    ('ENTPH', 'Nickerbean', 'en'),
    ('ENTPH', 'St Thomas bean', 'en');

-- Names for host Planchonella duclitan
INSERT INTO plants_names(plant, name, language) VALUES
    ('PQKDU', 'Duklitan', 'en');

-- Names for host Acca sellowiana
INSERT INTO plants_names(plant, name, language) VALUES
    ('FEJSE', 'Pineapple guava', 'en');

-- Names for host Dovyalis hebecarpa
INSERT INTO plants_names(plant, name, language) VALUES
    ('DOVHE', 'Ketembilla', 'en'),
    ('DOVHE', 'Ceylon gooseberry', 'en');

-- Names for host Gambeya albida
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSFAL', 'African star apple', 'en');

-- Names for host Pterocarya rhoifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('PTFRH', 'Japanese wing nut', 'en'),
    ('PTFRH', 'Pterocaria del Giappone', 'it');

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

-- Names for host Noronhia emarginata
INSERT INTO plants_names(plant, name, language) VALUES
    ('NOREM', 'Madagascar olive', 'en');

-- Names for host Tilia cordata
INSERT INTO plants_names(plant, name, language) VALUES
    ('TILCO', 'Small-leaved linden', 'en'),
    ('TILCO', 'Small-leaved lime', 'en'),
    ('TILCO', 'Bast', 'en'),
    ('TILCO', 'Linden', 'en'),
    ('TILCO', 'Tiglio selvatico', 'it'),
    ('TILCO', 'Tiglio riccio', 'it'),
    ('TILCO', 'Tiglio cordato', 'it');

-- Names for host Pimenta dioica
INSERT INTO plants_names(plant, name, language) VALUES
    ('PMTDI', 'Allspice', 'en'),
    ('PMTDI', 'Pimento', 'en'),
    ('PMTDI', 'Jamaica pepper', 'en'),
    ('PMTDI', 'Jamaican sweet pepper', 'en'),
    ('PMTDI', 'Pimento inglese', 'it');

-- Names for host Diospyros malabarica
INSERT INTO plants_names(plant, name, language) VALUES
    ('DOSMA', 'Black-and-white ebony', 'en'),
    ('DOSMA', 'Gaub', 'en'),
    ('DOSMA', 'Indian persimmon', 'en'),
    ('DOSMA', 'Malabar ebony', 'en'),
    ('DOSMA', 'Pale moon ebony', 'en'),
    ('DOSMA', 'Timbiri', 'en');

-- Names for host Fragaria x ananassa
INSERT INTO plants_names(plant, name, language) VALUES
    ('FRAAN', 'Garden strawberry', 'en'),
    ('FRAAN', 'Pine strawberry', 'en'),
    ('FRAAN', 'Strawberry', 'en'),
    ('FRAAN', 'Fragola coltivata', 'it');

-- Names for host Lolium arundinaceum
INSERT INTO plants_names(plant, name, language) VALUES
    ('FESAR', 'Reed fescue', 'en'),
    ('FESAR', 'Tall fescue', 'en'),
    ('FESAR', 'Alta fescue', 'en'),
    ('FESAR', 'Festuca alta', 'it'),
    ('FESAR', 'Festuca arundinacea', 'it'),
    ('FESAR', 'Festuca falascona', 'it'),
    ('FESAR', 'Festuca falsa canna', 'it');

-- Names for host Passiflora tripartita
INSERT INTO plants_names(plant, name, language) VALUES
    ('PAQTR', 'Banana passion fruit', 'en'),
    ('PAQTR', 'Banana poker', 'en');

-- Names for host Fragaria virginiana
INSERT INTO plants_names(plant, name, language) VALUES
    ('FRAVI', 'Scarlet strawberry', 'en'),
    ('FRAVI', 'Virginia strawberry', 'en'),
    ('FRAVI', 'Wild strawberry', 'en'),
    ('FRAVI', 'Fragoloni', 'it');

-- Names for host Ceratonia siliqua
INSERT INTO plants_names(plant, name, language) VALUES
    ('CEQSI', 'Carob', 'en'),
    ('CEQSI', 'Locust bean', 'en'),
    ('CEQSI', 'St John''s bread', 'en'),
    ('CEQSI', 'Carob tree', 'en'),
    ('CEQSI', 'Locust tree', 'en'),
    ('CEQSI', 'Carrubo', 'it');

-- Names for host Buxus sempervirens
INSERT INTO plants_names(plant, name, language) VALUES
    ('BUXSE', 'Common box', 'en'),
    ('BUXSE', 'Box', 'en'),
    ('BUXSE', 'Bosso', 'it'),
    ('BUXSE', 'Bossolo', 'it'),
    ('BUXSE', 'Mortella', 'it'),
    ('BUXSE', 'Bosso comune', 'it');

-- Names for host Genista corsica
INSERT INTO plants_names(plant, name, language) VALUES
    ('GENCO', 'Corsican gorse', 'en'),
    ('GENCO', 'Ginestra di Corsica', 'it');

-- Names for host Passiflora caerulea
INSERT INTO plants_names(plant, name, language) VALUES
    ('PAQCO', 'Blue-crown passionflower', 'en'),
    ('PAQCO', 'Fior di passione', 'it');

-- Names for host Macaranga tanarius
INSERT INTO plants_names(plant, name, language) VALUES
    ('MCRTA', 'Blush macaranga', 'en'),
    ('MCRTA', 'Hairy mahang', 'en'),
    ('MCRTA', 'Parasol leaf tree', 'en');

-- Names for host Cytisus scoparius
INSERT INTO plants_names(plant, name, language) VALUES
    ('SAOSC', 'Broom', 'en'),
    ('SAOSC', 'English broom', 'en'),
    ('SAOSC', 'Scottish broom', 'en'),
    ('SAOSC', 'Common broom', 'en'),
    ('SAOSC', 'Ginestra dei carbonai', 'it'),
    ('SAOSC', 'Ginestra da granate', 'it'),
    ('SAOSC', 'Amaracciole', 'it'),
    ('SAOSC', 'Emero scornabecco', 'it'),
    ('SAOSC', 'Alastica', 'it'),
    ('SAOSC', 'Alastra', 'it'),
    ('SAOSC', 'Citiso scopario', 'it');

-- Names for host Pinus elliottii
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUEL', 'Slash pine', 'en'),
    ('PIUEL', 'American pitch pine', 'en'),
    ('PIUEL', 'Pino di Elliott', 'it');

-- Names for host Potentilla indica
INSERT INTO plants_names(plant, name, language) VALUES
    ('DUCIN', 'False strawberry', 'en'),
    ('DUCIN', 'Yellow-flowered strawberry', 'en'),
    ('DUCIN', 'Indian mock strawberry', 'en'),
    ('DUCIN', 'Indian strawberry', 'en'),
    ('DUCIN', 'Mock strawberry', 'en'),
    ('DUCIN', 'Fragola matta', 'it');

-- Names for host Solanum mauritianum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLMR', 'Woolly nightshade', 'en'),
    ('SOLMR', 'Bug tree', 'en'),
    ('SOLMR', 'Flannel weed', 'en'),
    ('SOLMR', 'Kerosene weed', 'en'),
    ('SOLMR', 'Tobacco weed', 'en'),
    ('SOLMR', 'Morella delle isole Mauritius', 'it');

-- Names for host Quercus suber
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUESU', 'Cork oak', 'en'),
    ('QUESU', 'Quercia sughera', 'it'),
    ('QUESU', 'Quercia da sughero', 'it'),
    ('QUESU', 'Sughera', 'it');

-- Names for host Phlox drummondii
INSERT INTO plants_names(plant, name, language) VALUES
    ('POXDR', 'Annual phlox', 'en');

-- Names for host Opuntia ficus-indica
INSERT INTO plants_names(plant, name, language) VALUES
    ('OPUFI', 'Mission cactus', 'en'),
    ('OPUFI', 'Mission prickly pear', 'en'),
    ('OPUFI', 'Smooth mountain prickly pear', 'en'),
    ('OPUFI', 'Indian fig prickly pear', 'en'),
    ('OPUFI', 'Barbary fig', 'en'),
    ('OPUFI', 'Indian fig', 'en'),
    ('OPUFI', 'Prickly pear', 'en'),
    ('OPUFI', 'Smooth prickly pear', 'en'),
    ('OPUFI', 'Sweet prickly pear', 'en'),
    ('OPUFI', 'Tuna cactus', 'en'),
    ('OPUFI', 'Fico d''India', 'it'),
    ('OPUFI', 'Pero pungente', 'it');

-- Names for host Acacia cultriformis
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACACL', 'Knife acacia', 'en'),
    ('ACACL', 'Knife-leaf acacia', 'en'),
    ('ACACL', 'Dogtooth wattle', 'en'),
    ('ACACL', 'Golden-glow wattle', 'en'),
    ('ACACL', 'Half-moon wattle', 'en'),
    ('ACACL', 'Knife-leaf wattle', 'en');

-- Names for host Cistus salviifolius
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSTSA', 'Sage-leaved cistus', 'en'),
    ('CSTSA', 'Sage-leaved rockrose', 'en'),
    ('CSTSA', 'Cisto femmina', 'it'),
    ('CSTSA', 'Cisto a foglie di salvia', 'it'),
    ('CSTSA', 'Brentina', 'it'),
    ('CSTSA', 'Scornabecco', 'it');

-- Names for host Populus deltoides
INSERT INTO plants_names(plant, name, language) VALUES
    ('POPDE', 'Eastern poplar', 'en'),
    ('POPDE', 'Eastern cottonwood', 'en'),
    ('POPDE', 'Common cottonwood', 'en'),
    ('POPDE', 'American black poplar', 'en'),
    ('POPDE', 'Canadian poplar', 'en'),
    ('POPDE', 'Necklace poplar', 'en'),
    ('POPDE', 'Palmer cottonwood', 'en'),
    ('POPDE', 'Pioppo nero d''America', 'it');

-- Names for host Rollinia mucosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('RLLMU', 'Sugar apple', 'en'),
    ('RLLMU', 'Wild sugar apple', 'en');

-- Names for host Medicago sativa
INSERT INTO plants_names(plant, name, language) VALUES
    ('MEDSA', 'Alfalfa', 'en'),
    ('MEDSA', 'Lucerne', 'en'),
    ('MEDSA', 'Purple medick', 'en'),
    ('MEDSA', 'Erba medica', 'it'),
    ('MEDSA', 'Erba Spagna', 'it'),
    ('MEDSA', 'Erba regia', 'it'),
    ('MEDSA', 'Erba medica coltivata', 'it'),
    ('MEDSA', 'Medica', 'it');

-- Names for host Prunus cerasifera
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNCF', 'Cherry plum', 'en'),
    ('PRNCF', 'Myrobalan plum', 'en'),
    ('PRNCF', 'Ciliegio susino', 'it'),
    ('PRNCF', 'Mirabolano', 'it');

-- Names for host Rosa multiflora
INSERT INTO plants_names(plant, name, language) VALUES
    ('ROSMU', 'Baby rose', 'en'),
    ('ROSMU', 'Bramble rose', 'en'),
    ('ROSMU', 'Multiflora rose', 'en'),
    ('ROSMU', 'Japanese rose', 'en'),
    ('ROSMU', 'Many-flowered rose', 'en'),
    ('ROSMU', 'Rosa moltiflora', 'it');

-- Names for host Hibiscus rosa-sinensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('HIBRS', 'Shoe-flower', 'en'),
    ('HIBRS', 'China rose', 'en'),
    ('HIBRS', 'Chinese hibiscus', 'en'),
    ('HIBRS', 'Hawaiian hibiscus', 'en'),
    ('HIBRS', 'Chinese rose', 'en'),
    ('HIBRS', 'Rose mallow', 'en'),
    ('HIBRS', 'Rose of China', 'en'),
    ('HIBRS', 'Shoe-black plant', 'en'),
    ('HIBRS', 'Ibisco cinese', 'it'),
    ('HIBRS', 'Rosa della Cina', 'it');

-- Names for host Syzygium aqueum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SYZAQ', 'Watery rose apple', 'en'),
    ('SYZAQ', 'Water apple', 'en'),
    ('SYZAQ', 'Wax jambo', 'en');

-- Names for host Acer tegmentosum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRTG', 'East Asian stripe maple', 'en');

-- Names for host Sorghum halepense
INSERT INTO plants_names(plant, name, language) VALUES
    ('SORHA', 'Johnson grass', 'en'),
    ('SORHA', 'Aleppo grass', 'en'),
    ('SORHA', 'Aleppo grass', 'en'),
    ('SORHA', 'Aleppo millet grass', 'en'),
    ('SORHA', 'Cuba grass', 'en'),
    ('SORHA', 'Cannarecchia', 'it'),
    ('SORHA', 'Sorghetta', 'it'),
    ('SORHA', 'Dente cavallino', 'it'),
    ('SORHA', 'Sorgo selvatico', 'it'),
    ('SORHA', 'Canestrello', 'it'),
    ('SORHA', 'Cannerecchia', 'it'),
    ('SORHA', 'Melgastro', 'it'),
    ('SORHA', 'Melghetta', 'it'),
    ('SORHA', 'Sagginella', 'it'),
    ('SORHA', 'Sorghetto', 'it'),
    ('SORHA', 'Sorgo d''Aleppo', 'it');

-- Names for host Cercidiphyllum japonicum
INSERT INTO plants_names(plant, name, language) VALUES
    ('CCPJA', 'Katsura', 'en'),
    ('CCPJA', 'Cercidifillo giapponese', 'it'),
    ('CCPJA', 'Katsura', 'it');

-- Names for host Platanus x hispanica
INSERT INTO plants_names(plant, name, language) VALUES
    ('PLTHY', 'London plane', 'en'),
    ('PLTHY', 'Platano comune', 'it'),
    ('PLTHY', 'Platano di Spagna', 'it'),
    ('PLTHY', 'Platano ibrido', 'it');

-- Names for host Desmos chinensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('DZSCH', 'Dwarf ylang-ylang', 'en');

-- Names for host Eremophila maculata
INSERT INTO plants_names(plant, name, language) VALUES
    ('EMHMA', 'Fuchsia-bush', 'en');

-- Names for host Nauclea orientalis
INSERT INTO plants_names(plant, name, language) VALUES
    ('NUCOR', 'Cheesewood', 'en'),
    ('NUCOR', 'Leichhardt pine', 'en'),
    ('NUCOR', 'Leichhardt tree', 'en');

-- Names for host Brassica oleracea
INSERT INTO plants_names(plant, name, language) VALUES
    ('BRSOX', 'Wild cabbage', 'en'),
    ('BRSOX', 'Cabbage', 'en'),
    ('BRSOX', 'Cavolo', 'it'),
    ('BRSOX', 'Cavolo comune', 'it');

-- Names for host Populus nigra
INSERT INTO plants_names(plant, name, language) VALUES
    ('POPNI', 'Black poplar', 'en'),
    ('POPNI', 'Pioppo nero', 'it');

-- Names for host Althaea officinalis
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALGOF', 'Marsh mallow', 'en'),
    ('ALGOF', 'Common marsh mallow', 'en'),
    ('ALGOF', 'Altea officinale', 'it'),
    ('ALGOF', 'Bismalva', 'it'),
    ('ALGOF', 'Malvavisco', 'it'),
    ('ALGOF', 'Malvacioni', 'it'),
    ('ALGOF', 'Altea comune', 'it'),
    ('ALGOF', 'Benefischi', 'it'),
    ('ALGOF', 'Buonvischio', 'it'),
    ('ALGOF', 'Malvavischio', 'it');

-- Names for host Syzygium samarangense
INSERT INTO plants_names(plant, name, language) VALUES
    ('SYZSA', 'Java apple', 'en'),
    ('SYZSA', 'Wax apple', 'en'),
    ('SYZSA', 'Jambu air', 'en');

-- Names for host Triadica sebifera
INSERT INTO plants_names(plant, name, language) VALUES
    ('SAQSE', 'Chinese tallow tree', 'en'),
    ('SAQSE', 'Vegetable tallow', 'en'),
    ('SAQSE', 'Albero del sapone', 'it');

-- Names for host Vitis ficifolia var. lobata
INSERT INTO plants_names(plant, name, language) VALUES
    ('VITFL', 'Thunberg''s grapevine', 'en');

-- Names for host Annona cherimola
INSERT INTO plants_names(plant, name, language) VALUES
    ('ANUCH', 'Cherimoya', 'en'),
    ('ANUCH', 'Custard apple', 'en'),
    ('ANUCH', 'Sweet apple', 'en'),
    ('ANUCH', 'Sugar apple', 'en'),
    ('ANUCH', 'Graveola', 'en'),
    ('ANUCH', 'Cerimoya', 'it'),
    ('ANUCH', 'Cerimolia', 'it');

-- Names for host Picea jezoensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIEJE', 'Yeddo spruce', 'en'),
    ('PIEJE', 'Picea de Yedo', 'it'),
    ('PIEJE', 'Abete di Yedo', 'it');

-- Names for host Corylus sieboldiana var. mandshurica
INSERT INTO plants_names(plant, name, language) VALUES
    ('CYLSM', 'Manchurian filbert', 'en');

-- Names for host Fagraea ceilanica
INSERT INTO plants_names(plant, name, language) VALUES
    ('FARCE', 'Ceylon fagraea', 'en');

-- Names for host Manihot esculenta
INSERT INTO plants_names(plant, name, language) VALUES
    ('MANES', 'Cassava', 'en'),
    ('MANES', 'Manioc', 'en'),
    ('MANES', 'Tapioca plant', 'en'),
    ('MANES', 'Tapioca', 'en'),
    ('MANES', 'Iucca', 'it'),
    ('MANES', 'Manioca', 'it');

-- Names for host Artemisia arborescens
INSERT INTO plants_names(plant, name, language) VALUES
    ('ARTAO', 'Tree wormwood', 'en'),
    ('ARTAO', 'Shrubby wormwood', 'en'),
    ('ARTAO', 'Assenzio arboreo', 'it'),
    ('ARTAO', 'Erva bianca', 'it'),
    ('ARTAO', 'Nascenzio', 'it'),
    ('ARTAO', 'Assenzio arbustivo', 'it');

-- Names for host Solanum quitoense
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLQU', 'Narangillo', 'en'),
    ('SOLQU', 'Naranjilla', 'en');

-- Names for host Citrus reticulata
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDRE', 'Mandarin', 'en'),
    ('CIDRE', 'Clementine tree', 'en'),
    ('CIDRE', 'Clementine', 'en'),
    ('CIDRE', 'Tangerine', 'en'),
    ('CIDRE', 'Mandarino', 'it'),
    ('CIDRE', 'Clementina', 'it'),
    ('CIDRE', 'Mandarino di Tangeri', 'it');

-- Names for host Cotoneaster dammeri
INSERT INTO plants_names(plant, name, language) VALUES
    ('CTTDA', 'Bearberry cotoneaster', 'en'),
    ('CTTDA', 'Cotognastro di Dammer', 'it');

-- Names for host Vitis labrusca
INSERT INTO plants_names(plant, name, language) VALUES
    ('VITLA', 'Fox grape', 'en'),
    ('VITLA', 'Slip-skin grape', 'en'),
    ('VITLA', 'American grape', 'en'),
    ('VITLA', 'Uva fragola', 'it'),
    ('VITLA', 'Vite americana', 'it');

-- Names for host Euphorbia chamaesyce
INSERT INTO plants_names(plant, name, language) VALUES
    ('EPHCH', 'Crenated spurge', 'en'),
    ('EPHCH', 'Ground-fig spurge', 'en'),
    ('EPHCH', 'Least spurge', 'en'),
    ('EPHCH', 'Erba pondina', 'it'),
    ('EPHCH', 'Euforbia fico per terra', 'it'),
    ('EPHCH', 'Ruforbia piccolo fico', 'it');

-- Names for host Platanus racemosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('PLTRA', 'California sycamore', 'en');

-- Names for host Alcea rosea
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALGRO', 'Hollyhock', 'en'),
    ('ALGRO', 'Rose mallow', 'en'),
    ('ALGRO', 'Garden hollyhock', 'en'),
    ('ALGRO', 'Malvarosa', 'it'),
    ('ALGRO', 'Alcea rossa', 'it'),
    ('ALGRO', 'Malvone', 'it'),
    ('ALGRO', 'Malvone roseo', 'it'),
    ('ALGRO', 'Rosone', 'it');

-- Names for host Solanum torvum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLTO', 'Terongan', 'en'),
    ('SOLTO', 'Turkeyberry', 'en'),
    ('SOLTO', 'Devil''s fig', 'en'),
    ('SOLTO', 'Gully bean', 'en'),
    ('SOLTO', 'Susumber', 'en');

-- Names for host Coronilla valentina subsp. glauca
INSERT INTO plants_names(plant, name, language) VALUES
    ('CZRVG', 'Coronilla glauca', 'it'),
    ('CZRVG', 'Cornetta di Valenza', 'it');

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

-- Names for host Rosa Cluster-flowered bush hybrids
INSERT INTO plants_names(plant, name, language) VALUES
    ('ROSXF', 'Floribunda roses', 'en');

-- Names for host Artocarpus heterophyllus
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABFHE', 'Jackfruit', 'en'),
    ('ABFHE', 'Jacktree', 'en'),
    ('ABFHE', 'Jack', 'it');

-- Names for host Poaceae
INSERT INTO plants_names(plant, name, language) VALUES
    ('1GRAF', 'Grasses', 'en');

-- Names for host Crataegus monogyna
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSCMO', 'Common hawthorn', 'en'),
    ('CSCMO', 'Whitethorn', 'en'),
    ('CSCMO', 'Single-seed hawthorn', 'en'),
    ('CSCMO', 'English hawthorn', 'en'),
    ('CSCMO', 'Hawthorn', 'en'),
    ('CSCMO', 'May', 'en'),
    ('CSCMO', 'Quickthorn', 'en'),
    ('CSCMO', 'Biancospino', 'it'),
    ('CSCMO', 'Azaruolo selvatico', 'it'),
    ('CSCMO', 'Biancospino comune', 'it'),
    ('CSCMO', 'Cratego monogino', 'it');

-- Names for host Pseudocydonia sinensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PDCSI', 'Chinese quince', 'en'),
    ('PDCSI', 'Cotogno cinese', 'it');

-- Names for host Cupaniopsis anacardioides
INSERT INTO plants_names(plant, name, language) VALUES
    ('CJQAN', 'Carrotwood', 'en'),
    ('CJQAN', 'Tuckeroo', 'en'),
    ('CJQAN', 'Beach tamarind', 'en'),
    ('CJQAN', 'Green-leaved tamarind', 'en');

-- Names for host Baccaurea racemosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('BCCRA', 'Menteng', 'en'),
    ('BCCRA', 'Kapundung', 'en');

-- Names for host Nicotiana quadrivalvis
INSERT INTO plants_names(plant, name, language) VALUES
    ('NIOBI', 'Indian tobacco', 'en');

-- Names for host Anacardium occidentale
INSERT INTO plants_names(plant, name, language) VALUES
    ('ANAOC', 'Cashew', 'en'),
    ('ANAOC', 'Cashew apple', 'en'),
    ('ANAOC', 'Cashew nut', 'en'),
    ('ANAOC', 'Anacardo', 'it'),
    ('ANAOC', 'Acajou', 'it');

-- Names for host Castanea seguinii
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSNSE', 'Séguin''s chestnut', 'en');

-- Names for host Diospyros mespiliformis
INSERT INTO plants_names(plant, name, language) VALUES
    ('DOSMF', 'Jackal berry', 'en'),
    ('DOSMF', 'West African ebony', 'en');

-- Names for host Acer platanoides
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRPL', 'Plane maple', 'en'),
    ('ACRPL', 'Norway maple', 'en'),
    ('ACRPL', 'Acero platano', 'it'),
    ('ACRPL', 'Amillacero', 'it'),
    ('ACRPL', 'Acero riccio', 'it'),
    ('ACRPL', 'Falso sicomoro', 'it'),
    ('ACRPL', 'Oppio riccio', 'it');

-- Names for host Solanum betaceum
INSERT INTO plants_names(plant, name, language) VALUES
    ('CYJBE', 'Tree tomato', 'en'),
    ('CYJBE', 'Pomodoro arboreo', 'it'),
    ('CYJBE', 'Solano bietolone', 'it');

-- Names for host Ananas comosus
INSERT INTO plants_names(plant, name, language) VALUES
    ('ANHCO', 'Pineapple', 'en'),
    ('ANHCO', 'Ananasso', 'it'),
    ('ANHCO', 'Pomo appio', 'it');

-- Names for host Euryops chrysanthemoides
INSERT INTO plants_names(plant, name, language) VALUES
    ('EYOCH', 'Daisy-bush', 'en');

-- Names for host Cordyla pinnata
INSERT INTO plants_names(plant, name, language) VALUES
    ('KDLPI', 'Bush mango', 'en');

-- Names for host Solanum erianthum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLER', 'Woody nightshade', 'en'),
    ('SOLER', 'Wild tobacco tree', 'en'),
    ('SOLER', 'Mullein nightshade', 'en'),
    ('SOLER', 'Potato tree', 'en'),
    ('SOLER', 'Velvet nightshade', 'en');

-- Names for host Dasiphora fruticosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('PTLFR', 'Bush cinquefoil', 'en'),
    ('PTLFR', 'Golden hardhack', 'en'),
    ('PTLFR', 'Shrubby cinquefoil', 'en'),
    ('PTLFR', 'Cinquefoglie cespugliosa', 'it'),
    ('PTLFR', 'Potentilla cespugliosa', 'it');

-- Names for host Aphananthe philippinensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('APTPH', 'Grey handlewood', 'en'),
    ('APTPH', 'Native elm', 'en');

-- Names for host Prunus x yedoensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNYE', 'Yoshino cherry', 'en'),
    ('PRNYE', 'Japanese flowering cherry', 'en'),
    ('PRNYE', 'Potomac cherry', 'en'),
    ('PRNYE', 'Tokyo cherry', 'en');

-- Names for host Garcinia dulcis
INSERT INTO plants_names(plant, name, language) VALUES
    ('GANDU', 'Baniti', 'en'),
    ('GANDU', 'Mundu', 'en'),
    ('GANDU', 'Rata', 'en'),
    ('GANDU', 'Gourka', 'en'),
    ('GANDU', 'Yellow mangosteen', 'en');

-- Names for host Ximenia americana
INSERT INTO plants_names(plant, name, language) VALUES
    ('XIMAM', 'Hog plum', 'en'),
    ('XIMAM', 'Tallow-wood plum', 'en'),
    ('XIMAM', 'Yellow plum', 'en'),
    ('XIMAM', 'Sea lemon', 'en'),
    ('XIMAM', 'Blue sourplum', 'en');

-- Names for host Coronilla valentina
INSERT INTO plants_names(plant, name, language) VALUES
    ('CZRVL', 'Shrubby scorpion vetch', 'en'),
    ('CZRVL', 'Coronilla valentina', 'it'),
    ('CZRVL', 'Cornetta di Valenza', 'it');

-- Names for host Pinus brutia
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUBR', 'Brutia pine', 'en'),
    ('PIUBR', 'Calabrian pine', 'en'),
    ('PIUBR', 'Cyprus pine', 'en'),
    ('PIUBR', 'Turkish pine', 'en'),
    ('PIUBR', 'Pino calabrese', 'it'),
    ('PIUBR', 'Pino bruzio', 'it');

-- Names for host Cistus albidus
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSTAL', 'Grey-leaved cistus', 'en'),
    ('CSTAL', 'Rock rose', 'en'),
    ('CSTAL', 'White dart', 'en'),
    ('CSTAL', 'Cisto a fiori bianchi', 'it'),
    ('CSTAL', 'Cisto a foglie sessili', 'it'),
    ('CSTAL', 'Musseghe', 'it'),
    ('CSTAL', 'Nasca', 'it');

-- Names for host Hypericum japonicum
INSERT INTO plants_names(plant, name, language) VALUES
    ('HYPJA', 'Matted St John''s-wort', 'en'),
    ('HYPJA', 'Swamp hypericum', 'en'),
    ('HYPJA', 'Japanese St John''s-wort', 'en');

-- Names for host Quercus alba
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUEAL', 'White oak', 'en'),
    ('QUEAL', 'Eastern white oak', 'en'),
    ('QUEAL', 'Quercia bianca d''America', 'it');

-- Names for host Castanea pumila
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSNPU', 'Allegheny chinquapin', 'en'),
    ('CSNPU', 'American chinquapin', 'en'),
    ('CSNPU', 'Chinkapin', 'en'),
    ('CSNPU', 'Chinquapin', 'en'),
    ('CSNPU', 'Dwarf chestnut', 'en'),
    ('CSNPU', 'Trailing chinquapin', 'en'),
    ('CSNPU', 'Castagno nano', 'it');

-- Names for host Barringtonia edulis
INSERT INTO plants_names(plant, name, language) VALUES
    ('BGTED', 'Cutnut', 'en');

-- Names for host Abies sachalinensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABISA', 'Hokkaido pine', 'en'),
    ('ABISA', 'Sakhalin fir', 'en'),
    ('ABISA', 'Abete di Sachalin', 'it');

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

-- Names for host Sorbus americana
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOUAM', 'Missey-moosey', 'en'),
    ('SOUAM', 'American mountain ash', 'en'),
    ('SOUAM', 'Sorbo americano', 'it');

-- Names for host Bouea macrophylla
INSERT INTO plants_names(plant, name, language) VALUES
    ('BUWGA', 'Gandaria', 'en');

-- Names for host Cotoneaster bullatus
INSERT INTO plants_names(plant, name, language) VALUES
    ('CTTBU', 'Holly-berry cotoneaster', 'en'),
    ('CTTBU', 'Hollyberry cotoneaster', 'en'),
    ('CTTBU', 'Cotognastro bolloso', 'it');

-- Names for host Allium fistulosum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ALLFI', 'Stone leek', 'en'),
    ('ALLFI', 'Welsh onion', 'en'),
    ('ALLFI', 'Japanese bunching onion', 'en'),
    ('ALLFI', 'Green onion', 'en'),
    ('ALLFI', 'Cipolleta', 'it'),
    ('ALLFI', 'Cipolla d''inverno', 'it');

-- Names for host Ulmus procera
INSERT INTO plants_names(plant, name, language) VALUES
    ('ULMPR', 'Hedgerow elm', 'en'),
    ('ULMPR', 'English elm', 'en'),
    ('ULMPR', 'Louis van Houtte golden elm', 'en'),
    ('ULMPR', 'English cork elm', 'en'),
    ('ULMPR', 'Olmo inglese', 'it');

-- Names for host Solanum americanum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLAM', 'American black nightshade', 'en'),
    ('SOLAM', 'Eastern black nightshade', 'en'),
    ('SOLAM', 'Common nightshade', 'en'),
    ('SOLAM', 'Glossy nightshade', 'en'),
    ('SOLAM', 'West Indian nightshade', 'en');

-- Names for host Passiflora suberosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('PAQSU', 'Corky-stemmed passionflower', 'en'),
    ('PAQSU', 'Corky passionflower', 'en'),
    ('PAQSU', 'Cork-bark passionflower', 'en'),
    ('PAQSU', 'Corkstem passionflower', 'en'),
    ('PAQSU', 'Devil''s pumpkin', 'en'),
    ('PAQSU', 'Indigo berry', 'en');

-- Names for host Morus nigra
INSERT INTO plants_names(plant, name, language) VALUES
    ('MORNI', 'Black mulberry', 'en'),
    ('MORNI', 'Common mulberry', 'en'),
    ('MORNI', 'Gelso nero', 'it'),
    ('MORNI', 'Moro nero', 'it');

-- Names for host Rubus ulmifolius
INSERT INTO plants_names(plant, name, language) VALUES
    ('RUBUL', 'Burbank''s thornless blackberry', 'en'),
    ('RUBUL', 'Common bramble', 'en'),
    ('RUBUL', 'Rovo di macchia', 'it'),
    ('RUBUL', 'Rovo comune', 'it');

-- Names for host Citrus x latifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDLA', 'Tahiti lime', 'en'),
    ('CIDLA', 'Persian lime', 'en');

-- Names for host Cucurbita moschata
INSERT INTO plants_names(plant, name, language) VALUES
    ('CUUMO', 'Musky gourd', 'en'),
    ('CUUMO', 'Cushaw', 'en'),
    ('CUUMO', 'Canada crookneck', 'en'),
    ('CUUMO', 'Zucca moscata', 'it'),
    ('CUUMO', 'Cetriolo muschiato', 'it'),
    ('CUUMO', 'Zucca torta', 'it'),
    ('CUUMO', 'Zucchettino indiana', 'it');

-- Names for host Crinum asiaticum
INSERT INTO plants_names(plant, name, language) VALUES
    ('KRMAS', 'Giant crinum', 'en'),
    ('KRMAS', 'Poison bulb', 'en'),
    ('KRMAS', 'Crinum lily', 'en'),
    ('KRMAS', 'Poison lily', 'en'),
    ('KRMAS', 'Seashore lily', 'en'),
    ('KRMAS', 'Spider lily', 'en'),
    ('KRMAS', 'Swamp lily', 'en');

-- Names for host Melia azedarach
INSERT INTO plants_names(plant, name, language) VALUES
    ('MEIAZ', 'Umbrella tree', 'en'),
    ('MEIAZ', 'China berry', 'en'),
    ('MEIAZ', 'Persian lilac', 'en'),
    ('MEIAZ', 'Bead tree', 'en'),
    ('MEIAZ', 'Chinaberry tree', 'en'),
    ('MEIAZ', 'Indian lilac', 'en'),
    ('MEIAZ', 'Pride of India', 'en'),
    ('MEIAZ', 'Seringa', 'en'),
    ('MEIAZ', 'Seringa', 'en'),
    ('MEIAZ', 'Texas umbrella tree', 'en'),
    ('MEIAZ', 'White cedar', 'en'),
    ('MEIAZ', 'Albero dei paternostri', 'it'),
    ('MEIAZ', 'Albero della pazienza', 'it'),
    ('MEIAZ', 'Albero da rosari', 'it'),
    ('MEIAZ', 'Perlaro', 'it'),
    ('MEIAZ', 'Sicomoro falso', 'it');

-- Names for host Ulex europaeus
INSERT INTO plants_names(plant, name, language) VALUES
    ('ULEEU', 'Furze', 'en'),
    ('ULEEU', 'Gorse', 'en'),
    ('ULEEU', 'Whin', 'en'),
    ('ULEEU', 'Corse', 'en'),
    ('ULEEU', 'Common furze', 'en'),
    ('ULEEU', 'Common gorse', 'en'),
    ('ULEEU', 'Common whin', 'en'),
    ('ULEEU', 'Ginestra spinosa', 'it'),
    ('ULEEU', 'Ginestrone', 'it');

-- Names for host Mitrephora maingayi
INSERT INTO plants_names(plant, name, language) VALUES
    ('MZTMA', 'Maingay mitrephora', 'en');

-- Names for host Eleusine coracana
INSERT INTO plants_names(plant, name, language) VALUES
    ('ELECO', 'Rapoko grass', 'en'),
    ('ELECO', 'African finger millet', 'en'),
    ('ELECO', 'Indian millet', 'en'),
    ('ELECO', 'Finger millet', 'en'),
    ('ELECO', 'Panico indiano', 'it');

-- Names for host Vitis vinifera subsp. sylvestris
INSERT INTO plants_names(plant, name, language) VALUES
    ('VITVS', 'European woodland grapevine', 'en'),
    ('VITVS', 'Vite selvatica', 'it'),
    ('VITVS', 'Ambrostuna', 'it'),
    ('VITVS', 'Lambusca', 'it'),
    ('VITVS', 'Zampino', 'it');

-- Names for host Passiflora quadrangularis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PAQQU', 'Barbadine', 'en'),
    ('PAQQU', 'Giant granadilla', 'en'),
    ('PAQQU', 'Giant passion flower', 'en'),
    ('PAQQU', 'Passiflora grande', 'it');

-- Names for host Solanum scabrum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLSC', 'Garden huckleberry', 'en');

-- Names for host Arenga engleri
INSERT INTO plants_names(plant, name, language) VALUES
    ('AGBEN', 'Dwarf sugar palm', 'en'),
    ('AGBEN', 'Formosa palm', 'en'),
    ('AGBEN', 'Taiwan arenga palm', 'en');

-- Names for host Trifolium pratense
INSERT INTO plants_names(plant, name, language) VALUES
    ('TRFPR', 'Purple clover', 'en'),
    ('TRFPR', 'Red clover', 'en'),
    ('TRFPR', 'Trifoglio pratense', 'it'),
    ('TRFPR', 'Trifoglio rosso', 'it'),
    ('TRFPR', 'Trifoglio violetto', 'it'),
    ('TRFPR', 'Trifoglioi dei prati', 'it');

-- Names for host Betula pendula
INSERT INTO plants_names(plant, name, language) VALUES
    ('BETPE', 'Silver birch', 'en'),
    ('BETPE', 'European white birch', 'en'),
    ('BETPE', 'Clump  birch', 'en'),
    ('BETPE', 'Common birch', 'en'),
    ('BETPE', 'Betulla bianca', 'it'),
    ('BETPE', 'Betulla glabra', 'it'),
    ('BETPE', 'Barancio', 'it'),
    ('BETPE', 'Betulla commune', 'it'),
    ('BETPE', 'Betulla pendente', 'it'),
    ('BETPE', 'Betulla verrucosa', 'it');

-- Names for host Eugenia dombeyi
INSERT INTO plants_names(plant, name, language) VALUES
    ('EUEDO', 'Grumichama', 'en'),
    ('EUEDO', 'Brazil cherry', 'en');

-- Names for host Lolium perenne
INSERT INTO plants_names(plant, name, language) VALUES
    ('LOLPE', 'Perennial ryegrass', 'en'),
    ('LOLPE', 'English ryegrass', 'en'),
    ('LOLPE', 'Loglio inglese', 'it'),
    ('LOLPE', 'Loietto inglese', 'it'),
    ('LOLPE', 'Loglierella', 'it'),
    ('LOLPE', 'Loglio comune', 'it'),
    ('LOLPE', 'Loiessa', 'it');

-- Names for host Sandoricum koetjape
INSERT INTO plants_names(plant, name, language) VALUES
    ('SNOKO', 'Santol', 'en'),
    ('SNOKO', 'Sentul', 'en'),
    ('SNOKO', 'Sandal', 'en');

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

-- Names for host Castanea henryi
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSNHE', 'Henry''s chestnut', 'en');

-- Names for host Dysoxylum parasiticum
INSERT INTO plants_names(plant, name, language) VALUES
    ('DYXPA', 'Yellow mahogany', 'en');

-- Names for host Physalis minima
INSERT INTO plants_names(plant, name, language) VALUES
    ('PHYMI', 'Sunberry', 'en');

-- Names for host Solanum nigrum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLNI', 'Black nightshade', 'en'),
    ('SOLNI', 'Common nightshade', 'en'),
    ('SOLNI', 'Sunberry', 'en'),
    ('SOLNI', 'Wonderberry', 'en'),
    ('SOLNI', 'Hound berry', 'en'),
    ('SOLNI', 'Erba morella', 'it'),
    ('SOLNI', 'Morella minore', 'it'),
    ('SOLNI', 'Solano nero', 'it'),
    ('SOLNI', 'Morella comune', 'it'),
    ('SOLNI', 'Ballerina', 'it'),
    ('SOLNI', 'Pomidorella', 'it');

-- Names for host Ziziphus jujuba
INSERT INTO plants_names(plant, name, language) VALUES
    ('ZIPJU', 'Chinese date', 'en'),
    ('ZIPJU', 'Chinese jujube', 'en'),
    ('ZIPJU', 'Common jujube', 'en'),
    ('ZIPJU', 'Indian jujube', 'en'),
    ('ZIPJU', 'Indian plum', 'en'),
    ('ZIPJU', 'Jujube tree', 'en'),
    ('ZIPJU', 'Jujube', 'it'),
    ('ZIPJU', 'Giuggiolo', 'it'),
    ('ZIPJU', 'Sisifo', 'it'),
    ('ZIPJU', 'Giuggiolo comune', 'it'),
    ('ZIPJU', 'Ziggolo', 'it');

-- Names for host Myoporum insulare
INSERT INTO plants_names(plant, name, language) VALUES
    ('MYMIN', 'Common boobialla', 'en'),
    ('MYMIN', 'Boobialla', 'en'),
    ('MYMIN', 'Native juniper', 'en'),
    ('MYMIN', 'Blueberry tree', 'en');

-- Names for host Pinus pinea
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUPN', 'Stone pine', 'en'),
    ('PIUPN', 'Umbrella pine', 'en'),
    ('PIUPN', 'Italian stone pine', 'en'),
    ('PIUPN', 'Pino domestico', 'it'),
    ('PIUPN', 'Pino da pignoli', 'it'),
    ('PIUPN', 'Italienische Steinkiefer', 'it'),
    ('PIUPN', 'Pino d''Italia', 'it');

-- Names for host Lolium multiflorum
INSERT INTO plants_names(plant, name, language) VALUES
    ('LOLMU', 'Bearded ryegrass', 'en'),
    ('LOLMU', 'Italian ryegrass', 'en'),
    ('LOLMU', 'Loglio italico', 'it'),
    ('LOLMU', 'Loietto italico', 'it'),
    ('LOLMU', 'Loglio maggiore', 'it'),
    ('LOLMU', 'Loiessa', 'it'),
    ('LOLMU', 'Loglietto', 'it');

-- Names for host Brunfelsia lactea
INSERT INTO plants_names(plant, name, language) VALUES
    ('BRFLA', 'Lady of the night', 'en'),
    ('BRFLA', 'Princess of the night', 'en');

-- Names for host Fortunella margarita
INSERT INTO plants_names(plant, name, language) VALUES
    ('FOLMA', 'Nagami cumquat', 'en'),
    ('FOLMA', 'Nagami kumquat', 'en'),
    ('FOLMA', 'Oval kumquat', 'en'),
    ('FOLMA', 'Kumquat a frutto ovale', 'it');

-- Names for host Rhodocactus grandifolius
INSERT INTO plants_names(plant, name, language) VALUES
    ('PKIGR', 'Rose cactus', 'en'),
    ('PKIGR', 'Large-leaved Barbados gooseberry', 'en'),
    ('PKIGR', 'Wax rose', 'en');

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

-- Names for host Quercus virginiana
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUEVI', 'Live oak', 'en'),
    ('QUEVI', 'Southern live oak', 'en'),
    ('QUEVI', 'Quercia della Virginia', 'it');

-- Names for host Luffa aegyptiaca
INSERT INTO plants_names(plant, name, language) VALUES
    ('LUFAE', 'Loofah', 'en'),
    ('LUFAE', 'Sponge cucumber', 'en'),
    ('LUFAE', 'Sponge gourd', 'en'),
    ('LUFAE', 'Vegetable sponge', 'en');

-- Names for host Pouteria viridis
INSERT INTO plants_names(plant, name, language) VALUES
    ('POJVI', 'Green sapote', 'en');

-- Names for host Eriobotrya japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('EIOJA', 'Loquat', 'en'),
    ('EIOJA', 'Japanese medlar', 'en'),
    ('EIOJA', 'Nespolo del Giappone', 'it');

-- Names for host Aralia cordata
INSERT INTO plants_names(plant, name, language) VALUES
    ('ARLCO', 'Japanese spikenard', 'en'),
    ('ARLCO', 'Mountain asparagus', 'en');

-- Names for host Strelitzia reginae
INSERT INTO plants_names(plant, name, language) VALUES
    ('STZRE', 'Queen''s bird-of-paradise', 'en'),
    ('STZRE', 'Bird of paradise', 'en'),
    ('STZRE', 'Crane flower', 'en');

-- Names for host Camellia sasanqua
INSERT INTO plants_names(plant, name, language) VALUES
    ('CAHSQ', 'Sasanqua camellia', 'en'),
    ('CAHSQ', 'Christmas camellia', 'en'),
    ('CAHSQ', 'Camelia sasanqua', 'it'),
    ('CAHSQ', 'Camelia di Natale', 'it');

-- Names for host Nauclea latifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('NUCLA', 'Pincushion tree', 'en'),
    ('NUCLA', 'Negro peach', 'en');

-- Names for host Juglans hindsii
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGHI', 'Californian black walnut', 'en'),
    ('IUGHI', 'Hinds''s black walnut', 'en'),
    ('IUGHI', 'Northern California walnut', 'en');

-- Names for host Parkia speciosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRKSP', 'Nitta tree', 'en'),
    ('PRKSP', 'Pete bean', 'en'),
    ('PRKSP', 'Stink bean', 'en');

-- Names for host Setaria palmifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('SETPA', 'Broad-leaved bristlegrass', 'en'),
    ('SETPA', 'Malayan palmgrass', 'en'),
    ('SETPA', 'Palmgrass', 'en');

-- Names for host Populus nigra var. italica
INSERT INTO plants_names(plant, name, language) VALUES
    ('POPNT', 'Lombardy poplar', 'en'),
    ('POPNT', 'Pioppo italiano', 'it'),
    ('POPNT', 'Pioppo cipressino', 'it'),
    ('POPNT', 'Pioppo d''Italia', 'it');

-- Names for host Camellia japonica subsp. rusticana
INSERT INTO plants_names(plant, name, language) VALUES
    ('CAHRU', 'Snow camellia', 'en');

-- Names for host Diplocyclos palmatus
INSERT INTO plants_names(plant, name, language) VALUES
    ('DPYPA', 'Native bryony', 'en');

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

-- Names for host Terminalia catappa
INSERT INTO plants_names(plant, name, language) VALUES
    ('TEMCA', 'Malabar almond', 'en'),
    ('TEMCA', 'Myrobolan', 'en'),
    ('TEMCA', 'Olive-bark tree', 'en'),
    ('TEMCA', 'Tropical almond', 'en'),
    ('TEMCA', 'Barbados almond', 'en'),
    ('TEMCA', 'Bengal almond', 'en'),
    ('TEMCA', 'False kamani', 'en'),
    ('TEMCA', 'Indian almond', 'en'),
    ('TEMCA', 'Pacific almond', 'en'),
    ('TEMCA', 'Sea almond', 'en'),
    ('TEMCA', 'West Indian almond', 'en'),
    ('TEMCA', 'Badam', 'it');

-- Names for host Spondias purpurea
INSERT INTO plants_names(plant, name, language) VALUES
    ('SPXPU', 'Red mombin', 'en'),
    ('SPXPU', 'Purple mombin', 'en'),
    ('SPXPU', 'Spanish plum tree', 'en');

-- Names for host Carissa carandas
INSERT INTO plants_names(plant, name, language) VALUES
    ('CISCA', 'Caranda (plum)', 'en'),
    ('CISCA', 'Karanda', 'en'),
    ('CISCA', 'Kerenda', 'en');

-- Names for host Quercus glauca
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUEGU', 'Ring-cupped oak', 'en'),
    ('QUEGU', 'Japanese blue oak', 'en');

-- Names for host Salix viminalis
INSERT INTO plants_names(plant, name, language) VALUES
    ('SAXVI', 'Osier willow', 'en'),
    ('SAXVI', 'Twiggy willow', 'en'),
    ('SAXVI', 'Osier', 'en'),
    ('SAXVI', 'Basket willow', 'en'),
    ('SAXVI', 'Common osier', 'en'),
    ('SAXVI', 'French osier', 'en'),
    ('SAXVI', 'Salice viminale', 'it'),
    ('SAXVI', 'Brillo', 'it'),
    ('SAXVI', 'Vinco', 'it'),
    ('SAXVI', 'Salice da vimini', 'it'),
    ('SAXVI', 'Vetrice', 'it'),
    ('SAXVI', 'Vimine', 'it');

-- Names for host Salix integra
INSERT INTO plants_names(plant, name, language) VALUES
    ('SAXIG', 'Dappled willow', 'en'),
    ('SAXIG', 'Variegated willow', 'en'),
    ('SAXIG', 'Blooming willow', 'en');

-- Names for host Rubus idaeus
INSERT INTO plants_names(plant, name, language) VALUES
    ('RUBID', 'Red raspberry', 'en'),
    ('RUBID', 'Raspberry', 'en'),
    ('RUBID', 'European red raspberry', 'en'),
    ('RUBID', 'Wild raspberry', 'en'),
    ('RUBID', 'Lampone', 'it'),
    ('RUBID', 'Rovo ideo', 'it'),
    ('RUBID', 'Frambos', 'it');

-- Names for host Physalis peruviana
INSERT INTO plants_names(plant, name, language) VALUES
    ('PHYPE', 'Brazil cherry', 'en'),
    ('PHYPE', 'Common cape gooseberry', 'en'),
    ('PHYPE', 'Peruvian groundcherry', 'en'),
    ('PHYPE', 'African groundcherry', 'en'),
    ('PHYPE', 'Aztec berry', 'en'),
    ('PHYPE', 'Cape gooseberry', 'en'),
    ('PHYPE', 'Giant groundcherry', 'en'),
    ('PHYPE', 'Goldenberry', 'en'),
    ('PHYPE', 'Inca berry', 'en'),
    ('PHYPE', 'Peruvian cherry', 'en'),
    ('PHYPE', 'Physalis', 'en'),
    ('PHYPE', 'Poha berry', 'en'),
    ('PHYPE', 'Alchechengio giallo', 'it'),
    ('PHYPE', 'Alchechengi del Perù', 'it');

-- Names for host Liquidambar formosana
INSERT INTO plants_names(plant, name, language) VALUES
    ('LIQFO', 'Chinese sweet gum', 'en'),
    ('LIQFO', 'Formosa amber', 'en'),
    ('LIQFO', 'Storax', 'en'),
    ('LIQFO', 'Formosan gum', 'en'),
    ('LIQFO', 'Liquidambar di Formosa', 'it');

-- Names for host Acer buergerianum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRBU', 'Trident maple', 'en'),
    ('ACRBU', 'Acero di Bürger', 'it'),
    ('ACRBU', 'Acero tridente', 'it');

-- Names for host Dracaena steudneri
INSERT INTO plants_names(plant, name, language) VALUES
    ('DRNST', 'Northern large-leaved dragontree', 'en');

-- Names for host Canarium album
INSERT INTO plants_names(plant, name, language) VALUES
    ('CNBAL', 'Chinese white olive', 'en'),
    ('CNBAL', 'Chinese olive tree', 'en');

-- Names for host Pterocarya stenoptera
INSERT INTO plants_names(plant, name, language) VALUES
    ('PTFST', 'Chinese wingnut', 'en'),
    ('PTFST', 'Pterocaria della Cina', 'it');

-- Names for host Acer pensylvanicum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRPE', 'Moose-bark maple', 'en'),
    ('ACRPE', 'Striped maple', 'en'),
    ('ACRPE', 'Moose wood', 'en'),
    ('ACRPE', 'Acero screziato', 'it');

-- Names for host Toxicodendron pubescens
INSERT INTO plants_names(plant, name, language) VALUES
    ('TOXQU', 'Poison oak', 'en'),
    ('TOXQU', 'Atlantic poison oak', 'en'),
    ('TOXQU', 'Sommacco tossico', 'it');

-- Names for host Spondias mombin
INSERT INTO plants_names(plant, name, language) VALUES
    ('SPXMO', 'Hog-plum tree', 'en'),
    ('SPXMO', 'Yellow mombin', 'en'),
    ('SPXMO', 'Golden apple', 'en');

-- Names for host Amelanchier alnifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('AMEAL', 'Alder-leaf serviceberry', 'en'),
    ('AMEAL', 'Serviceberry', 'en'),
    ('AMEAL', 'Pacific serviceberry', 'en'),
    ('AMEAL', 'Saskatoon serviceberry', 'en');

-- Names for host Annona squamosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('ANUSQ', 'Sweetsop', 'en'),
    ('ANUSQ', 'Cuban sugar apple', 'en'),
    ('ANUSQ', 'Sugar apple', 'en'),
    ('ANUSQ', 'Cachiman', 'en'),
    ('ANUSQ', 'Custard apple', 'en'),
    ('ANUSQ', 'Pomo canella', 'it'),
    ('ANUSQ', 'Mela canella', 'it'),
    ('ANUSQ', 'Anona scaliosa', 'it');

-- Names for host Flacourtia rukam
INSERT INTO plants_names(plant, name, language) VALUES
    ('FLCRU', 'Rukam', 'en');

-- Names for host Heliotropium europaeum
INSERT INTO plants_names(plant, name, language) VALUES
    ('HEOEU', 'Caterpillar weed', 'en'),
    ('HEOEU', 'Common heliotrope', 'en'),
    ('HEOEU', 'European turnsole', 'en'),
    ('HEOEU', 'European heliotrope', 'en'),
    ('HEOEU', 'Heliotrope', 'en'),
    ('HEOEU', 'Eliotropio comune', 'it'),
    ('HEOEU', 'Erba porraia', 'it'),
    ('HEOEU', 'Eliotropio europeo', 'it'),
    ('HEOEU', 'Eliotropio selvatico', 'it'),
    ('HEOEU', 'Veniglia selvatica', 'it');

-- Names for host Quercus acutissima
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUEAS', 'Sawtooth oak', 'en'),
    ('QUEAS', 'Japanese chestnut oak', 'en'),
    ('QUEAS', 'Quercia del Giappone a foglie di castagno', 'it');

-- Names for host Annona reticulata
INSERT INTO plants_names(plant, name, language) VALUES
    ('ANURE', 'Custard apple', 'en'),
    ('ANURE', 'Bullock''s heart', 'en'),
    ('ANURE', 'Common cachiman', 'en'),
    ('ANURE', 'Corazon', 'en'),
    ('ANURE', 'Annona cuore di bue', 'it'),
    ('ANURE', 'Annona reticolata', 'it');

-- Names for host Xylosma congesta
INSERT INTO plants_names(plant, name, language) VALUES
    ('XYOCO', 'Dense logwood', 'en'),
    ('XYOCO', 'Shiny xylosma', 'en');

-- Names for host Betula platyphylla
INSERT INTO plants_names(plant, name, language) VALUES
    ('BETPL', 'Manchurian birch', 'en'),
    ('BETPL', 'Betulla di Manciuria', 'it');

-- Names for host Selenicereus undatus
INSERT INTO plants_names(plant, name, language) VALUES
    ('HCRUN', 'Night-blooming cereus', 'en'),
    ('HCRUN', 'Strawberry-pear', 'en'),
    ('HCRUN', 'Dragon fruit', 'en'),
    ('HCRUN', 'Pitaya', 'en');

-- Names for host Allocasuarina verticillata
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSUST', 'Coast she-oak', 'en'),
    ('CSUST', 'Coast beefwood', 'en'),
    ('CSUST', 'Coast swamp oak', 'en'),
    ('CSUST', 'Drooping she-oak', 'en');

-- Names for host Prunus persica
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNPS', 'Peach', 'en'),
    ('PRNPS', 'Pesco', 'it'),
    ('PRNPS', 'Percoche', 'it');

-- Names for host Diospyros maritima
INSERT INTO plants_names(plant, name, language) VALUES
    ('DOSMR', 'Borad-leaved ebony', 'en'),
    ('DOSMR', 'Malaysian persimmon', 'en');

-- Names for host Parkia biglobosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRKAF', 'Fern-leaved nitta', 'en'),
    ('PRKAF', 'African locust bean', 'en');

-- Names for host Helianthus annuus
INSERT INTO plants_names(plant, name, language) VALUES
    ('HELAN', 'Common sunflower', 'en'),
    ('HELAN', 'Sunflower', 'en'),
    ('HELAN', 'Girasole', 'it'),
    ('HELAN', 'Girasole comune', 'it');

-- Names for host Muntingia calabura
INSERT INTO plants_names(plant, name, language) VALUES
    ('MUNCA', 'Calabura', 'en'),
    ('MUNCA', 'Capulin', 'en'),
    ('MUNCA', 'Panama berry', 'en'),
    ('MUNCA', 'Jamaican cherry', 'en'),
    ('MUNCA', 'Jam tree', 'en'),
    ('MUNCA', 'Strawberry tree', 'en');

-- Names for host Kerria japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('KERJA', 'Japanese kerria', 'en'),
    ('KERJA', 'Kerria', 'en'),
    ('KERJA', 'Kerria del Giappone', 'it'),
    ('KERJA', 'Kerria', 'it');

-- Names for host Picea orientalis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIEOR', 'Oriental spruce', 'en'),
    ('PIEOR', 'Caucasian spruce', 'en'),
    ('PIEOR', 'Abete rosso d''Oriente', 'it'),
    ('PIEOR', 'Picea orientale', 'it');

-- Names for host Vigna mungo
INSERT INTO plants_names(plant, name, language) VALUES
    ('PHSMU', 'Black gram', 'en'),
    ('PHSMU', 'Urd bean', 'en'),
    ('PHSMU', 'Fagiolo urd', 'it');

-- Names for host Crataegus laevigata
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSCOX', 'Midland hawthorn', 'en'),
    ('CSCOX', 'English hawthorn', 'en'),
    ('CSCOX', 'May', 'en'),
    ('CSCOX', 'Midland hawthorn', 'en'),
    ('CSCOX', 'Whitethorn', 'en'),
    ('CSCOX', 'Biancospino', 'it'),
    ('CSCOX', 'Azarolo selvatico', 'it'),
    ('CSCOX', 'Biancospino selvatico', 'it');

-- Names for host Citrus maxima
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDGR', 'Pummelo', 'en'),
    ('CIDGR', 'Shaddock', 'en'),
    ('CIDGR', 'Bali lemon', 'en'),
    ('CIDGR', 'Pompelmo', 'it');

-- Names for host Landolphia heudelotii
INSERT INTO plants_names(plant, name, language) VALUES
    ('LADHE', 'Landolphia rubber-vine', 'en');

-- Names for host Persea americana
INSERT INTO plants_names(plant, name, language) VALUES
    ('PEBAM', 'Alligator pear', 'en'),
    ('PEBAM', 'Avocado', 'en'),
    ('PEBAM', 'Avocado pear', 'en'),
    ('PEBAM', 'Holly ghost pear', 'en'),
    ('PEBAM', 'Avocado', 'it');

-- Names for host Juglans ailanthifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGAI', 'Japanese walnut', 'en'),
    ('IUGAI', 'Noce del Giappone', 'it');

-- Names for host Cercis siliquastrum
INSERT INTO plants_names(plant, name, language) VALUES
    ('CCSSI', 'Common Judas tree', 'en'),
    ('CCSSI', 'Judas tree', 'en'),
    ('CCSSI', 'Siliquastro', 'it'),
    ('CCSSI', 'Albero di Giuda comune', 'it'),
    ('CCSSI', 'Albero di Giuda', 'it');

-- Names for host Diospyros nigra
INSERT INTO plants_names(plant, name, language) VALUES
    ('DOSDI', 'Black sapote', 'en'),
    ('DOSDI', 'Chocolate pudding fruit', 'en'),
    ('DOSDI', 'Sapote nero', 'it');

-- Names for host Cryptomeria japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('CMYJA', 'Sugi', 'en'),
    ('CMYJA', 'Japanese red cedar', 'en'),
    ('CMYJA', 'Japanese cedar', 'en'),
    ('CMYJA', 'Crittomeria del Giappone', 'it'),
    ('CMYJA', 'Criptomeria del Giappone', 'it');

-- Names for host Anthyllis hermanniae
INSERT INTO plants_names(plant, name, language) VALUES
    ('AYLHE', 'Vulneraria spinosa', 'it'),
    ('AYLHE', 'Antillide spinosa', 'it'),
    ('AYLHE', 'Antilide spinosa', 'it'),
    ('AYLHE', 'Spina pollice', 'it');

-- Names for host Phyllanthus acidus
INSERT INTO plants_names(plant, name, language) VALUES
    ('PYLAC', 'Indian gooseberry', 'en'),
    ('PYLAC', 'Otaheite gooseberry', 'en'),
    ('PYLAC', 'Gooseberry tree', 'en'),
    ('PYLAC', 'Malay gooseberry', 'en');

-- Names for host Momordica cochinchinensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('MOMCO', 'Spiny bitter cucumber', 'en'),
    ('MOMCO', 'Carilla fruit', 'en');

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

-- Names for host Abies holophylla
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABIHL', 'Manchurian fir', 'en'),
    ('ABIHL', 'Abete di Manciuria', 'it');

-- Names for host Quercus variabilis
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUEVB', 'Oriental cork oak', 'en'),
    ('QUEVB', 'Chinese cork oak', 'en'),
    ('QUEVB', 'Quercia da sughero della Cina', 'it');

-- Names for host Colocasia esculenta
INSERT INTO plants_names(plant, name, language) VALUES
    ('CXSES', 'Taro', 'en'),
    ('CXSES', 'Dasheen', 'en'),
    ('CXSES', 'Cocoyam', 'en'),
    ('CXSES', 'Wild taro', 'en'),
    ('CXSES', 'Chinese potato', 'en'),
    ('CXSES', 'Eddoe', 'en'),
    ('CXSES', 'Egyptian colocasia', 'en'),
    ('CXSES', 'Elephant''s-ear', 'en'),
    ('CXSES', 'Kalo', 'en'),
    ('CXSES', 'Yam', 'en'),
    ('CXSES', 'Taro', 'it'),
    ('CXSES', 'Colocasia', 'it'),
    ('CXSES', 'Aro d''Egitto', 'it'),
    ('CXSES', 'Fava d''Egitto', 'it'),
    ('CXSES', 'Pampini del paradiso', 'it'),
    ('CXSES', 'Trombe del paradiso', 'it');

-- Names for host Vaccinium darrowii
INSERT INTO plants_names(plant, name, language) VALUES
    ('VACDA', 'Darrow''s blueberry', 'en'),
    ('VACDA', 'Evergreen blueberry', 'en'),
    ('VACDA', 'Southern highbush blueberry', 'en');

-- Names for host Rosa x damascena
INSERT INTO plants_names(plant, name, language) VALUES
    ('ROSDM', 'Damask rose', 'en');

-- Names for host Caryota mitis
INSERT INTO plants_names(plant, name, language) VALUES
    ('CAWMI', 'Fishtail palm', 'en'),
    ('CAWMI', 'Burmese fishtail palm', 'en'),
    ('CAWMI', 'Common fishtail palm', 'en');

-- Names for host Persicaria lapathifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('POLLA', 'Bulbous persicaria', 'en'),
    ('POLLA', 'Dock-leaved persicaria', 'en'),
    ('POLLA', 'Knotted persicaria', 'en'),
    ('POLLA', 'Pale persicaria', 'en'),
    ('POLLA', 'Pale willow weed', 'en'),
    ('POLLA', 'Green smartweed', 'en'),
    ('POLLA', 'Pale smartweed', 'en'),
    ('POLLA', 'Persicaria maggiore', 'it'),
    ('POLLA', 'Poligono a foglie di romice', 'it'),
    ('POLLA', 'Poligono rosso', 'it'),
    ('POLLA', 'Salcerella', 'it'),
    ('POLLA', 'Poligono nodoso', 'it');

-- Names for host Prunus persica var. nucipersica
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNPN', 'Nectarine', 'en'),
    ('PRNPN', 'Nettarina', 'it');

-- Names for host Cotoneaster lucidus
INSERT INTO plants_names(plant, name, language) VALUES
    ('CTTLU', 'Shiny cotoneaster', 'en');

-- Names for host Populus x canescens
INSERT INTO plants_names(plant, name, language) VALUES
    ('POPCN', 'Grey poplar', 'en'),
    ('POPCN', 'Pioppo grigio', 'it'),
    ('POPCN', 'Pioppo gattinero', 'it'),
    ('POPCN', 'Pioppo canescente', 'it');

-- Names for host Polygala myrtifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('POGMY', 'Sweet pea-shrub', 'en'),
    ('POGMY', 'Myrtleleaf milkwort', 'en'),
    ('POGMY', 'September bush', 'en');

-- Names for host Rosa rugosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('ROSRG', 'Hedgerow rose', 'en'),
    ('ROSRG', 'Ramanas rose', 'en'),
    ('ROSRG', 'Rugosa rose', 'en'),
    ('ROSRG', 'Japanese rose', 'en'),
    ('ROSRG', 'Turkestan rose', 'en'),
    ('ROSRG', 'Rosa rugosa', 'it'),
    ('ROSRG', 'Rosa con foglie rugose', 'it');

-- Names for host Pistacia vera
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIAVE', 'Pistachio', 'en'),
    ('PIAVE', 'Pistache nut', 'en'),
    ('PIAVE', 'Pistachio nut', 'en'),
    ('PIAVE', 'Pistacchio', 'it');

-- Names for host Luffa acutangula
INSERT INTO plants_names(plant, name, language) VALUES
    ('LUFAC', 'Dishcloth gourd', 'en'),
    ('LUFAC', 'Angled loofah', 'en'),
    ('LUFAC', 'Chinese okra', 'en'),
    ('LUFAC', 'East Indian okra', 'en'),
    ('LUFAC', 'Loofah', 'en'),
    ('LUFAC', 'Strainer vine', 'en');

-- Names for host Populus x canadensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('POPCA', 'Canadian poplar', 'en'),
    ('POPCA', 'Hybrid black poplar', 'en'),
    ('POPCA', 'Pioppo del Canadà', 'it');

-- Names for host Gmelina philippensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('GMEPH', 'Hedgehog', 'en'),
    ('GMEPH', 'Wild sage', 'en');

-- Names for host Mangifera indica
INSERT INTO plants_names(plant, name, language) VALUES
    ('MNGIN', 'Mango', 'en'),
    ('MNGIN', 'Mango', 'it');

-- Names for host Brugmansia x candida
INSERT INTO plants_names(plant, name, language) VALUES
    ('DATCA', 'Tree datura', 'en'),
    ('DATCA', 'Moonflower', 'en'),
    ('DATCA', 'White angel''s trumpet', 'en'),
    ('DATCA', 'Stramonio candido', 'it');

-- Names for host Grewia asiatica
INSERT INTO plants_names(plant, name, language) VALUES
    ('GRWAS', 'Indian phalsa', 'en');

-- Names for host Anemone coronaria
INSERT INTO plants_names(plant, name, language) VALUES
    ('ANMCO', 'Poppy anemone', 'en'),
    ('ANMCO', 'Poppy windflower', 'en'),
    ('ANMCO', 'Crown anemone', 'en'),
    ('ANMCO', 'Anemone dei campi', 'it'),
    ('ANMCO', 'Fagottino', 'it'),
    ('ANMCO', 'Anemone dei fiorai', 'it');

-- Names for host Solanum dulcamara
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLDU', 'Bittersweet', 'en'),
    ('SOLDU', 'Bittersweet nightshade', 'en'),
    ('SOLDU', 'Woody nightshade', 'en'),
    ('SOLDU', 'Bittersweet nightshade', 'en'),
    ('SOLDU', 'Cliimbing nightshade', 'en'),
    ('SOLDU', 'Deadly nightshade', 'en'),
    ('SOLDU', 'Dulcamara', 'it'),
    ('SOLDU', 'Corallini', 'it'),
    ('SOLDU', 'Morella rampicante', 'it'),
    ('SOLDU', 'Vite selvatica', 'it');

-- Names for host Glycosmis pentaphylla
INSERT INTO plants_names(plant, name, language) VALUES
    ('GLWPE', 'Gin berry', 'en'),
    ('GLWPE', 'Orangeberry', 'en');

-- Names for host Litsea glutinosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('LISGU', 'Indian laurel', 'en');

-- Names for host Salix caprea
INSERT INTO plants_names(plant, name, language) VALUES
    ('SAXCP', 'Common sallow', 'en'),
    ('SAXCP', 'Palm willow', 'en'),
    ('SAXCP', 'Pussy willow', 'en'),
    ('SAXCP', 'Goat willow', 'en'),
    ('SAXCP', 'Great sallow', 'en'),
    ('SAXCP', 'Salicone', 'it'),
    ('SAXCP', 'Salica', 'it'),
    ('SAXCP', 'Salice caprino', 'it'),
    ('SAXCP', 'Salcio caprino', 'it'),
    ('SAXCP', 'Salcio delle capre', 'it'),
    ('SAXCP', 'Salice delle capre', 'it');

-- Names for host Clethra alnifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('CXEAL', 'Coastal sweet pepper bush', 'en'),
    ('CXEAL', 'White alder', 'en'),
    ('CXEAL', 'Summersweet', 'en'),
    ('CXEAL', 'Sweet pepper bush', 'en');

-- Names for host Dioscorea esculenta
INSERT INTO plants_names(plant, name, language) VALUES
    ('DIUES', 'Fancy yam', 'en'),
    ('DIUES', 'Lesser yam', 'en'),
    ('DIUES', 'Potato yam', 'en');

-- Names for host Pinus radiata
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIURA', 'Radiata pine', 'en'),
    ('PIURA', 'Monterey pine', 'en'),
    ('PIURA', 'Insignis pine', 'en'),
    ('PIURA', 'Pino insigne', 'it'),
    ('PIURA', 'Pino radiato', 'it');

-- Names for host Artocarpus nitidus
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABFNI', 'Selanking', 'en');

-- Names for host Pyrus pyraster
INSERT INTO plants_names(plant, name, language) VALUES
    ('PYUPS', 'Wild pear', 'en'),
    ('PYUPS', 'Perastro', 'it'),
    ('PYUPS', 'Pero selvatico', 'it');

-- Names for host Cocos nucifera
INSERT INTO plants_names(plant, name, language) VALUES
    ('CCNNU', 'Common coconut palm', 'en'),
    ('CCNNU', 'Coconut', 'en'),
    ('CCNNU', 'Coco palm', 'en'),
    ('CCNNU', 'Palma di coco', 'it'),
    ('CCNNU', 'Noce di India', 'it');

-- Names for host Cotoneaster x watereri
INSERT INTO plants_names(plant, name, language) VALUES
    ('CTTWT', 'Waterer''s cotoneaster', 'en');

-- Names for host Ardisia crenata
INSERT INTO plants_names(plant, name, language) VALUES
    ('ADACN', 'Coral berry', 'en'),
    ('ADACN', 'Hen''s eyes', 'en'),
    ('ADACN', 'Spiceberry', 'en'),
    ('ADACN', 'Ardisia', 'it');

-- Names for host Flacourtia indica
INSERT INTO plants_names(plant, name, language) VALUES
    ('FLCIN', 'Governor''s plum', 'en'),
    ('FLCIN', 'Madagascar plum', 'en'),
    ('FLCIN', 'Batoko plum', 'en'),
    ('FLCIN', 'Ramontchi', 'en');

-- Names for host Persicaria pensylvanica
INSERT INTO plants_names(plant, name, language) VALUES
    ('POLPY', 'Annual smartweed', 'en'),
    ('POLPY', 'Pink smartweed', 'en'),
    ('POLPY', 'Pinkweed', 'en'),
    ('POLPY', 'Pennsylvania smartweed', 'en');

-- Names for host Vitis coignetiae
INSERT INTO plants_names(plant, name, language) VALUES
    ('VITCO', 'Crimson glory vine', 'en'),
    ('VITCO', 'Frost grape', 'en');

-- Names for host Citrus x nobilis
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDNO', 'King orange', 'en'),
    ('CIDNO', 'Tangor', 'en'),
    ('CIDNO', 'Mandarino king', 'it');

-- Names for host Rosa canina
INSERT INTO plants_names(plant, name, language) VALUES
    ('ROSCN', 'Briar rose', 'en'),
    ('ROSCN', 'Dog rose', 'en'),
    ('ROSCN', 'Common briar', 'en'),
    ('ROSCN', 'Rosa canina', 'it'),
    ('ROSCN', 'Rosa selvatica', 'it'),
    ('ROSCN', 'Rosa di macchia', 'it'),
    ('ROSCN', 'Rosa selvatica comune', 'it');

-- Names for host Ehretia microphylla
INSERT INTO plants_names(plant, name, language) VALUES
    ('EHTMI', 'Ceylon boxwood', 'en'),
    ('EHTMI', 'Fukien tea tree', 'en'),
    ('EHTMI', 'Scorpionbush', 'en');

-- Names for host Malpighia glabra
INSERT INTO plants_names(plant, name, language) VALUES
    ('MLPGL', 'Barbados cherry', 'en');

-- Names for host Fagus sylvatica
INSERT INTO plants_names(plant, name, language) VALUES
    ('FAUSY', 'European beech', 'en'),
    ('FAUSY', 'Beech', 'en'),
    ('FAUSY', 'Faggio comune', 'it'),
    ('FAUSY', 'Faggio', 'it');

-- Names for host Corchorus capsularis
INSERT INTO plants_names(plant, name, language) VALUES
    ('CRGCA', 'Jute plant', 'en'),
    ('CRGCA', 'Round-podded jute', 'en'),
    ('CRGCA', 'White jute', 'en');

-- Names for host Spondias pinnata
INSERT INTO plants_names(plant, name, language) VALUES
    ('SPXPI', 'Andaman mombin', 'en'),
    ('SPXPI', 'Indian hog plum', 'en'),
    ('SPXPI', 'Indian mombin', 'en'),
    ('SPXPI', 'Wild mango', 'en');

-- Names for host Passiflora ligularis
INSERT INTO plants_names(plant, name, language) VALUES
    ('PAQLI', 'Sweet granadilla', 'en');

-- Names for host Pometia pinnata
INSERT INTO plants_names(plant, name, language) VALUES
    ('PMEPI', 'Langsir', 'en'),
    ('PMEPI', 'Kasai', 'en'),
    ('PMEPI', 'Fijian longan', 'en'),
    ('PMEPI', 'Matoa', 'en'),
    ('PMEPI', 'Kava', 'en'),
    ('PMEPI', 'Island lychee', 'en'),
    ('PMEPI', 'Taun tree', 'en');

-- Names for host Populus tomentosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('POPTO', 'Chinese white poplar', 'en'),
    ('POPTO', 'Pioppo tomentoso', 'it');

-- Names for host Hedera helix
INSERT INTO plants_names(plant, name, language) VALUES
    ('HEEHE', 'Common ivy', 'en'),
    ('HEEHE', 'English ivy', 'en'),
    ('HEEHE', 'Ivy', 'en'),
    ('HEEHE', 'Edera', 'it'),
    ('HEEHE', 'Ellera', 'it');

-- Names for host Citrus x aurantium var. sinensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDSI', 'Sweet orange', 'en'),
    ('CIDSI', 'Arancio', 'it');

-- Names for host Lonicera japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('LONJA', 'Japanese honeysuckle', 'en'),
    ('LONJA', 'Caprifoglio del Giappone', 'it'),
    ('LONJA', 'Caprifoglio giapponese', 'it');

-- Names for host Elaeagnus x submacrophylla
INSERT INTO plants_names(plant, name, language) VALUES
    ('ELGEB', 'Ebbing''s silverberry', 'en'),
    ('ELGEB', 'Oleaster', 'en');

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

-- Names for host Quercus serrata
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUEGL', 'Gland-bearing oak', 'en');

-- Names for host Gerbera jamesonii
INSERT INTO plants_names(plant, name, language) VALUES
    ('GEBJA', 'Baberton daisy', 'en'),
    ('GEBJA', 'African daisy', 'en'),
    ('GEBJA', 'Gerbera daisy', 'en'),
    ('GEBJA', 'Transvaal daisy', 'en');

-- Names for host Gynochthodes umbellata
INSERT INTO plants_names(plant, name, language) VALUES
    ('MOJRO', 'Yellow-root', 'en'),
    ('MOJRO', 'Royoc', 'en');

-- Names for host Piper kadsura
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIPKA', 'Japanese pepper bush', 'en');

-- Names for host Artocarpus integer
INSERT INTO plants_names(plant, name, language) VALUES
    ('ABFIN', 'Champedak', 'en'),
    ('ABFIN', 'Chempedak', 'en'),
    ('ABFIN', 'Tjampedak', 'en'),
    ('ABFIN', 'Jack fruit', 'en');

-- Names for host Corylus sieboldiana
INSERT INTO plants_names(plant, name, language) VALUES
    ('CYLSI', 'Japanese filbert', 'en');

-- Names for host Citrus x amblycarpa
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDAY', 'Djeruk lime', 'en'),
    ('CIDAY', 'Nasnaran mandarin', 'en');

-- Names for host Lepisanthes alata
INSERT INTO plants_names(plant, name, language) VALUES
    ('LQZAL', 'Common tree vine', 'en'),
    ('LQZAL', 'Jahore tree', 'en');

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

-- Names for host Garcinia xanthochymus
INSERT INTO plants_names(plant, name, language) VALUES
    ('GANTI', 'Gamboge', 'en'),
    ('GANTI', 'Gambogetree', 'en'),
    ('GANTI', 'Sour mangosteen', 'en');

-- Names for host Mimusops elengi
INSERT INTO plants_names(plant, name, language) VALUES
    ('MMOEL', 'Bullet wood', 'en'),
    ('MMOEL', 'Medlar', 'en'),
    ('MMOEL', 'Spanish cherry', 'en'),
    ('MMOEL', 'Tanjong tree', 'en');

-- Names for host Buxus sinica
INSERT INTO plants_names(plant, name, language) VALUES
    ('BUXMS', 'Chinese box', 'en');

-- Names for host Flueggea virosa
INSERT INTO plants_names(plant, name, language) VALUES
    ('SEAVI', 'White-berry bush', 'en');

-- Names for host Nephelium cuspidatum
INSERT INTO plants_names(plant, name, language) VALUES
    ('NEECU', 'Lotong', 'en');

-- Names for host Smilax china
INSERT INTO plants_names(plant, name, language) VALUES
    ('SMICH', 'China root', 'en'),
    ('SMICH', 'Chinese smilax', 'en'),
    ('SMICH', 'Chinese sarsaparilla', 'en');

-- Names for host Vitis amurensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('VITAM', 'Amur grape', 'en');

-- Names for host Averrhoa carambola
INSERT INTO plants_names(plant, name, language) VALUES
    ('AVRCA', 'Carambola', 'en'),
    ('AVRCA', 'Star fruit', 'en'),
    ('AVRCA', 'Caramba', 'en'),
    ('AVRCA', 'Chinese gooseberry', 'en'),
    ('AVRCA', 'Country gooseberry', 'en'),
    ('AVRCA', 'Carambola', 'it');

-- Names for host Excoecaria agallocha
INSERT INTO plants_names(plant, name, language) VALUES
    ('EXAAG', 'Geor', 'en'),
    ('EXAAG', 'Gewa', 'en'),
    ('EXAAG', 'Blind-your-eyes tree', 'en'),
    ('EXAAG', 'Buta-buta', 'en'),
    ('EXAAG', 'Milky mangrove', 'en'),
    ('EXAAG', 'Geor', 'it');

-- Names for host Ficus carica
INSERT INTO plants_names(plant, name, language) VALUES
    ('FIUCA', 'Common fig', 'en'),
    ('FIUCA', 'Fig', 'en'),
    ('FIUCA', 'Fico comune', 'it'),
    ('FIUCA', 'Fico', 'it');

-- Names for host Barringtonia acutangula
INSERT INTO plants_names(plant, name, language) VALUES
    ('BGTAC', 'Indian oak', 'en'),
    ('BGTAC', 'Stream barringtonia', 'en'),
    ('BGTAC', 'Wild rambal', 'en');

-- Names for host Morus alba
INSERT INTO plants_names(plant, name, language) VALUES
    ('MORAL', 'White mulberry', 'en'),
    ('MORAL', 'Silkworm mulberry', 'en'),
    ('MORAL', 'Gelso bianco', 'it'),
    ('MORAL', 'Moro bianco', 'it'),
    ('MORAL', 'Gelso comune', 'it');

-- Names for host Chrysophyllum cainito
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSFCA', 'Star apple', 'en'),
    ('CSFCA', 'Cainito', 'it');

-- Names for host Nephelium lappaceum
INSERT INTO plants_names(plant, name, language) VALUES
    ('NEELA', 'Rambutan', 'en');

-- Names for host Carya illinoinensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('CYAIL', 'Pecan', 'en'),
    ('CYAIL', 'Caria', 'it'),
    ('CYAIL', 'Noce di pecan', 'it');

-- Names for host Terminalia chebula
INSERT INTO plants_names(plant, name, language) VALUES
    ('TEMCH', 'Black myrobolan', 'en'),
    ('TEMCH', 'Mirobolano', 'it');

-- Names for host Amaranthus retroflexus
INSERT INTO plants_names(plant, name, language) VALUES
    ('AMARE', 'Careless weed', 'en'),
    ('AMARE', 'Redroot', 'en'),
    ('AMARE', 'Redroot amaranth', 'en'),
    ('AMARE', 'Slender pigweed', 'en'),
    ('AMARE', 'Common amaranth', 'en'),
    ('AMARE', 'Redroot pigweed', 'en'),
    ('AMARE', 'Pigweed', 'en'),
    ('AMARE', 'Wild amaranth', 'en'),
    ('AMARE', 'Amaranto comune', 'it'),
    ('AMARE', 'Biedone', 'it'),
    ('AMARE', 'Blito', 'it');

-- Names for host Fagus crenata
INSERT INTO plants_names(plant, name, language) VALUES
    ('FAUCR', 'Japanese beech', 'en'),
    ('FAUCR', 'Siebold''s beech', 'en'),
    ('FAUCR', 'Faggio crenato', 'it');

-- Names for host Cotoneaster lacteus
INSERT INTO plants_names(plant, name, language) VALUES
    ('CTTLA', 'Red cluster berry', 'en'),
    ('CTTLA', 'Parney''s cotoneaster', 'en'),
    ('CTTLA', 'Late cotoneaster', 'en');

-- Names for host Juglans major
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGMA', 'Arizona walnut', 'en');

-- Names for host Retama monosperma
INSERT INTO plants_names(plant, name, language) VALUES
    ('LGOMO', 'Bridal broom', 'en'),
    ('LGOMO', 'White broom', 'en'),
    ('LGOMO', 'Ginestra bianca', 'it');

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

-- Names for host Zanthoxylum bungeanum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ZANSI', 'Flat-spine prickly ash', 'en'),
    ('ZANSI', 'Chinese pepper tree', 'en'),
    ('ZANSI', 'Chinese prickly ash', 'en');

-- Names for host Averrhoa bilimbi
INSERT INTO plants_names(plant, name, language) VALUES
    ('AVRBI', 'Blimbe', 'en'),
    ('AVRBI', 'Cucumber tree', 'en'),
    ('AVRBI', 'Bilimbi', 'en'),
    ('AVRBI', 'Blimbing asam', 'en'),
    ('AVRBI', 'Belimbing', 'en');

-- Names for host Blighia sapida
INSERT INTO plants_names(plant, name, language) VALUES
    ('BLISA', 'Akee', 'en'),
    ('BLISA', 'Aki', 'en'),
    ('BLISA', 'Achee', 'en'),
    ('BLISA', 'Ackee apple', 'en'),
    ('BLISA', 'Akee dell''Africa', 'it');

-- Names for host Erigeron bonariensis
INSERT INTO plants_names(plant, name, language) VALUES
    ('ERIBO', 'Asthma weed', 'en'),
    ('ERIBO', 'Flaxleaf fleabane', 'en'),
    ('ERIBO', 'Hairy fleabane', 'en'),
    ('ERIBO', 'Hairy horseweed', 'en'),
    ('ERIBO', 'Wavy-leaved fleabane', 'en'),
    ('ERIBO', 'Argentine fleabane', 'en'),
    ('ERIBO', 'Horseweed', 'en'),
    ('ERIBO', 'Ceppica campestre', 'it'),
    ('ERIBO', 'Saeppola di Buenos Aires', 'it'),
    ('ERIBO', 'Saeppola de Buenos Aires', 'it');

-- Names for host Solanum sessiliflorum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLTP', 'Orinoco apple', 'en'),
    ('SOLTP', 'Peach tomato', 'en'),
    ('SOLTP', 'Cocona', 'en');

-- Names for host Salix babylonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('SAXBA', 'Weeping willow', 'en'),
    ('SAXBA', 'Mourning willow', 'en'),
    ('SAXBA', 'Chinese willow', 'en'),
    ('SAXBA', 'Peking willow', 'en'),
    ('SAXBA', 'Salice piangente', 'it'),
    ('SAXBA', 'Salice babilonese', 'it'),
    ('SAXBA', 'Salice di Pechino', 'it');

-- Names for host Mangifera caesia
INSERT INTO plants_names(plant, name, language) VALUES
    ('MNGCA', 'Binjai', 'en'),
    ('MNGCA', 'Jack', 'en'),
    ('MNGCA', 'White mango', 'en');

-- Names for host Lavandula angustifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('LAVAN', 'Common lavender', 'en'),
    ('LAVAN', 'English lavender', 'en'),
    ('LAVAN', 'French lavender', 'en'),
    ('LAVAN', 'Garden lavender', 'en'),
    ('LAVAN', 'Lavanda vera', 'it'),
    ('LAVAN', 'Banda', 'it'),
    ('LAVAN', 'Fior di spigo', 'it'),
    ('LAVAN', 'Spigo', 'it');

-- Names for host Machilus thunbergii
INSERT INTO plants_names(plant, name, language) VALUES
    ('PEBTH', 'Makko', 'en');

-- Names for host Pinus cembra
INSERT INTO plants_names(plant, name, language) VALUES
    ('PIUCE', 'Arolla pine', 'en'),
    ('PIUCE', 'Swiss stone pine', 'en'),
    ('PIUCE', 'Alpine stone pine', 'en'),
    ('PIUCE', 'Pino cembro', 'it'),
    ('PIUCE', 'Cirmolo', 'it');

-- Names for host Eugenia uniflora
INSERT INTO plants_names(plant, name, language) VALUES
    ('EUEUN', 'Pitanga', 'en'),
    ('EUEUN', 'Surinam cherry', 'en');

-- Names for host Acer pictum subsp. mono
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRMO', 'Painted maple', 'en'),
    ('ACRMO', 'Mono maple', 'en');

-- Names for host Acer truncatum
INSERT INTO plants_names(plant, name, language) VALUES
    ('ACRTU', 'Shantung maple', 'en');

-- Names for host Genista ephedroides
INSERT INTO plants_names(plant, name, language) VALUES
    ('GENEP', 'Ginestra di Gasparrini', 'it');

-- Names for host Solanum muricatum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLMU', 'Melon pear', 'en'),
    ('SOLMU', 'Pepino', 'en');

-- Names for host Cotoneaster salicifolius
INSERT INTO plants_names(plant, name, language) VALUES
    ('CTTSA', 'Willow-leaf cotoneaster', 'en'),
    ('CTTSA', 'Willow-leaved cotoneaster', 'en'),
    ('CTTSA', 'Cotognastro con foglie di salice', 'it'),
    ('CTTSA', 'Cotognastro salicino', 'it');

-- Names for host Malus domestica
INSERT INTO plants_names(plant, name, language) VALUES
    ('MABSD', 'Apple', 'en'),
    ('MABSD', 'Melo', 'it'),
    ('MABSD', 'Pomo', 'it'),
    ('MABSD', 'Melo comune', 'it');

-- Names for host Annona x atemoya
INSERT INTO plants_names(plant, name, language) VALUES
    ('ANUAT', 'Atemoya', 'en'),
    ('ANUAT', 'Pineapple sugar apple', 'en');

-- Names for host Fatsia japonica
INSERT INTO plants_names(plant, name, language) VALUES
    ('FATJA', 'Japanese aralia', 'en'),
    ('FATJA', 'Fatsia', 'en'),
    ('FATJA', 'Formosa rice tree', 'en'),
    ('FATJA', 'Paper plant', 'en');

-- Names for host Pyrus calleryana
INSERT INTO plants_names(plant, name, language) VALUES
    ('PYUCA', 'Bradford pear', 'en'),
    ('PYUCA', 'Callery pear', 'en');

-- Names for host Urena lobata
INSERT INTO plants_names(plant, name, language) VALUES
    ('URNLO', 'Aramina plant', 'en'),
    ('URNLO', 'Cadillo', 'en'),
    ('URNLO', 'Urena burr', 'en'),
    ('URNLO', 'Congo jute', 'en'),
    ('URNLO', 'Indian mallow', 'en'),
    ('URNLO', 'Aramina fibre plant', 'en'),
    ('URNLO', 'Caesar weed', 'en'),
    ('URNLO', 'Ballard bush', 'en'),
    ('URNLO', 'Bur mallow', 'en'),
    ('URNLO', 'Urena', 'it');

-- Names for host Convolvulus cneorum
INSERT INTO plants_names(plant, name, language) VALUES
    ('CONCN', 'Silver bush', 'en'),
    ('CONCN', 'Shrubby convolvulus', 'en'),
    ('CONCN', 'Vilucchio turco', 'it');

-- Names for host Juglans mandshurica
INSERT INTO plants_names(plant, name, language) VALUES
    ('IUGMN', 'Manchurian walnut', 'en'),
    ('IUGMN', 'Noce della Manciuria', 'it');

-- Names for host Cucumis prophetarum
INSERT INTO plants_names(plant, name, language) VALUES
    ('CUMPR', 'Wild cucumber', 'en');

-- Names for host Syzygium jambos
INSERT INTO plants_names(plant, name, language) VALUES
    ('SYZJA', 'Rose apple', 'en'),
    ('SYZJA', 'Malabar plum', 'en'),
    ('SYZJA', 'Malay apple', 'en'),
    ('SYZJA', 'Wax jambu', 'en'),
    ('SYZJA', 'Pomo rosa', 'it'),
    ('SYZJA', 'Giambo', 'it');

-- Names for host Citrus depressa
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDDP', 'Shekwasha', 'en');

-- Names for host Cucurbita argyrosperma
INSERT INTO plants_names(plant, name, language) VALUES
    ('CUUMI', 'Cushaw pumpkin', 'en'),
    ('CUUMI', 'Japanese pumpkin', 'en'),
    ('CUUMI', 'Silver-seed gourd', 'en');

-- Names for host Prunus campanulata
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNCM', 'Bell-flowered cherry', 'en'),
    ('PRNCM', 'Taiwan cherry', 'en');

-- Names for host Elaeagnus angustifolia
INSERT INTO plants_names(plant, name, language) VALUES
    ('ELGAN', 'Russian olive', 'en'),
    ('ELGAN', 'Trebizond date', 'en'),
    ('ELGAN', 'Oleaster', 'en'),
    ('ELGAN', 'Wild olive', 'en'),
    ('ELGAN', 'Eleagno balsamico', 'it'),
    ('ELGAN', 'Olivastro', 'it'),
    ('ELGAN', 'Olivagno', 'it'),
    ('ELGAN', 'Eleagno', 'it'),
    ('ELGAN', 'Olivo de Boemia', 'it');

-- Names for host Prunus davidiana
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNDV', 'David''s peach', 'en'),
    ('PRNDV', 'Pesco de David', 'it');

-- Names for host Citrullus colocynthis
INSERT INTO plants_names(plant, name, language) VALUES
    ('CITCO', 'Colocynth', 'en'),
    ('CITCO', 'Bitter-apple', 'en'),
    ('CITCO', 'Perennial wild melon', 'en'),
    ('CITCO', 'Bitter apple', 'en'),
    ('CITCO', 'Bitter cucumber', 'en'),
    ('CITCO', 'Desert gourd', 'en'),
    ('CITCO', 'Coloquintide', 'it'),
    ('CITCO', 'Pomo amaro', 'it'),
    ('CITCO', 'Coloquinda', 'it'),
    ('CITCO', 'Popone amaro', 'it');

-- Names for host Phyllanthus emblica
INSERT INTO plants_names(plant, name, language) VALUES
    ('PYLEM', 'Emblic', 'en'),
    ('PYLEM', 'Myrabolan', 'en'),
    ('PYLEM', 'Indian gooseberry', 'en');

-- Names for host Azadirachta excelsa
INSERT INTO plants_names(plant, name, language) VALUES
    ('AZJEX', 'Sentang', 'en');

-- Names for host Ulmus americana
INSERT INTO plants_names(plant, name, language) VALUES
    ('ULMAM', 'American white elm', 'en'),
    ('ULMAM', 'American elm', 'en'),
    ('ULMAM', 'Olmo americano', 'it');

-- Names for host Argyranthemum frutescens
INSERT INTO plants_names(plant, name, language) VALUES
    ('CHYFR', 'White marguerite', 'en'),
    ('CHYFR', 'Marguerite', 'en'),
    ('CHYFR', 'Marguerite daisy', 'en'),
    ('CHYFR', 'Paris daisy', 'en'),
    ('CHYFR', 'Margherita delle Canarie', 'it');

-- Names for host Vaccinium reticulatum
INSERT INTO plants_names(plant, name, language) VALUES
    ('VACRC', 'Ohelo ''ai', 'en');

-- Names for host Morella rubra
INSERT INTO plants_names(plant, name, language) VALUES
    ('MYRRU', 'Yumberry', 'en'),
    ('MYRRU', 'Chinese bayberry', 'en'),
    ('MYRRU', 'Red bayberry', 'en'),
    ('MYRRU', 'Japanese bayberry', 'en'),
    ('MYRRU', 'Chinese strawberry tree', 'en'),
    ('MYRRU', 'Miricetina', 'it'),
    ('MYRRU', 'Yangmei', 'it');

-- Names for host Prunus laurocerasus
INSERT INTO plants_names(plant, name, language) VALUES
    ('PRNLR', 'Cherry laurel', 'en'),
    ('PRNLR', 'Laurel cherry', 'en'),
    ('PRNLR', 'Common laurel', 'en'),
    ('PRNLR', 'Lauroceraso', 'it'),
    ('PRNLR', 'Lauro regio', 'it');

-- Names for host Hordeum vulgare
INSERT INTO plants_names(plant, name, language) VALUES
    ('HORVX', 'Common barley', 'en'),
    ('HORVX', 'Four-rowed barley', 'en'),
    ('HORVX', 'Six-rowed barley', 'en'),
    ('HORVX', 'Barley', 'en'),
    ('HORVX', 'Orzo comune', 'it'),
    ('HORVX', 'Orzo tetrastico', 'it'),
    ('HORVX', 'Orzo', 'it'),
    ('HORVX', 'Orzo cultivato', 'it'),
    ('HORVX', 'Orzo maschio', 'it');

-- Names for host Photinia davidiana
INSERT INTO plants_names(plant, name, language) VALUES
    ('STVDA', 'Chinese stranvaesia', 'en'),
    ('STVDA', 'Stranvaesia', 'en');

-- Names for host Carallia brachiata
INSERT INTO plants_names(plant, name, language) VALUES
    ('KRLBR', 'Freshwater mangrove', 'en');

-- Names for host Citrus x aurantium var. unshiu
INSERT INTO plants_names(plant, name, language) VALUES
    ('CIDUN', 'Satsuma', 'en'),
    ('CIDUN', 'Satsuma orange', 'en'),
    ('CIDUN', 'Christmas orange', 'en'),
    ('CIDUN', 'Cold-hardy mandarin', 'en'),
    ('CIDUN', 'Satsuma mandarin', 'en'),
    ('CIDUN', 'Miyagawa', 'it');

-- Names for host Castanea crenata
INSERT INTO plants_names(plant, name, language) VALUES
    ('CSNCR', 'Japanese chestnut', 'en'),
    ('CSNCR', 'Castagno del Giappone', 'it'),
    ('CSNCR', 'Castagno giapponese', 'it');

-- Names for host Rhamnus alaternus
INSERT INTO plants_names(plant, name, language) VALUES
    ('RHAAL', 'Barren privet', 'en'),
    ('RHAAL', 'Italian buckthorn', 'en'),
    ('RHAAL', 'Mediterranean buckthorn', 'en'),
    ('RHAAL', 'Alaterno', 'it'),
    ('RHAAL', 'Linterno', 'it'),
    ('RHAAL', 'Illatro', 'it'),
    ('RHAAL', 'Legno puzzo', 'it'),
    ('RHAAL', 'Ranno lanterno', 'it');

-- Names for host Hanguana malayana
INSERT INTO plants_names(plant, name, language) VALUES
    ('HGUMA', 'Common susum', 'en');

-- Names for host Garcinia subelliptica
INSERT INTO plants_names(plant, name, language) VALUES
    ('GANSU', 'Happiness tree', 'en');

-- Names for host Dimocarpus longan
INSERT INTO plants_names(plant, name, language) VALUES
    ('DMCLO', 'Longan', 'en'),
    ('DMCLO', 'Dragon''s eye', 'en');

-- Names for host Hypericum perforatum
INSERT INTO plants_names(plant, name, language) VALUES
    ('HYPPE', 'Goatweed', 'en'),
    ('HYPPE', 'Klamath weed', 'en'),
    ('HYPPE', 'Triptonweed', 'en'),
    ('HYPPE', 'Common St John''s-wort', 'en'),
    ('HYPPE', 'Perforate St John''s-wort', 'en'),
    ('HYPPE', 'Erba di San Giovanni', 'it'),
    ('HYPPE', 'Iperico perforato', 'it'),
    ('HYPPE', 'Pilatro', 'it'),
    ('HYPPE', 'Caccia diavoli', 'it'),
    ('HYPPE', 'Erba di San Giovanni comune', 'it');

-- Names for host Solanum tuberosum
INSERT INTO plants_names(plant, name, language) VALUES
    ('SOLTU', 'Potato', 'en'),
    ('SOLTU', 'Pomo di terra', 'it'),
    ('SOLTU', 'Patata', 'it');

-- Names for host Quercus rubra
INSERT INTO plants_names(plant, name, language) VALUES
    ('QUERU', 'Northern red oak', 'en'),
    ('QUERU', 'American red oak', 'en'),
    ('QUERU', 'Red oak', 'en'),
    ('QUERU', 'Quercia rossa', 'it');

-- Names for host Hibiscus palustris
INSERT INTO plants_names(plant, name, language) VALUES
    ('HIBPA', 'Sea hollyhock', 'en'),
    ('HIBPA', 'Swamp rosemallow', 'en'),
    ('HIBPA', 'Marshmallow', 'en'),
    ('HIBPA', 'Swamp rose-mallow', 'en'),
    ('HIBPA', 'Ibisco palustre', 'it');

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
    ('COLLAC', 'LUPLU', 'h'),
    ('COLLAC', 'MABSD', 'h'),
    ('COLLAC', 'OLVEU', 'h'),
    ('COLLAC', 'PEBAM', 'h'),
    ('COLLAC', 'PIUEL', 'h'),
    ('COLLAC', 'PIURA', 'h'),
    ('COLLAC', 'PSIGU', 'h'),
    ('COLLAC', 'SAMNI', 'h'),
    ('COLLAC', 'CYJBE', 'h'),
    ('COLLAC', 'LYPES', 'h'),
    ('COLLAC', 'SOLME', 'h'),
    ('COLLAC', 'TSUHE', 'h'),
    ('COLLAC', '1ZIIG', 'h');

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
    ('CORBMI', 'CEMEL', 'e'),
    ('CORBMI', 'CITLA', 'e'),
    ('CORBMI', 'CUMSA', 'e'),
    ('CORBMI', 'DATIN', 'e'),
    ('CORBMI', 'DATME', 'e'),
    ('CORBMI', 'DATSS', 'e'),
    ('CORBMI', 'DATST', 'e'),
    ('CORBMI', 'HELAN', 'e'),
    ('CORBMI', 'HSYNI', 'e'),
    ('CORBMI', 'NIOBI', 'e'),
    ('CORBMI', 'NIEFR', 'e'),
    ('CORBMI', 'NIESS', 'e'),
    ('CORBMI', 'PHYHE', 'e'),
    ('CORBMI', 'PHYLF', 'e'),
    ('CORBMI', 'SLGSS', 'e'),
    ('CORBMI', 'SZTSS', 'e'),
    ('CORBMI', 'SOLAE', 'e'),
    ('CORBMI', 'SOLAM', 'e'),
    ('CORBMI', 'SOLAT', 'e'),
    ('CORBMI', 'SOLAV', 'e'),
    ('CORBMI', 'SOLCI', 'e'),
    ('CORBMI', 'SOLCA', 'e'),
    ('CORBMI', 'SOLDU', 'e'),
    ('CORBMI', 'SOLME', 'e'),
    ('CORBMI', 'SOLMY', 'e'),
    ('CORBMI', 'SOLPC', 'e'),
    ('CORBMI', 'SOLSC', 'e'),
    ('CORBMI', 'SOLVL', 'e'),
    ('CORBMI', 'SROJA', 'e');

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
    ('XANTPR', 'PRNDV', 'h'),
    ('XANTPR', 'PRNDO', 'h'),
    ('XANTPR', 'PRNJP', 'h'),
    ('XANTPR', 'PRNLR', 'h'),
    ('XANTPR', 'PRNMM', 'h'),
    ('XANTPR', 'PRNLS', 'h');

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
    ('PYRIOR', 'SETPA', 'h'),
    ('PYRIOR', 'SORHA', 'h'),
    ('PYRIOR', '1TRZG', 'h'),
    ('PYRIOR', 'ZEAMX', 'h');

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
    ('ENDOPA', 'CSNPU', 'h'),
    ('ENDOPA', 'CSNSE', 'h'),
    ('ENDOPA', 'QUEAL', 'h'),
    ('ENDOPA', 'QUECO', 'h'),
    ('ENDOPA', 'QUEFR', 'h'),
    ('ENDOPA', 'QUEIL', 'h'),
    ('ENDOPA', 'QUEPE', 'h'),
    ('ENDOPA', 'QUEPU', 'h'),
    ('ENDOPA', 'QUESL', 'h'),
    ('ENDOPA', 'QUEVI', 'h');

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
    ('ERWIAM', 'CNMJA', 'h'),
    ('ERWIAM', '1CTTG', 'h'),
    ('ERWIAM', 'CTTBU', 'h'),
    ('ERWIAM', 'CTTBX', 'h'),
    ('ERWIAM', 'CTTDA', 'h'),
    ('ERWIAM', 'CTTHO', 'h'),
    ('ERWIAM', 'CTTLA', 'h'),
    ('ERWIAM', 'CTTLU', 'h'),
    ('ERWIAM', 'CTTMI', 'h'),
    ('ERWIAM', 'CTTMO', 'h'),
    ('ERWIAM', 'CTTNG', 'h'),
    ('ERWIAM', 'CTTSA', 'h'),
    ('ERWIAM', 'CTTCR', 'h'),
    ('ERWIAM', 'CTTWT', 'h'),
    ('ERWIAM', '1CSCG', 'h'),
    ('ERWIAM', 'CSCOX', 'h'),
    ('ERWIAM', 'CSCMO', 'h'),
    ('ERWIAM', 'CSCPI', 'h'),
    ('ERWIAM', 'CSCPR', 'h'),
    ('ERWIAM', 'CYDOB', 'h'),
    ('ERWIAM', 'EIOJA', 'h'),
    ('ERWIAM', 'FRAAN', 'h'),
    ('ERWIAM', '1MABG', 'h'),
    ('ERWIAM', 'MABBA', 'h'),
    ('ERWIAM', 'MABCO', 'h'),
    ('ERWIAM', 'MABFB', 'h'),
    ('ERWIAM', 'MSPGE', 'h'),
    ('ERWIAM', 'STVDA', 'h'),
    ('ERWIAM', 'PRNAR', 'h'),
    ('ERWIAM', 'PRNCF', 'h'),
    ('ERWIAM', 'PRNDO', 'h'),
    ('ERWIAM', 'PRNSC', 'h'),
    ('ERWIAM', 'PDCSI', 'h'),
    ('ERWIAM', '1PYEG', 'h'),
    ('ERWIAM', 'PYECO', 'h'),
    ('ERWIAM', 'PYECN', 'h'),
    ('ERWIAM', '1PYUG', 'h'),
    ('ERWIAM', 'PYUBE', 'h'),
    ('ERWIAM', 'PYUEL', 'h'),
    ('ERWIAM', 'PYUSK', 'h'),
    ('ERWIAM', '1ROSG', 'h'),
    ('ERWIAM', 'ROSCN', 'h'),
    ('ERWIAM', 'ROSRG', 'h'),
    ('ERWIAM', 'RUBFR', 'h'),
    ('ERWIAM', 'RUBID', 'h'),
    ('ERWIAM', '1SOUG', 'h'),
    ('ERWIAM', 'SOUAL', 'h'),
    ('ERWIAM', 'SOUAI', 'h'),
    ('ERWIAM', 'SOUAU', 'h'),
    ('ERWIAM', 'SPVPR', 'h');

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
    ('XYLEFA', 'ACASA', 'h'),
    ('XYLEFA', 'ACRPP', 'h'),
    ('XYLEFA', 'ACRRB', 'h'),
    ('XYLEFA', 'AMARE', 'h'),
    ('XYLEFA', 'AYLHE', 'h'),
    ('XYLEFA', 'ARDUN', 'h'),
    ('XYLEFA', 'CHYFR', 'h'),
    ('XYLEFA', 'ARTAO', 'h'),
    ('XYLEFA', 'ARTSS', 'h'),
    ('XYLEFA', 'ASPAC', 'h'),
    ('XYLEFA', 'CCOSS', 'h'),
    ('XYLEFA', 'CCOSP', 'h'),
    ('XYLEFA', 'CCOVI', 'h'),
    ('XYLEFA', 'CMIRA', 'h'),
    ('XYLEFA', 'CYAIL', 'h'),
    ('XYLEFA', '1CTUG', 'h'),
    ('XYLEFA', 'CCSSI', 'h'),
    ('XYLEFA', 'CSTAL', 'h'),
    ('XYLEFA', 'CSTIC', 'h'),
    ('XYLEFA', 'CSTMO', 'h'),
    ('XYLEFA', 'CSTSA', 'h'),
    ('XYLEFA', 'CSTIS', 'h'),
    ('XYLEFA', '1CJCG', 'h'),
    ('XYLEFA', '1CIDG', 'h'),
    ('XYLEFA', 'PMITR', 'h'),
    ('XYLEFA', 'CONCN', 'h'),
    ('XYLEFA', 'CPMRE', 'h'),
    ('XYLEFA', 'CZRVL', 'h'),
    ('XYLEFA', 'CZRVG', 'h'),
    ('XYLEFA', 'SAOSC', 'h'),
    ('XYLEFA', 'CZSVI', 'h'),
    ('XYLEFA', 'OSPEK', 'h'),
    ('XYLEFA', 'OSPFR', 'h'),
    ('XYLEFA', 'DOSKA', 'h'),
    ('XYLEFA', 'DODVI', 'h'),
    ('XYLEFA', 'ELGAN', 'h'),
    ('XYLEFA', 'ELGEB', 'h'),
    ('XYLEFA', 'EMHMA', 'h'),
    ('XYLEFA', 'EIACN', 'h'),
    ('XYLEFA', 'ERIBO', 'h'),
    ('XYLEFA', 'ERIKA', 'h'),
    ('XYLEFA', 'ERISS', 'h'),
    ('XYLEFA', 'ERISU', 'h'),
    ('XYLEFA', 'ERQUM', 'h'),
    ('XYLEFA', '1ERYG', 'h'),
    ('XYLEFA', 'EPHCH', 'h'),
    ('XYLEFA', 'EPHTE', 'h'),
    ('XYLEFA', 'EYOCH', 'h'),
    ('XYLEFA', 'EYOPE', 'h'),
    ('XYLEFA', 'FIUCA', 'h'),
    ('XYLEFA', '1FOLG', 'h'),
    ('XYLEFA', 'FRXAN', 'h'),
    ('XYLEFA', 'GENBA', 'h'),
    ('XYLEFA', 'GENCO', 'h'),
    ('XYLEFA', 'GENEP', 'h'),
    ('XYLEFA', 'GENHS', 'h'),
    ('XYLEFA', 'GENSC', 'h'),
    ('XYLEFA', 'GENLU', 'h'),
    ('XYLEFA', 'GENSA', 'h'),
    ('XYLEFA', 'GLITR', 'h'),
    ('XYLEFA', 'GREJU', 'h'),
    ('XYLEFA', '1HBEG', 'h'),
    ('XYLEFA', 'HBEEL', 'h'),
    ('XYLEFA', 'HECIT', 'h'),
    ('XYLEFA', 'HECSS', 'h'),
    ('XYLEFA', 'HECST', 'h'),
    ('XYLEFA', 'HEOEU', 'h'),
    ('XYLEFA', 'HIBSS', 'h'),
    ('XYLEFA', 'HYPPE', 'h'),
    ('XYLEFA', 'ILEAQ', 'h'),
    ('XYLEFA', 'IUGRE', 'h'),
    ('XYLEFA', 'LURNO', 'h'),
    ('XYLEFA', 'LURSS', 'h'),
    ('XYLEFA', 'LAVAN', 'h'),
    ('XYLEFA', 'LAVDE', 'h'),
    ('XYLEFA', 'LAVLA', 'h'),
    ('XYLEFA', 'LAVST', 'h'),
    ('XYLEFA', 'LAVCY', 'h'),
    ('XYLEFA', 'LAVHE', 'h'),
    ('XYLEFA', 'LAVIN', 'h'),
    ('XYLEFA', 'LIGSI', 'h'),
    ('XYLEFA', 'LIQST', 'h'),
    ('XYLEFA', 'LONJA', 'h'),
    ('XYLEFA', 'MAGSO', 'h'),
    ('XYLEFA', 'MEDAR', 'h'),
    ('XYLEFA', 'MEDSA', 'h'),
    ('XYLEFA', 'MTDEX', 'h'),
    ('XYLEFA', 'MORAL', 'h'),
    ('XYLEFA', 'MORRU', 'h'),
    ('XYLEFA', 'MYMIN', 'h'),
    ('XYLEFA', 'MYVCO', 'h'),
    ('XYLEFA', 'PELGV', 'h'),
    ('XYLEFA', 'PELFR', 'h'),
    ('XYLEFA', 'PEBAM', 'h'),
    ('XYLEFA', 'PGASA', 'h'),
    ('XYLEFA', 'PGASS', 'h'),
    ('XYLEFA', 'PLRLA', 'h'),
    ('XYLEFA', 'PLMFR', 'h'),
    ('XYLEFA', 'PLMIT', 'h'),
    ('XYLEFA', 'PIAVE', 'h'),
    ('XYLEFA', 'PLTOC', 'h'),
    ('XYLEFA', 'PRNAN', 'h'),
    ('XYLEFA', 'PRNAR', 'h'),
    ('XYLEFA', 'PRNAV', 'h'),
    ('XYLEFA', 'PRNCF', 'h'),
    ('XYLEFA', 'PRNCE', 'h'),
    ('XYLEFA', 'PRNDO', 'h'),
    ('XYLEFA', 'PRNDU', 'h'),
    ('XYLEFA', 'PRNSC', 'h'),
    ('XYLEFA', 'PRNSO', 'h'),
    ('XYLEFA', 'QUEPA', 'h'),
    ('XYLEFA', 'QUEPU', 'h'),
    ('XYLEFA', 'QUERU', 'h'),
    ('XYLEFA', 'QUESU', 'h'),
    ('XYLEFA', 'LGOMO', 'h'),
    ('XYLEFA', 'RHAAL', 'h'),
    ('XYLEFA', 'ROBPS', 'h'),
    ('XYLEFA', 'ROSCN', 'h'),
    ('XYLEFA', 'ROSXF', 'h'),
    ('XYLEFA', 'ROSMU', 'h'),
    ('XYLEFA', 'RUBUL', 'h'),
    ('XYLEFA', 'RMSOF', 'h'),
    ('XYLEFA', 'SNTCH', 'h'),
    ('XYLEFA', 'SPUJU', 'h'),
    ('XYLEFA', 'STZRE', 'h'),
    ('XYLEFA', '1SRQG', 'h'),
    ('XYLEFA', 'TEUCP', 'h'),
    ('XYLEFA', 'ULEEU', 'h'),
    ('XYLEFA', 'ULEMI', 'h'),
    ('XYLEFA', 'ULMAM', 'h'),
    ('XYLEFA', 'VACCO', 'h'),
    ('XYLEFA', 'VACDA', 'h'),
    ('XYLEFA', 'VACVG', 'h'),
    ('XYLEFA', 'VIBTI', 'h'),
    ('XYLEFA', '1VING', 'h'),
    ('XYLEFA', 'VINMI', 'h'),
    ('XYLEFA', 'VIXAC', 'h'),
    ('XYLEFA', '1VITG', 'h'),
    ('XYLEFA', 'VITLA', 'h'),
    ('XYLEFA', 'VITRI', 'h'),
    ('XYLEFA', 'WESRO', 'h'),
    ('XYLEFA', 'WESGL', 'h'),
    ('XYLEFA', 'CJFMI', 'h'),
    ('XYLEFA', 'POPTR', 'e'),
    ('XYLEFA', 'POPCN', 'e'),
    ('XYLEFA', 'SAXAL', 'e'),
    ('XYLEFA', 'SAXCP', 'e');

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
    ('GEOHMO', 'IUGMO', 'h'),
    ('GEOHMO', 'IUGRE', 'h'),
    ('GEOHMO', '1PTFG', 'h'),
    ('GEOHMO', 'PTFFR', 'h'),
    ('GEOHMO', 'PTFRH', 'h'),
    ('GEOHMO', 'PTFST', 'h');

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
    ('ALECSN', 'ANURE', 'h'),
    ('ALECSN', 'ANUSQ', 'h'),
    ('ALECSN', 'ANUAT', 'h'),
    ('ALECSN', 'APTPH', 'h'),
    ('ALECSN', 'ARDUN', 'h'),
    ('ALECSN', 'BGTAC', 'h'),
    ('ALECSN', 'BAUCH', 'h'),
    ('ALECSN', 'BOHVD', 'h'),
    ('ALECSN', 'BOHZB', 'h'),
    ('ALECSN', 'CWSAC', 'h'),
    ('ALECSN', 'CEQSI', 'h'),
    ('ALECSN', 'CINCA', 'h'),
    ('ALECSN', 'CIDAU', 'h'),
    ('ALECSN', 'CLVVT', 'h'),
    ('ALECSN', 'CCNNU', 'h'),
    ('ALECSN', 'CJQAN', 'h'),
    ('ALECSN', 'CYDSS', 'h'),
    ('ALECSN', 'DOSKA', 'h'),
    ('ALECSN', 'DOSMR', 'h'),
    ('ALECSN', 'ENTPH', 'h'),
    ('ALECSN', 'EIOJA', 'h'),
    ('ALECSN', 'EYBHE', 'h'),
    ('ALECSN', 'EUYJA', 'h'),
    ('ALECSN', 'FATSS', 'h'),
    ('ALECSN', 'FIUCA', 'h'),
    ('ALECSN', 'FIURM', 'h'),
    ('ALECSN', 'FIUSS', 'h'),
    ('ALECSN', 'FIUSU', 'h'),
    ('ALECSN', 'FLISS', 'h'),
    ('ALECSN', '1FOLG', 'h'),
    ('ALECSN', 'GNHFA', 'h'),
    ('ALECSN', 'GADJA', 'h'),
    ('ALECSN', 'GOSSS', 'h'),
    ('ALECSN', 'HEEHE', 'h'),
    ('ALECSN', 'HIBCA', 'h'),
    ('ALECSN', 'HIBRS', 'h'),
    ('ALECSN', 'HIBTI', 'h'),
    ('ALECSN', 'LURNO', 'h'),
    ('ALECSN', 'LIQFO', 'h'),
    ('ALECSN', 'MCRTA', 'h'),
    ('ALECSN', 'MCHZU', 'h'),
    ('ALECSN', 'MBEPE', 'h'),
    ('ALECSN', 'MABSS', 'h'),
    ('ALECSN', 'MALSS', 'h'),
    ('ALECSN', 'MANES', 'h'),
    ('ALECSN', 'MRSCO', 'h'),
    ('ALECSN', 'MLORI', 'h'),
    ('ALECSN', 'MYRRU', 'h'),
    ('ALECSN', 'MORAL', 'h'),
    ('ALECSN', 'MUYKO', 'h'),
    ('ALECSN', 'MDAPU', 'h'),
    ('ALECSN', 'PRTTR', 'h'),
    ('ALECSN', 'PEBAM', 'h'),
    ('ALECSN', 'PBOFO', 'h'),
    ('ALECSN', 'PIPKA', 'h'),
    ('ALECSN', 'PIAVE', 'h'),
    ('ALECSN', 'PLIRU', 'h'),
    ('ALECSN', 'PRNAR', 'h'),
    ('ALECSN', 'PRNAV', 'h'),
    ('ALECSN', 'PRNCE', 'h'),
    ('ALECSN', 'PRNDO', 'h'),
    ('ALECSN', 'PRNPS', 'h'),
    ('ALECSN', 'PRNSO', 'h'),
    ('ALECSN', 'PSIGU', 'h'),
    ('ALECSN', 'PUNGR', 'h'),
    ('ALECSN', 'PYECO', 'h'),
    ('ALECSN', 'PYUCO', 'h'),
    ('ALECSN', 'PYUPS', 'h'),
    ('ALECSN', 'PYUPY', 'h'),
    ('ALECSN', 'RHOLH', 'h'),
    ('ALECSN', 'RLLMU', 'h'),
    ('ALECSN', '1ROSG', 'h'),
    ('ALECSN', 'ROSBA', 'h'),
    ('ALECSN', 'ROSCH', 'h'),
    ('ALECSN', 'ROSID', 'h'),
    ('ALECSN', 'ROSDM', 'h'),
    ('ALECSN', 'SAXSS', 'h'),
    ('ALECSN', 'SKOOL', 'h'),
    ('ALECSN', 'CASSM', 'h'),
    ('ALECSN', 'SLEDA', 'h'),
    ('ALECSN', 'SBWSS', 'h'),
    ('ALECSN', 'SYDNO', 'h'),
    ('ALECSN', 'SYZSA', 'h'),
    ('ALECSN', 'TOOCI', 'h'),
    ('ALECSN', 'SAQSE', 'h'),
    ('ALECSN', 'URNLO', 'h'),
    ('ALECSN', 'VIGSQ', 'h'),
    ('ALECSN', 'VITVI', 'h'),
    ('ALECSN', 'XYOCO', 'h'),
    ('ALECSN', 'ZANNI', 'h');

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
    ('AROMBU', 'PRNJP', 'm'),
    ('AROMBU', 'PRNLR', 'm'),
    ('AROMBU', 'PRNMM', 'm'),
    ('AROMBU', 'PRNPS', 'm'),
    ('AROMBU', 'PRNPC', 'm'),
    ('AROMBU', 'PRNSC', 'm'),
    ('AROMBU', 'PRNSO', 'm'),
    ('AROMBU', 'PRNYE', 'm'),
    ('AROMBU', 'CSNMO', 'h'),
    ('AROMBU', 'IUGRE', 'h');

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
    ('DACUDO', 'ALNSA', 'h'),
    ('DACUDO', 'AIIMU', 'h'),
    ('DACUDO', 'ANAOC', 'h'),
    ('DACUDO', 'ANHCO', 'h'),
    ('DACUDO', 'ANUCH', 'h'),
    ('DACUDO', 'ANUGL', 'h'),
    ('DACUDO', 'ANUDI', 'h'),
    ('DACUDO', 'ANUMO', 'h'),
    ('DACUDO', 'ANUMU', 'h'),
    ('DACUDO', 'ANURE', 'h'),
    ('DACUDO', 'ANUSE', 'h'),
    ('DACUDO', 'ANUSQ', 'h'),
    ('DACUDO', 'AJSTO', 'h'),
    ('DACUDO', 'ATDGH', 'h'),
    ('DACUDO', 'ZPSVI', 'h'),
    ('DACUDO', 'ADACN', 'h'),
    ('DACUDO', 'ARMCA', 'h'),
    ('DACUDO', 'AGBEN', 'h'),
    ('DACUDO', 'AGBPI', 'h'),
    ('DACUDO', 'AGBWE', 'h'),
    ('DACUDO', 'BTBMO', 'h'),
    ('DACUDO', 'BTBSI', 'h'),
    ('DACUDO', 'ABFAL', 'h'),
    ('DACUDO', 'ABFCH', 'h'),
    ('DACUDO', 'ABFEL', 'h'),
    ('DACUDO', 'ABFHE', 'h'),
    ('DACUDO', 'ABFIN', 'h'),
    ('DACUDO', 'ABFLA', 'h'),
    ('DACUDO', 'ABFLC', 'h'),
    ('DACUDO', 'ABFNI', 'h'),
    ('DACUDO', 'ABFOD', 'h'),
    ('DACUDO', 'ABFRI', 'h'),
    ('DACUDO', 'ABFSE', 'h'),
    ('DACUDO', 'AVRBI', 'h'),
    ('DACUDO', 'AVRCA', 'h'),
    ('DACUDO', 'AZJEX', 'h'),
    ('DACUDO', 'BCCAN', 'h'),
    ('DACUDO', 'BCCMO', 'h'),
    ('DACUDO', 'BCCRA', 'h'),
    ('DACUDO', 'BCCRF', 'h'),
    ('DACUDO', 'BCTGA', 'h'),
    ('DACUDO', 'BKXBA', 'h'),
    ('DACUDO', 'BGTED', 'h'),
    ('DACUDO', 'BNCHI', 'h'),
    ('DACUDO', 'BIHTR', 'h'),
    ('DACUDO', 'BLISA', 'h'),
    ('DACUDO', 'BASFL', 'h'),
    ('DACUDO', 'BUWGA', 'h'),
    ('DACUDO', 'BUWOP', 'h'),
    ('DACUDO', 'BYIRA', 'h'),
    ('DACUDO', 'BDIST', 'h'),
    ('DACUDO', 'BRNKM', 'h'),
    ('DACUDO', 'BRNPA', 'h'),
    ('DACUDO', 'CLILO', 'h'),
    ('DACUDO', 'CMUIN', 'h'),
    ('DACUDO', 'CTRSS', 'h'),
    ('DACUDO', 'MRRVI', 'h'),
    ('DACUDO', 'CANOD', 'h'),
    ('DACUDO', 'CNBAL', 'h'),
    ('DACUDO', 'CNBCO', 'h'),
    ('DACUDO', 'MAEDU', 'h'),
    ('DACUDO', 'CPPSE', 'h'),
    ('DACUDO', 'CPPTO', 'h'),
    ('DACUDO', 'CPSAN', 'h'),
    ('DACUDO', 'CPSFR', 'h'),
    ('DACUDO', 'KRLBR', 'h'),
    ('DACUDO', 'CBRAR', 'h'),
    ('DACUDO', 'CIAPA', 'h'),
    ('DACUDO', 'CISCA', 'h'),
    ('DACUDO', 'CISSR', 'h'),
    ('DACUDO', 'CAWMI', 'h'),
    ('DACUDO', 'THVPE', 'h'),
    ('DACUDO', 'CSJED', 'h'),
    ('DACUDO', 'CSOSS', 'h'),
    ('DACUDO', 'CAYJA', 'h'),
    ('DACUDO', 'CETFO', 'h'),
    ('DACUDO', 'CIOPA', 'h'),
    ('DACUDO', 'KSQAX', 'h'),
    ('DACUDO', 'CBLIC', 'h'),
    ('DACUDO', 'CSFCA', 'h'),
    ('DACUDO', 'KRZTA', 'h'),
    ('DACUDO', 'CINYA', 'h'),
    ('DACUDO', 'VITRE', 'h'),
    ('DACUDO', 'CITCO', 'h'),
    ('DACUDO', 'CITLA', 'h'),
    ('DACUDO', 'CIDDP', 'h'),
    ('DACUDO', 'CIDGR', 'h'),
    ('DACUDO', 'CIDNA', 'h'),
    ('DACUDO', 'CIDRE', 'h'),
    ('DACUDO', 'CIDSW', 'h'),
    ('DACUDO', 'PMITR', 'h'),
    ('DACUDO', 'CIDAY', 'h'),
    ('DACUDO', 'CIDAF', 'h'),
    ('DACUDO', 'CIDAU', 'h'),
    ('DACUDO', 'CIDCL', 'h'),
    ('DACUDO', 'CIDDE', 'h'),
    ('DACUDO', 'CIDPA', 'h'),
    ('DACUDO', 'CIDSI', 'h'),
    ('DACUDO', 'CIDUN', 'h'),
    ('DACUDO', 'CIDLA', 'h'),
    ('DACUDO', 'CIDLI', 'h'),
    ('DACUDO', 'CIDJA', 'h'),
    ('DACUDO', 'CIDMY', 'h'),
    ('DACUDO', 'CIDNO', 'h'),
    ('DACUDO', 'CIDRP', 'h'),
    ('DACUDO', 'CUSLA', 'h'),
    ('DACUDO', 'CUFRO', 'h'),
    ('DACUDO', 'COCGR', 'h'),
    ('DACUDO', 'CODUV', 'h'),
    ('DACUDO', 'COFAR', 'h'),
    ('DACUDO', 'COFCA', 'h'),
    ('DACUDO', 'CRHAL', 'h'),
    ('DACUDO', 'CRHSS', 'h'),
    ('DACUDO', 'KDLPI', 'h'),
    ('DACUDO', 'KTQCU', 'h'),
    ('DACUDO', 'KRMAS', 'h'),
    ('DACUDO', 'CUMME', 'h'),
    ('DACUDO', 'CUMPR', 'h'),
    ('DACUDO', 'CUMSA', 'h'),
    ('DACUDO', 'CUUMI', 'h'),
    ('DACUDO', 'CUUMA', 'h'),
    ('DACUDO', 'CUUMO', 'h'),
    ('DACUDO', 'CUUPE', 'h'),
    ('DACUDO', 'CYDOB', 'h'),
    ('DACUDO', 'DZSCH', 'h'),
    ('DACUDO', 'DLNOB', 'h'),
    ('DACUDO', 'DMCLO', 'h'),
    ('DACUDO', 'DOSAB', 'h'),
    ('DACUDO', 'DOSAE', 'h'),
    ('DACUDO', 'DOSCS', 'h'),
    ('DACUDO', 'DOSDA', 'h'),
    ('DACUDO', 'DOSDH', 'h'),
    ('DACUDO', 'DOSDC', 'h'),
    ('DACUDO', 'DOSGN', 'h'),
    ('DACUDO', 'DOSJA', 'h'),
    ('DACUDO', 'DOSKA', 'h'),
    ('DACUDO', 'DOSMA', 'h'),
    ('DACUDO', 'DOSMR', 'h'),
    ('DACUDO', 'DOSMF', 'h'),
    ('DACUDO', 'DOSML', 'h'),
    ('DACUDO', 'DOSMN', 'h'),
    ('DACUDO', 'DOSMO', 'h'),
    ('DACUDO', 'DOSDI', 'h'),
    ('DACUDO', 'DOSSA', 'h'),
    ('DACUDO', 'DOSTU', 'h'),
    ('DACUDO', 'DPYPA', 'h'),
    ('DACUDO', 'CSFRX', 'h'),
    ('DACUDO', 'DOVHE', 'h'),
    ('DACUDO', 'DRNRE', 'h'),
    ('DACUDO', 'DRNST', 'h'),
    ('DACUDO', 'DRPFL', 'h'),
    ('DACUDO', 'DURZI', 'h'),
    ('DACUDO', 'DYXPA', 'h'),
    ('DACUDO', 'EHTMI', 'h'),
    ('DACUDO', 'EAEHY', 'h'),
    ('DACUDO', 'EAESE', 'h'),
    ('DACUDO', 'EIOJA', 'h'),
    ('DACUDO', 'EYBSU', 'h'),
    ('DACUDO', 'EUEDO', 'h'),
    ('DACUDO', 'EUEPB', 'h'),
    ('DACUDO', 'EUEUN', 'h'),
    ('DACUDO', 'EXAAG', 'h'),
    ('DACUDO', 'FARBE', 'h'),
    ('DACUDO', 'FARCE', 'h'),
    ('DACUDO', 'FIBTI', 'h'),
    ('DACUDO', 'FIURO', 'h'),
    ('DACUDO', 'FIUBE', 'h'),
    ('DACUDO', 'FIUCA', 'h'),
    ('DACUDO', 'FIUCH', 'h'),
    ('DACUDO', 'FIUER', 'h'),
    ('DACUDO', 'FIUFI', 'h'),
    ('DACUDO', 'FIUHT', 'h'),
    ('DACUDO', 'FIUHS', 'h'),
    ('DACUDO', 'FIULP', 'h'),
    ('DACUDO', 'FIUMI', 'h'),
    ('DACUDO', 'FIUOP', 'h'),
    ('DACUDO', 'FIUPT', 'h'),
    ('DACUDO', 'FIUPU', 'h'),
    ('DACUDO', 'FIURM', 'h'),
    ('DACUDO', 'FIURE', 'h'),
    ('DACUDO', 'FIUSA', 'h'),
    ('DACUDO', 'FIUSE', 'h'),
    ('DACUDO', 'FIUSS', 'h'),
    ('DACUDO', 'FIUSY', 'h'),
    ('DACUDO', 'FIUVR', 'h'),
    ('DACUDO', 'FLCIN', 'h'),
    ('DACUDO', 'FLCRU', 'h'),
    ('DACUDO', 'SEAVI', 'h'),
    ('DACUDO', 'FOLHI', 'h'),
    ('DACUDO', 'FOLJA', 'h'),
    ('DACUDO', 'FOLMA', 'h'),
    ('DACUDO', 'FRACH', 'h'),
    ('DACUDO', 'CSFAL', 'h'),
    ('DACUDO', 'GANAT', 'h'),
    ('DACUDO', 'GANCE', 'h'),
    ('DACUDO', 'GANCS', 'h'),
    ('DACUDO', 'GANCO', 'h'),
    ('DACUDO', 'GANDU', 'h'),
    ('DACUDO', 'GANGR', 'h'),
    ('DACUDO', 'RDEED', 'h'),
    ('DACUDO', 'GANMA', 'h'),
    ('DACUDO', 'GANNN', 'h'),
    ('DACUDO', 'GANPA', 'h'),
    ('DACUDO', 'GANPR', 'h'),
    ('DACUDO', 'GANSU', 'h'),
    ('DACUDO', 'GANVE', 'h'),
    ('DACUDO', 'GANTI', 'h'),
    ('DACUDO', 'GUGFL', 'h'),
    ('DACUDO', 'GLWPE', 'h'),
    ('DACUDO', 'GMEEL', 'h'),
    ('DACUDO', 'GMEPH', 'h'),
    ('DACUDO', 'GNESS', 'h'),
    ('DACUDO', 'GRWAS', 'h'),
    ('DACUDO', 'MOJRO', 'h'),
    ('DACUDO', 'HPXBA', 'h'),
    ('DACUDO', 'HGUMA', 'h'),
    ('DACUDO', 'HXAMO', 'h'),
    ('DACUDO', 'HNXTR', 'h'),
    ('DACUDO', 'HIGKU', 'h'),
    ('DACUDO', 'HOSIR', 'h'),
    ('DACUDO', 'ICAOL', 'h'),
    ('DACUDO', 'INGFA', 'h'),
    ('DACUDO', 'INOFA', 'h'),
    ('DACUDO', 'IRVGA', 'h'),
    ('DACUDO', 'IRVMA', 'h'),
    ('DACUDO', 'IXRJA', 'h'),
    ('DACUDO', 'IXRMA', 'h'),
    ('DACUDO', 'IUGHI', 'h'),
    ('DACUDO', 'IUGNI', 'h'),
    ('DACUDO', 'IUGRE', 'h'),
    ('DACUDO', 'KAESS', 'h'),
    ('DACUDO', 'KEDLE', 'h'),
    ('DACUDO', 'KEMGL', 'h'),
    ('DACUDO', 'LGNSI', 'h'),
    ('DACUDO', 'LADHE', 'h'),
    ('DACUDO', 'LNIDO', 'h'),
    ('DACUDO', 'LQZAL', 'h'),
    ('DACUDO', 'LQZFR', 'h'),
    ('DACUDO', 'LQZRU', 'h'),
    ('DACUDO', 'LQZTE', 'h'),
    ('DACUDO', 'LIEOX', 'h'),
    ('DACUDO', 'LIHCH', 'h'),
    ('DACUDO', 'LISGU', 'h'),
    ('DACUDO', 'LISSA', 'h'),
    ('DACUDO', 'LUFAC', 'h'),
    ('DACUDO', 'LUFAE', 'h'),
    ('DACUDO', 'SOLBI', 'h'),
    ('DACUDO', 'PEBTH', 'h'),
    ('DACUDO', 'CVDCO', 'h'),
    ('DACUDO', 'MLPEM', 'h'),
    ('DACUDO', 'MLPGL', 'h'),
    ('DACUDO', 'MABSD', 'h'),
    ('DACUDO', 'MABSY', 'h'),
    ('DACUDO', 'MAFSI', 'h'),
    ('DACUDO', 'MNGCA', 'h'),
    ('DACUDO', 'MNGCL', 'h'),
    ('DACUDO', 'MNGCS', 'h'),
    ('DACUDO', 'MNGFO', 'h'),
    ('DACUDO', 'MNGGR', 'h'),
    ('DACUDO', 'MNGIN', 'h'),
    ('DACUDO', 'MNGLL', 'h'),
    ('DACUDO', 'MNGLA', 'h'),
    ('DACUDO', 'MNGOD', 'h'),
    ('DACUDO', 'MNGPA', 'h'),
    ('DACUDO', 'MNGQU', 'h'),
    ('DACUDO', 'MNKJA', 'h'),
    ('DACUDO', 'MNKZA', 'h'),
    ('DACUDO', 'MESDO', 'h'),
    ('DACUDO', 'MLQPT', 'h'),
    ('DACUDO', 'MKWTO', 'h'),
    ('DACUDO', 'MMOCO', 'h'),
    ('DACUDO', 'MMOEL', 'h'),
    ('DACUDO', 'MZTMA', 'h'),
    ('DACUDO', 'MOMBA', 'h'),
    ('DACUDO', 'MOMCH', 'h'),
    ('DACUDO', 'MOMCO', 'h'),
    ('DACUDO', 'QLHLO', 'h'),
    ('DACUDO', 'MOFSI', 'h'),
    ('DACUDO', 'MYRRU', 'h'),
    ('DACUDO', 'MOJCI', 'h'),
    ('DACUDO', 'MOJCO', 'h'),
    ('DACUDO', 'MORAL', 'h'),
    ('DACUDO', 'MORNI', 'h'),
    ('DACUDO', 'MUNCA', 'h'),
    ('DACUDO', 'MUYPA', 'h'),
    ('DACUDO', 'MUBAC', 'h'),
    ('DACUDO', 'MUBBA', 'h'),
    ('DACUDO', 'MUBBJ', 'h'),
    ('DACUDO', 'MUBTR', 'h'),
    ('DACUDO', 'MUBPA', 'h'),
    ('DACUDO', 'MHUAR', 'h'),
    ('DACUDO', 'MXXSM', 'h'),
    ('DACUDO', 'NUCLA', 'h'),
    ('DACUDO', 'NUCOR', 'h'),
    ('DACUDO', 'NEKCA', 'h'),
    ('DACUDO', 'NLTSE', 'h'),
    ('DACUDO', 'NEECU', 'h'),
    ('DACUDO', 'NEELA', 'h'),
    ('DACUDO', 'NTGSA', 'h'),
    ('DACUDO', 'NOREM', 'h'),
    ('DACUDO', 'OKRMA', 'h'),
    ('DACUDO', 'OCRMA', 'h'),
    ('DACUDO', 'OLXSC', 'h'),
    ('DACUDO', 'OPICE', 'h'),
    ('DACUDO', 'OPUFI', 'h'),
    ('DACUDO', 'PQIMA', 'h'),
    ('DACUDO', 'PADOD', 'h'),
    ('DACUDO', 'PADTE', 'h'),
    ('DACUDO', 'PNAAN', 'h'),
    ('DACUDO', 'PRKAF', 'h'),
    ('DACUDO', 'PRKSP', 'h'),
    ('DACUDO', 'PAQCO', 'h'),
    ('DACUDO', 'PAQED', 'h'),
    ('DACUDO', 'PAQFO', 'h'),
    ('DACUDO', 'PAQIN', 'h'),
    ('DACUDO', 'PAQLA', 'h'),
    ('DACUDO', 'PAQLI', 'h'),
    ('DACUDO', 'PAQQU', 'h'),
    ('DACUDO', 'PAQSU', 'h'),
    ('DACUDO', 'PAQTR', 'h'),
    ('DACUDO', 'PEBAM', 'h'),
    ('DACUDO', 'QHQMA', 'h'),
    ('DACUDO', 'PHSVX', 'h'),
    ('DACUDO', 'PHXDA', 'h'),
    ('DACUDO', 'PYLAC', 'h'),
    ('DACUDO', 'PYLEM', 'h'),
    ('DACUDO', 'GOCLI', 'h'),
    ('DACUDO', 'PHYMI', 'h'),
    ('DACUDO', 'PHYPE', 'h'),
    ('DACUDO', 'PMTDI', 'h'),
    ('DACUDO', 'PQKDU', 'h'),
    ('DACUDO', 'PMEPI', 'h'),
    ('DACUDO', 'DUCIN', 'h'),
    ('DACUDO', 'POJCM', 'h'),
    ('DACUDO', 'POJCA', 'h'),
    ('DACUDO', 'POJSA', 'h'),
    ('DACUDO', 'POJVI', 'h'),
    ('DACUDO', 'PRESE', 'h'),
    ('DACUDO', 'PRNAR', 'h'),
    ('DACUDO', 'PRNAV', 'h'),
    ('DACUDO', 'PRNCM', 'h'),
    ('DACUDO', 'PRNCF', 'h'),
    ('DACUDO', 'PRNCS', 'h'),
    ('DACUDO', 'PRNCE', 'h'),
    ('DACUDO', 'PRNDV', 'h'),
    ('DACUDO', 'PRNDO', 'h'),
    ('DACUDO', 'PRNMM', 'h'),
    ('DACUDO', 'PRNPS', 'h'),
    ('DACUDO', 'PRNPH', 'h'),
    ('DACUDO', 'PRNSC', 'h'),
    ('DACUDO', 'PDCSI', 'h'),
    ('DACUDO', 'PSICA', 'h'),
    ('DACUDO', 'PSIGU', 'h'),
    ('DACUDO', 'PUNGR', 'h'),
    ('DACUDO', 'PYUCA', 'h'),
    ('DACUDO', 'PYUCO', 'h'),
    ('DACUDO', 'PYUPY', 'h'),
    ('DACUDO', 'RAHWI', 'h'),
    ('DACUDO', 'RHZSS', 'h'),
    ('DACUDO', 'PKIGR', 'h'),
    ('DACUDO', 'RHDTO', 'h'),
    ('DACUDO', 'RLLMU', 'h'),
    ('DACUDO', 'RUBLH', 'h'),
    ('DACUDO', 'RUBRE', 'h'),
    ('DACUDO', 'RUBRO', 'h'),
    ('DACUDO', 'RUBZM', 'h'),
    ('DACUDO', 'SBHFL', 'h'),
    ('DACUDO', 'SBHSE', 'h'),
    ('DACUDO', 'SAJED', 'h'),
    ('DACUDO', 'SLXVE', 'h'),
    ('DACUDO', 'SAMJA', 'h'),
    ('DACUDO', 'SNOKO', 'h'),
    ('DACUDO', 'SNAPA', 'h'),
    ('DACUDO', 'SRPAN', 'h'),
    ('DACUDO', 'SHFFR', 'h'),
    ('DACUDO', 'SLCBB', 'h'),
    ('DACUDO', 'SEHED', 'h'),
    ('DACUDO', 'HCRUN', 'h'),
    ('DACUDO', 'SEBGR', 'h'),
    ('DACUDO', 'SHYIN', 'h'),
    ('DACUDO', 'SMBGL', 'h'),
    ('DACUDO', 'SHDCE', 'h'),
    ('DACUDO', 'SOLAC', 'h'),
    ('DACUDO', 'SOLAE', 'h'),
    ('DACUDO', 'SOLAM', 'h'),
    ('DACUDO', 'SOLAG', 'h'),
    ('DACUDO', 'CYJBE', 'h'),
    ('DACUDO', 'SOLCI', 'h'),
    ('DACUDO', 'SOLVE', 'h'),
    ('DACUDO', 'SOLER', 'h'),
    ('DACUDO', 'SOLGL', 'h'),
    ('DACUDO', 'SOLIA', 'h'),
    ('DACUDO', 'SOLFE', 'h'),
    ('DACUDO', 'SOLSO', 'h'),
    ('DACUDO', 'LYPES', 'h'),
    ('DACUDO', 'SOLMR', 'h'),
    ('DACUDO', 'SOLME', 'h'),
    ('DACUDO', 'SOLMU', 'h'),
    ('DACUDO', 'SOLNI', 'h'),
    ('DACUDO', 'LYPPI', 'h'),
    ('DACUDO', 'SOLPC', 'h'),
    ('DACUDO', 'SOLSE', 'h'),
    ('DACUDO', 'SOLTP', 'h'),
    ('DACUDO', 'SOLST', 'h'),
    ('DACUDO', 'SOLTO', 'h'),
    ('DACUDO', 'SOLTL', 'h'),
    ('DACUDO', 'SOJMA', 'h'),
    ('DACUDO', 'SPXDU', 'h'),
    ('DACUDO', 'SPXMO', 'h'),
    ('DACUDO', 'SPXPI', 'h'),
    ('DACUDO', 'SPXPU', 'h'),
    ('DACUDO', 'STFTE', 'h'),
    ('DACUDO', 'SBWAS', 'h'),
    ('DACUDO', 'SYHME', 'h'),
    ('DACUDO', 'SYHNV', 'h'),
    ('DACUDO', 'SYZAM', 'h'),
    ('DACUDO', 'SYZAQ', 'h'),
    ('DACUDO', 'SYZAR', 'h'),
    ('DACUDO', 'SYZBN', 'h'),
    ('DACUDO', 'SYZME', 'h'),
    ('DACUDO', 'SYZCU', 'h'),
    ('DACUDO', 'SYZFR', 'h'),
    ('DACUDO', 'SYZGR', 'h'),
    ('DACUDO', 'SYZJA', 'h'),
    ('DACUDO', 'SYZLV', 'h'),
    ('DACUDO', 'SYZLI', 'h'),
    ('DACUDO', 'SYZMA', 'h'),
    ('DACUDO', 'SYZNE', 'h'),
    ('DACUDO', 'SYZSA', 'h'),
    ('DACUDO', 'TEMBL', 'h'),
    ('DACUDO', 'TEMCA', 'h'),
    ('DACUDO', 'TEMCH', 'h'),
    ('DACUDO', 'TEMCI', 'h'),
    ('DACUDO', 'THOCA', 'h'),
    ('DACUDO', 'GPTCO', 'h'),
    ('DACUDO', 'TTHOV', 'h'),
    ('DACUDO', 'GPTLE', 'h'),
    ('DACUDO', 'TPHTR', 'h'),
    ('DACUDO', 'UVAGF', 'h'),
    ('DACUDO', 'UVAMA', 'h'),
    ('DACUDO', 'VACRC', 'h'),
    ('DACUDO', 'VAGIN', 'h'),
    ('DACUDO', 'VIBJP', 'h'),
    ('DACUDO', 'VILPA', 'h'),
    ('DACUDO', 'VITAM', 'h'),
    ('DACUDO', 'VITVI', 'h'),
    ('DACUDO', 'WIKPH', 'h'),
    ('DACUDO', 'WIKUV', 'h'),
    ('DACUDO', 'WILCO', 'h'),
    ('DACUDO', 'WILED', 'h'),
    ('DACUDO', 'XAPFL', 'h'),
    ('DACUDO', 'CJFFL', 'h'),
    ('DACUDO', 'CJFMI', 'h'),
    ('DACUDO', 'XIMAM', 'h'),
    ('DACUDO', 'XXLKR', 'h'),
    ('DACUDO', 'TDDAS', 'h'),
    ('DACUDO', 'MEEMU', 'h'),
    ('DACUDO', 'ZEHWA', 'h'),
    ('DACUDO', 'ZIPJU', 'h'),
    ('DACUDO', 'ZIPMA', 'h'),
    ('DACUDO', 'ZIPMU', 'h'),
    ('DACUDO', 'ZIPNU', 'h'),
    ('DACUDO', 'ZIPOE', 'h');

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
    ('POPIJA', '1ROSG', 'm'),
    ('POPIJA', 'VITVI', 'm'),
    ('POPIJA', '1WSTG', 'm'),
    ('POPIJA', 'ZEAMX', 'm'),
    ('POPIJA', 'ACRPA', 'h'),
    ('POPIJA', 'ACRPL', 'h'),
    ('POPIJA', '1ATIG', 'h'),
    ('POPIJA', 'AECHI', 'h'),
    ('POPIJA', 'ALGRO', 'h'),
    ('POPIJA', 'ALUGL', 'h'),
    ('POPIJA', 'ALUJA', 'h'),
    ('POPIJA', 'ALGOF', 'h'),
    ('POPIJA', 'AMCJA', 'h'),
    ('POPIJA', '1ASPG', 'h'),
    ('POPIJA', 'ASPOF', 'h'),
    ('POPIJA', 'BEHRA', 'h'),
    ('POPIJA', 'BETPO', 'h'),
    ('POPIJA', 'CSNCR', 'h'),
    ('POPIJA', 'CSNDE', 'h'),
    ('POPIJA', 'CXEAL', 'h'),
    ('POPIJA', '1CYPF', 'h'),
    ('POPIJA', 'DIUES', 'h'),
    ('POPIJA', 'POLCO', 'h'),
    ('POPIJA', 'FIIKA', 'h'),
    ('POPIJA', 'FRAAN', 'h'),
    ('POPIJA', '1HIBG', 'h'),
    ('POPIJA', 'HIBPA', 'h'),
    ('POPIJA', 'HIBSY', 'h'),
    ('POPIJA', 'HUMLU', 'h'),
    ('POPIJA', 'HYPJA', 'h'),
    ('POPIJA', 'IUGNI', 'h'),
    ('POPIJA', 'KERJA', 'h'),
    ('POPIJA', 'LAEIN', 'h'),
    ('POPIJA', 'MABBA', 'h'),
    ('POPIJA', 'MABFB', 'h'),
    ('POPIJA', 'MALPU', 'h'),
    ('POPIJA', 'MEDSA', 'h'),
    ('POPIJA', 'MEIAZ', 'h'),
    ('POPIJA', 'OCIBA', 'h'),
    ('POPIJA', 'OEOBI', 'h'),
    ('POPIJA', '1PRTG', 'h'),
    ('POPIJA', 'PRTQU', 'h'),
    ('POPIJA', 'POLLA', 'h'),
    ('POPIJA', 'POLOR', 'h'),
    ('POPIJA', 'POLPY', 'h'),
    ('POPIJA', 'PLTOR', 'h'),
    ('POPIJA', 'PLTHY', 'h'),
    ('POPIJA', '1GRAF', 'h'),
    ('POPIJA', 'POPMA', 'h'),
    ('POPIJA', 'POPNT', 'h'),
    ('POPIJA', 'PRNCX', 'h'),
    ('POPIJA', 'PRNCE', 'h'),
    ('POPIJA', 'PRNJP', 'h'),
    ('POPIJA', 'PRNPN', 'h'),
    ('POPIJA', 'PRNSC', 'h'),
    ('POPIJA', 'PRNSO', 'h'),
    ('POPIJA', 'PRNSL', 'h'),
    ('POPIJA', 'PTEAQ', 'h'),
    ('POPIJA', 'QUEAS', 'h'),
    ('POPIJA', 'QUEVB', 'h'),
    ('POPIJA', 'RHERP', 'h'),
    ('POPIJA', 'ROBPS', 'h'),
    ('POPIJA', 'ROSMU', 'h'),
    ('POPIJA', 'RUBCR', 'h'),
    ('POPIJA', '1RUMG', 'h'),
    ('POPIJA', 'SAXDI', 'h'),
    ('POPIJA', 'SAXVI', 'h'),
    ('POPIJA', 'SSAAL', 'h'),
    ('POPIJA', 'SMICH', 'h'),
    ('POPIJA', 'LYPES', 'h'),
    ('POPIJA', 'SOLME', 'h'),
    ('POPIJA', 'SOUAM', 'h'),
    ('POPIJA', 'TILAM', 'h'),
    ('POPIJA', 'TILCO', 'h'),
    ('POPIJA', 'TILJA', 'h'),
    ('POPIJA', 'TILMI', 'h'),
    ('POPIJA', 'TOXQU', 'h'),
    ('POPIJA', 'TRFPR', 'h'),
    ('POPIJA', 'ULMAM', 'h'),
    ('POPIJA', 'ULMPA', 'h'),
    ('POPIJA', 'ULMPR', 'h'),
    ('POPIJA', '1VACG', 'h'),
    ('POPIJA', 'VACCO', 'h'),
    ('POPIJA', 'VITAE', 'h'),
    ('POPIJA', 'VITFL', 'h'),
    ('POPIJA', 'VITLA', 'h'),
    ('POPIJA', 'WSTFL', 'h'),
    ('POPIJA', 'ZELSE', 'h');

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
    ('ANOLCN', 'CIDRE', 'm'),
    ('ANOLCN', 'CIDSI', 'm'),
    ('ANOLCN', 'CIDLI', 'm'),
    ('ANOLCN', 'CYLAV', 'm'),
    ('ANOLCN', '1CTTG', 'm'),
    ('ANOLCN', '1FAUG', 'm'),
    ('ANOLCN', '1LAEG', 'm'),
    ('ANOLCN', 'LAEIN', 'm'),
    ('ANOLCN', '1MABG', 'm'),
    ('ANOLCN', '1PLTG', 'm'),
    ('ANOLCN', 'PLTOC', 'm'),
    ('ANOLCN', 'PLTOR', 'm'),
    ('ANOLCN', '1POPG', 'm'),
    ('ANOLCN', '1PRNG', 'm'),
    ('ANOLCN', '1PYUG', 'm'),
    ('ANOLCN', '1ULMG', 'm'),
    ('ANOLCN', '1ACAG', 'h'),
    ('ANOLCN', 'ACADC', 'h'),
    ('ANOLCN', 'ACRCA', 'h'),
    ('ANOLCN', 'ACROB', 'h'),
    ('ANOLCN', 'ACRMO', 'h'),
    ('ANOLCN', 'ACRPL', 'h'),
    ('ANOLCN', 'ACRPP', 'h'),
    ('ANOLCN', '1AECG', 'h'),
    ('ANOLCN', '1ALBG', 'h'),
    ('ANOLCN', 'ALBJU', 'h'),
    ('ANOLCN', 'CSUST', 'h'),
    ('ANOLCN', 'ALUFI', 'h'),
    ('ANOLCN', 'ALUFM', 'h'),
    ('ANOLCN', 'ALUHI', 'h'),
    ('ANOLCN', 'ALUMX', 'h'),
    ('ANOLCN', 'ALUSB', 'h'),
    ('ANOLCN', '1ARLG', 'h'),
    ('ANOLCN', 'ARLCO', 'h'),
    ('ANOLCN', 'SEVBU', 'h'),
    ('ANOLCN', 'BETPE', 'h'),
    ('ANOLCN', 'BETPL', 'h'),
    ('ANOLCN', 'BETPJ', 'h'),
    ('ANOLCN', 'BRNPA', 'h'),
    ('ANOLCN', 'RHUJV', 'h'),
    ('ANOLCN', '1CAJG', 'h'),
    ('ANOLCN', 'CAJCA', 'h'),
    ('ANOLCN', '1CAHG', 'h'),
    ('ANOLCN', 'CAHOL', 'h'),
    ('ANOLCN', 'CIPBE', 'h'),
    ('ANOLCN', 'CIPLA', 'h'),
    ('ANOLCN', 'CYAIL', 'h'),
    ('ANOLCN', '1CSNG', 'h'),
    ('ANOLCN', 'CSNCR', 'h'),
    ('ANOLCN', '1CSOG', 'h'),
    ('ANOLCN', 'CSOCS', 'h'),
    ('ANOLCN', '1CSUG', 'h'),
    ('ANOLCN', 'CSUEQ', 'h'),
    ('ANOLCN', '1CTLG', 'h'),
    ('ANOLCN', '1CCSG', 'h'),
    ('ANOLCN', '1CNMG', 'h'),
    ('ANOLCN', 'CIDGR', 'h'),
    ('ANOLCN', 'PMITR', 'h'),
    ('ANOLCN', 'CIDAF', 'h'),
    ('ANOLCN', 'CIDAU', 'h'),
    ('ANOLCN', 'CIDUN', 'h'),
    ('ANOLCN', 'CIDJU', 'h'),
    ('ANOLCN', 'CIDLO', 'h'),
    ('ANOLCN', 'CIDNO', 'h'),
    ('ANOLCN', '1CRWG', 'h'),
    ('ANOLCN', '1CSCG', 'h'),
    ('ANOLCN', 'CMYJA', 'h'),
    ('ANOLCN', '1ELGG', 'h'),
    ('ANOLCN', 'ELGMU', 'h'),
    ('ANOLCN', 'ELGUM', 'h'),
    ('ANOLCN', '1EIOG', 'h'),
    ('ANOLCN', 'EIOJA', 'h'),
    ('ANOLCN', 'FAUCR', 'h'),
    ('ANOLCN', 'FAUSY', 'h'),
    ('ANOLCN', '1FIUG', 'h'),
    ('ANOLCN', 'FIUCA', 'h'),
    ('ANOLCN', '1FOLG', 'h'),
    ('ANOLCN', 'FOLMA', 'h'),
    ('ANOLCN', '1FRXG', 'h'),
    ('ANOLCN', 'FRXAM', 'h'),
    ('ANOLCN', '1GREG', 'h'),
    ('ANOLCN', '1HEEG', 'h'),
    ('ANOLCN', 'HEERH', 'h'),
    ('ANOLCN', '1HIBG', 'h'),
    ('ANOLCN', 'HIBMU', 'h'),
    ('ANOLCN', 'HIBSY', 'h'),
    ('ANOLCN', '1ILEG', 'h'),
    ('ANOLCN', 'ILECH', 'h'),
    ('ANOLCN', '1IUGG', 'h'),
    ('ANOLCN', 'IUGMN', 'h'),
    ('ANOLCN', '1LIEG', 'h'),
    ('ANOLCN', 'LIEPR', 'h'),
    ('ANOLCN', '1LIQG', 'h'),
    ('ANOLCN', '1LIHG', 'h'),
    ('ANOLCN', 'LIHCH', 'h'),
    ('ANOLCN', '1MCKG', 'h'),
    ('ANOLCN', 'MCKAM', 'h'),
    ('ANOLCN', 'PEBTH', 'h'),
    ('ANOLCN', '1MLLG', 'h'),
    ('ANOLCN', 'MLLJA', 'h'),
    ('ANOLCN', 'MABAC', 'h'),
    ('ANOLCN', 'MABSD', 'h'),
    ('ANOLCN', 'MABSY', 'h'),
    ('ANOLCN', '1MEIG', 'h'),
    ('ANOLCN', 'MEIAZ', 'h'),
    ('ANOLCN', 'MOMCH', 'h'),
    ('ANOLCN', '1MORG', 'h'),
    ('ANOLCN', 'MORAL', 'h'),
    ('ANOLCN', 'MORBO', 'h'),
    ('ANOLCN', '1OLVG', 'h'),
    ('ANOLCN', 'OLVEU', 'h'),
    ('ANOLCN', '1OSTG', 'h'),
    ('ANOLCN', '1PEBG', 'h'),
    ('ANOLCN', 'PLTHY', 'h'),
    ('ANOLCN', 'POPAL', 'h'),
    ('ANOLCN', 'POPMA', 'h'),
    ('ANOLCN', 'POPNI', 'h'),
    ('ANOLCN', 'POPSI', 'h'),
    ('ANOLCN', 'POPTO', 'h'),
    ('ANOLCN', 'PRNAR', 'h'),
    ('ANOLCN', 'PRNLR', 'h'),
    ('ANOLCN', 'PRNYE', 'h'),
    ('ANOLCN', '1PSIG', 'h'),
    ('ANOLCN', 'PSIGU', 'h'),
    ('ANOLCN', 'PUNGR', 'h'),
    ('ANOLCN', '1PYEG', 'h'),
    ('ANOLCN', 'PYEAN', 'h'),
    ('ANOLCN', 'PYUPY', 'h'),
    ('ANOLCN', 'PYUPC', 'h'),
    ('ANOLCN', 'PYUUS', 'h'),
    ('ANOLCN', '1QUEG', 'h'),
    ('ANOLCN', 'QUEAS', 'h'),
    ('ANOLCN', 'QUEGU', 'h'),
    ('ANOLCN', 'QUEPE', 'h'),
    ('ANOLCN', 'QUERO', 'h'),
    ('ANOLCN', 'QUEGL', 'h'),
    ('ANOLCN', '1RHOG', 'h'),
    ('ANOLCN', '1RHUG', 'h'),
    ('ANOLCN', '1ROBG', 'h'),
    ('ANOLCN', 'ROBPS', 'h'),
    ('ANOLCN', '1ROSG', 'h'),
    ('ANOLCN', 'ROSMU', 'h'),
    ('ANOLCN', 'ROSRG', 'h'),
    ('ANOLCN', '1RUBG', 'h'),
    ('ANOLCN', 'RUBMI', 'h'),
    ('ANOLCN', 'RUBPM', 'h'),
    ('ANOLCN', '1SGRG', 'h'),
    ('ANOLCN', '1SAXG', 'h'),
    ('ANOLCN', 'SAXBA', 'h'),
    ('ANOLCN', 'SAXGS', 'h'),
    ('ANOLCN', 'SAXIG', 'h'),
    ('ANOLCN', 'SAXKO', 'h'),
    ('ANOLCN', 'SAXJE', 'h'),
    ('ANOLCN', '1SAMG', 'h'),
    ('ANOLCN', '1SAQG', 'h'),
    ('ANOLCN', '1SOBG', 'h'),
    ('ANOLCN', '1SOUG', 'h'),
    ('ANOLCN', '1STVG', 'h'),
    ('ANOLCN', 'STXJA', 'h'),
    ('ANOLCN', '1TOOG', 'h'),
    ('ANOLCN', 'TOXVE', 'h'),
    ('ANOLCN', 'SAQSE', 'h'),
    ('ANOLCN', 'ULMJA', 'h'),
    ('ANOLCN', '1VACG', 'h'),
    ('ANOLCN', 'VACCO', 'h'),
    ('ANOLCN', '1VNIG', 'h'),
    ('ANOLCN', 'ALEFO', 'h'),
    ('ANOLCN', '1VIBG', 'h'),
    ('ANOLCN', 'ZANSI', 'h'),
    ('ANOLCN', '1ZELG', 'h'),
    ('ANOLCN', '1ZIPG', 'h');

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
    ('ANOLGL', 'ACRTU', 'm'),
    ('ANOLGL', 'AECHI', 'm'),
    ('ANOLGL', 'BETNI', 'm'),
    ('ANOLGL', '1POPG', 'm'),
    ('ANOLGL', 'POPDE', 'm'),
    ('ANOLGL', 'POPNI', 'm'),
    ('ANOLGL', 'POPCA', 'm'),
    ('ANOLGL', '1SAXG', 'm'),
    ('ANOLGL', 'SAXBA', 'm'),
    ('ANOLGL', '1ACRG', 'h'),
    ('ANOLGL', 'ACRPS', 'h'),
    ('ANOLGL', 'ACRTG', 'h'),
    ('ANOLGL', '1ALBG', 'h'),
    ('ANOLGL', 'ALBJU', 'h'),
    ('ANOLGL', '1ALUG', 'h'),
    ('ANOLGL', '1BETG', 'h'),
    ('ANOLGL', 'BETPE', 'h'),
    ('ANOLGL', 'BRNPA', 'h'),
    ('ANOLGL', 'CAJCA', 'h'),
    ('ANOLGL', '1CIPG', 'h'),
    ('ANOLGL', 'CIPBE', 'h'),
    ('ANOLGL', '1CSUG', 'h'),
    ('ANOLGL', '1CETG', 'h'),
    ('ANOLGL', '1CCPG', 'h'),
    ('ANOLGL', 'CCPJA', 'h'),
    ('ANOLGL', 'CYLCO', 'h'),
    ('ANOLGL', 'ELGAN', 'h'),
    ('ANOLGL', '1FAUG', 'h'),
    ('ANOLGL', 'FAUSY', 'h'),
    ('ANOLGL', '1FRXG', 'h'),
    ('ANOLGL', 'FRXPE', 'h'),
    ('ANOLGL', '1GLIG', 'h'),
    ('ANOLGL', '1KOTG', 'h'),
    ('ANOLGL', 'KOTPA', 'h'),
    ('ANOLGL', 'MLLJA', 'h'),
    ('ANOLGL', '1MABG', 'h'),
    ('ANOLGL', 'MABSD', 'h'),
    ('ANOLGL', '1MEIG', 'h'),
    ('ANOLGL', 'MEIAZ', 'h'),
    ('ANOLGL', '1MORG', 'h'),
    ('ANOLGL', 'MORAL', 'h'),
    ('ANOLGL', '1PLTG', 'h'),
    ('ANOLGL', 'PLTOC', 'h'),
    ('ANOLGL', 'PLTOR', 'h'),
    ('ANOLGL', 'POPBA', 'h'),
    ('ANOLGL', 'POPCT', 'h'),
    ('ANOLGL', 'POPLA', 'h'),
    ('ANOLGL', 'POPMA', 'h'),
    ('ANOLGL', 'POPSM', 'h'),
    ('ANOLGL', 'PRNSL', 'h'),
    ('ANOLGL', 'PRNYE', 'h'),
    ('ANOLGL', 'PYUBR', 'h'),
    ('ANOLGL', 'QUERU', 'h'),
    ('ANOLGL', 'SAXNI', 'h'),
    ('ANOLGL', '1SOUG', 'h'),
    ('ANOLGL', 'SOUAU', 'h'),
    ('ANOLGL', '1ULMG', 'h'),
    ('ANOLGL', 'ULMAM', 'h'),
    ('ANOLGL', 'ULMPA', 'h'),
    ('ANOLGL', 'ULMPU', 'h'),
    ('ANOLGL', 'ALEMN', 'h');

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
    ('IPSXTY', 'PIEGL', 'h'),
    ('IPSXTY', 'PIEJE', 'h'),
    ('IPSXTY', 'PIEOR', 'h'),
    ('IPSXTY', 'PIUCE', 'h'),
    ('IPSXTY', 'PIUKO', 'h'),
    ('IPSXTY', 'PIUSB', 'h'),
    ('IPSXTY', 'PIUSI', 'h'),
    ('IPSXTY', 'PSTME', 'h');

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
    ('HYPHCU', 'CYLAV', 'h'),
    ('HYPHCU', 'CYLCO', 'h'),
    ('HYPHCU', 'HUMLU', 'h'),
    ('HYPHCU', 'IUGRE', 'h'),
    ('HYPHCU', '1MABG', 'h'),
    ('HYPHCU', '1MORG', 'h'),
    ('HYPHCU', '1PRNG', 'h'),
    ('HYPHCU', 'PRNCE', 'h'),
    ('HYPHCU', '1PYUG', 'h'),
    ('HYPHCU', 'VITVI', 'h'),
    ('HYPHCU', '2WOOP', 'h');

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
    ('THAUPI', 'PIUPN', 'h'),
    ('THAUPI', 'PIURA', 'h');

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
    ('THAUPR', '1ACAG', 'h'),
    ('THAUPR', '1BETG', 'h'),
    ('THAUPR', '1CSCG', 'h'),
    ('THAUPR', '1FAUG', 'h'),
    ('THAUPR', '1IUGG', 'h'),
    ('THAUPR', '1PIUG', 'h'),
    ('THAUPR', 'QUERU', 'h'),
    ('THAUPR', '1SOUG', 'h');

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
    ('MELGGC', 'BRSOB', 'h'),
    ('MELGGC', 'CPSAN', 'h'),
    ('MELGGC', 'CPSFR', 'h'),
    ('MELGGC', 'CTURO', 'h'),
    ('MELGGC', 'PESGL', 'h'),
    ('MELGGC', 'CXSES', 'h'),
    ('MELGGC', 'CRGCA', 'h'),
    ('MELGGC', 'CORSA', 'h'),
    ('MELGGC', 'CUMSA', 'h'),
    ('MELGGC', 'CYGCI', 'h'),
    ('MELGGC', 'ELECO', 'h'),
    ('MELGGC', 'FIMDP', 'h'),
    ('MELGGC', 'GLXMA', 'h'),
    ('MELGGC', 'HORVX', 'h'),
    ('MELGGC', 'IPABA', 'h'),
    ('MELGGC', 'KYLGR', 'h'),
    ('MELGGC', 'LACSA', 'h'),
    ('MELGGC', 'LOLMU', 'h'),
    ('MELGGC', 'MUBAC', 'h'),
    ('MELGGC', 'MUBSS', 'h'),
    ('MELGGC', 'PANMI', 'h'),
    ('MELGGC', 'PEUSS', 'h'),
    ('MELGGC', 'PHSVX', 'h'),
    ('MELGGC', 'POXDR', 'h'),
    ('MELGGC', 'PIBSX', 'h'),
    ('MELGGC', 'SACOF', 'h'),
    ('MELGGC', 'SETIT', 'h'),
    ('MELGGC', 'LYPES', 'h'),
    ('MELGGC', 'SOLME', 'h'),
    ('MELGGC', 'SOLTU', 'h'),
    ('MELGGC', 'SORVU', 'h'),
    ('MELGGC', 'SPQOL', 'h'),
    ('MELGGC', 'TRFRE', 'h'),
    ('MELGGC', 'TRZAX', 'h'),
    ('MELGGC', 'VICFX', 'h'),
    ('MELGGC', 'PHSMU', 'h'),
    ('MELGGC', 'PHSAU', 'h'),
    ('MELGGC', 'VIGSI', 'h'),
    ('MELGGC', 'ZEAMX', 'h');

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
    ('PHYP64', 'VITCO', 'h'),
    ('PHYP64', 'VITHD', 'h'),
    ('PHYP64', 'VITLA', 'h'),
    ('PHYP64', 'VITPE', 'h'),
    ('PHYP64', 'VITRI', 'h'),
    ('PHYP64', 'VITRU', 'h'),
    ('PHYP64', 'VITVS', 'h'),
    ('PHYP64', 'VITCH', 'h'),
    ('PHYP64', 'VITDO', 'h'),
    ('PHYP64', 'CHYCA', 'e'),
    ('PHYP64', 'VICFX', 'e');
