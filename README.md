# IE 47_YELODATA

This repository contains the skeleton of the ***Analysis of Commuter Mobility and Public Transport Utilization in Agglomerate Communes of La Rochelle*** project. Due to the large size of the data files ([Population Census](https://www.insee.fr/fr/statistiques/7637844?sommaire=7637890#consulter), [Complete folder of La Rochelle Communes](https://www.insee.fr/fr/statistiques/2011101?geo=EPCI-241700434#consulter-sommaire), and [Sirene database of companies and their establishments](https://www.data.gouv.fr/fr/datasets/base-sirene-des-entreprises-et-de-leurs-etablissements-siren-siret/#/information)) and the R environment, they are not included in this repository. However, all the necessary code, smaller databases and scripts written for the project are available here.

This comprehensive study aims to unravel the intricate dynamics of commuter mobility and public transport utilization within the Agglomerate Communes of La Rochelle. Leveraging diverse open-source datasets, including IRIS-France, La Rochelle Open Data, INSEE, and the Yelo La Rochelle website, the analysis is centered on eight specific communes within the larger metropolitan area. The primary objective is to assess the flow of working citizens, scrutinize current public transport needs, and identify potential areas for improvement.

## The Databases include:

### [IRIS - France (geojson file):](https://public.opendatasoft.com/explore/dataset/georef-france-iris/information/?disjunctive.reg_name&disjunctive.dep_name&disjunctive.arrdep_name&disjunctive.ze2020_name&disjunctive.bv2022_name&disjunctive.epci_name&disjunctive.ept_name&disjunctive.com_name&disjunctive.com_arm_name&disjunctive.iris_name&sort=year&refine.year=2023&dataChart=eyJxdWVyaWVzIjpbeyJjb25maWciOnsiZGF0YXNldCI6Imdlb3JlZi1mcmFuY2UtaXJpcyIsIm9wdGlvbnMiOnsiZGlzanVuY3RpdmUucmVnX25hbWUiOnRydWUsImRpc2p1bmN0aXZlLmRlcF9uYW1lIjp0cnVlLCJkaXNqdW5jdGl2ZS5hcnJkZXBfbmFtZSI6dHJ1ZSwiZGlzanVuY3RpdmUuemUyMDIwX25hbWUiOnRydWUsImRpc2p1bmN0aXZlLmJ2MjAyMl9uYW1lIjp0cnVlLCJkaXNqdW5jdGl2ZS5lcGNpX25hbWUiOnRydWUsImRpc2p1bmN0aXZlLmVwdF9uYW1lIjp0cnVlLCJkaXNqdW5jdGl2ZS5jb21fbmFtZSI6dHJ1ZSwiZGlzanVuY3RpdmUuY29tX2FybV9uYW1lIjp0cnVlLCJkaXNqdW5jdGl2ZS5pcmlzX25hbWUiOnRydWUsInNvcnQiOiJ5ZWFyIiwicSI6ImxhIHJvY2hlbGxlIiwicmVmaW5lLnllYXIiOiIyMDIzIiwicmVmaW5lLmVwY2lfbmFtZSI6IkNBIGRlIExhIFJvY2hlbGxlIn19LCJjaGFydHMiOlt7ImFsaWduTW9udGgiOnRydWUsInR5cGUiOiJsaW5lIiwiZnVuYyI6IkNPVU5UIiwic2NpZW50aWZpY0Rpc3BsYXkiOnRydWUsImNvbG9yIjoiI0ZGNTE1QSJ9XSwieEF4aXMiOiJ5ZWFyIiwibWF4cG9pbnRzIjoiIiwidGltZXNjYWxlIjoieWVhciIsInNvcnQiOiIifV0sImRpc3BsYXlMZWdlbmQiOnRydWUsImFsaWduTW9udGgiOnRydWV9&q=CA+La+rochelle&location=11,46.13346,-1.07323&basemap=jawg.light)  
Geographical information forms the bedrock for spatial analysis, enabling the mapping and exploration of commune distributions.

### [La Rochelle Open Data — Transport Yelo - GTFS Stop des Bus:](https://opendata.agglo-larochelle.fr/visualisation/information/?id=transport_yelo___gtfs_stop_des_bus&dataChart=eyJxdWVyaWVzIjpbeyJjb25maWciOnsiZGF0YXNldCI6InRyYW5zcG9ydF95ZWxvX19fZ3Rmc19zdG9wX2Rlc19idXMiLCJvcHRpb25zIjp7ImlkIjoidHJhbnNwb3J0X3llbG9fX19ndGZzX3N0b3BfZGVzX2J1cyJ9fSwiY2hhcnRzIjpbeyJhbGlnbk1vbnRoIjp0cnVlLCJ0eXBlIjoiY29sdW1uIiwiZnVuYyI6IkFWRyIsInlBeGlzIjoic3RvcF9pZCIsInNjaWVudGlmaWNEaXNwbGF5Ijp0cnVlLCJjb2xvciI6IiM2NmMyYTUifV0sInhBeGlzIjoic3RvcF9pZCIsIm1heHBvaW50cyI6NTAsInNvcnQiOiIifV0sInRpbWVzY2FsZSI6IiIsImRpc3BsYXlMZWdlbmQiOnRydWUsImFsaWduTW9udGgiOnRydWV9)  
This dataset provides invaluable insights into public transport infrastructure, focusing on bus stops and routes.

### [Yelo La Rochelle website:](https://yelo.agglo-larochelle.fr/lignes-et-plans/)  
While lacking a structured dataset, this source contributes essential information on bus lines and other transit-related details. However, reliance on manual data entry introduces potential limitations.

### [INSEE — Mobilités professionnelles des individus:](https://www.insee.fr/fr/statistiques/7637844?sommaire=7637890#consulter)  
This dataset from INSEE sheds light on commuting patterns in 2020, offering crucial information about the movement of individuals between residence and workplace.

### [INSEE — Dossier complet Intercommunalité-Métropole de CA de La Rochelle:](https://www.insee.fr/fr/statistiques/2011101?geo=EPCI-241700434#consulter-sommaire)  
A comprehensive source providing detailed information on the La Rochelle metropolitan area, including demographic data and the broader regional context.

### [Sirene database of companies and their establishments:](https://www.data.gouv.fr/fr/datasets/base-sirene-des-entreprises-et-de-leurs-etablissements-siren-siret/#/information)
A comprehensive source providing detailed information on all french companies, including location, worker count and industry type.

### [Sirene nomenclatures:](https://www.insee.fr/fr/information/2406147)
Datasets used to understand the sirene nomenclatures.

---

**Study Area:**  
The analysis focuses on eight specific communes within the Agglomerate Communes of La Rochelle: *Bourgneuf*, *Montroy*, *Clavette*, *La Jarrie*, *Saint-Médard d’Aunis*, *Saint-Christophe*, *Croix-Chapeau*, and *Salles-sur-Mer.*
